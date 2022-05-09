#!/usr/bin/python3

import sqlite3

# BEWARE: Untested, undocumented, unsuitable for serious use.
# Prototype of what may become lapwing

schema = """
CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type_id INTEGER
);

CREATE TABLE types (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE properties (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  item_id INTEGER,
  key TEXT,
  value TEXT
)
"""


# Python to SQLite3 Data Type Mapping Reference:
# source: https://docs.python.org/3/library/sqlite3.html#introduction
#
# Python => SQLite3
#
# None   => NULL
# int    => INTEGER
# float  => REAL
# str    => TEXT
# bytes  => BLOB


config = {'DATABASE': ':memory:'}

def connect(config=config):
    return sqlite3.connect(config['DATABASE'])

def initialize(conn):
    c = conn.cursor()
    c.executescript(schema)
    conn.commit()

class Item():

    def __init__(self, _type, _id=None, **kwargs):

        if isinstance(_type, str) or isinstance(_type, int):
            self._type = _type
        else:
            raise TypeError("_type must be string or integer")

        if isinstance(_id, int) or _id is None:
            self._id = _id
        else:
            raise TypeError("_id must be integer or None")

        for name, value in kwargs.items():
            self.__setattr__(name, value)

    def _is_valid_value(self, value):
        if value is None:
            return True
        elif isinstance(value, int):
            return True
        elif isinstance(value, float):
            return True
        elif isinstance(value, str):
            return True
        elif isinstance(value, bytes):
            return True
        return False

    def __setattr__(self, name, value):
        if isinstance(name, str):
            if self._is_valid_value(value):
                self.__dict__[name] = value
            else:
                raise TypeError('value must be valid type')
        else:
            raise TypeError('property key/name must be string')

    def __getattr__(self, name):
        return self.__dict__.get(name, None)


class ItemStore():

    insert_type = 'INSERT INTO types (name) VALUES (?)'
    select_type_by_name = 'SELECT id, name FROM types WHERE name = ?'
    select_type_by_id = 'SELECT id, name FROM type WHERE id = ?'
    insert_item = 'INSERT INTO items (type_id) VALUES (?)'
    update_item = 'UPDATE items SET type_id = ? WHERE id = ?'
    select_item = 'SELECT id FROM items WHERE id = ?'
    insert_property = 'INSERT INTO properties (item_id, key, value) VALUES (?, ?, ?)'
    update_property = 'UPDATE properties SET value = ? WHERE id = ?'
    select_property = 'SELECT id FROM properties WHERE item_id = ? AND key = ?'

    def __init__(self, conn):
        self.conn = conn

    def type_by_id(self, type_id):
        c = self.conn.cursor()
        item_type = c.execute(self.select_type_by_id, (type_id, )).fetchall()
        if item_type:
            return item_type
        return None

    def type_by_name(self, type_name):
        c = self.conn.cursor()
        item_type = c.execute(self.select_type_by_name, (type_name, )).fetchall()
        if item_type:
            return item_type
        else:
            # Type with this name doesn't exist yet, create and return
            c.execute(self.insert_type, (type_name, ))
            type_id = c.lastrowid
            self.conn.commit()
            return (type_id, type_name)
        return None

    def get_type_id(self, _type):
        if isinstance(_type, str):
            item_type = self.type_by_name(_type)
        elif isinstance(_type, int):
            item_type = self.type_by_id(_type)
        if item_type:
            return item_type[0]
        return None

    def new(self, item, type_id):
        c = self.conn.cursor()
        c.execute(self.insert_item, (type_id, ))
        item._id = c.lastrowid

        for key in item.__dict__.keys():
            c.execute(self.insert_property, (item._id, key, item.__dict__[key]))

        self.conn.commit()
        return item

    def update(self, item, type_id):
        c = self.conn.cursor()
        c.execute(self.update_item, (item._type, item._id))

        for key in item.__dict__.keys():
            property_id = None
            prop = c.execute(self.select_property,
                                    (item._id, key)).fetchone()
            if prop:
                property_id = prop[0]
            if property_id:
                c.execute(self.update_property, (item.__dict__[key], property_id))
            else:
                c.execute(self.insert_property, (item._id, key, item.__dict__[key]))

        self.conn.commit()
        return item

    def add(self, item):
        c = self.conn.cursor()
        type_id = self.get_type_id(item._type)
        if not type_id:
            raise ValueError("Cannot store item, it has an invalid _type")
        if item._id:
            return self.update(item, type_id)
        return self.new(item, type_id)

    def filter(self, type=None, properties=None):
        # TODO: if type, constrain results to objects of given type
        # TODO: if key, dict, constrain results to keys (and if values not *, values)
        #for key, value in properties.items()
        pass #=> [item, item, item ...]

    def get(self, item_id):
        # join properties for item of id, returning item instance with properites
        # set accordingly
        c = self.conn.cursor()
        item_data = c.execute(self.select_item, (item_id, )).fetchfall()
        if not item_data:
            return None
        return item_data

        # TODO: Get all the properties for the current object
        # TODO: Construct Item instance from returned data
        #=> item | None

if __name__ == '__main__':
    conn = connect()
    initialize(conn)
    store = ItemStore(conn)

    # Add item with properties
    taskelot_project = store.add(
        Item('project',
             name='taskelot',
             archived=0,
             category='programming',
        )
    )

    # Update property of item
    taskelot_project.archived = 1
    store.add(taskelot_project)

    c = conn.cursor()
    p_list = c.execute('SELECT * FROM properties WHERE item_id = 1').fetchall()
    print(p_list)
