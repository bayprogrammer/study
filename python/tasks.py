#!/usr/bin/python3

# Implement a simple in-memory task object hierarchy using standard
# data structures.

class Task(object):
    def __init__(self, name, tags=None, categories=None, projects=None,
                 tasks=None):
        self.name = (name or [])
        self.tags = (tags or [])
        self.categories = (categories or [])
        self.projects = (projects or [])
        self.tasks = (tasks or [])

        self.root = False
        if name == "root":
            self.root = True

    def add(self, *args, **kwargs):
        task = Task(*args, **kwargs)
        self.tasks.append(task)
        return task

    def hierarchy(self, indent_width="  ", depth=0):
        indent = ""
        if depth:
            indent += indent_width * depth

        hier = ""
        if not self.root:
            hier += "{}{}\n".format(indent, self.name)
            depth += 1
            for task in self.tasks:
                hier += task.hierarchy(indent_width, depth)
            depth -= 1
        else:
            for task in self.tasks:
                hier += task.hierarchy(indent_width, depth)
        return hier

    def print_hier(self, indent_width="  "):
        print(self.hierarchy(indent_width).strip())

    def __repr__(self):
        return '<Task ({}): {}>'.format(id(self), self.name)

if __name__ == '__main__':
    root = Task('root')
    root.add('get the milk')
    t = root.add("buy today's newspaper")
    t = root.tasks[0].add("drive to the store")
