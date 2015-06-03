#!/usr/bin/python3

# Implement a simple in-memory task object hierarchy using standard
# Python container prototcols/interfaces.

# TODO:
# [ ] TaskList behaves like a Python list (or maybe dict?)
# [ ] TaskList contains 0 or more Task instances
# [ ] Task contains details for a single Task instance
# [ ] Task has an attribute, sub_tasks, which is an instance of TaskList

class Task(object):
    def __init__(self, task_list, name):
        self.name = name
        self.task_list = task_list

    def __repr__(self):
        return self.name

    def save(self):
        # TODO: should add or update task in self.task_list
        pass

class TaskList(list):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def new(self, name):
        task = Task(task_list=self, name=name)
        self.append(task)
        return task

    def index(self, value, start=None, stop=None):
        index = 0;
        for task in self:
            if task.name == value:
                return index
            index += 1
        return ValueError('Task ' + value + ' not found')

if __name__ == '__main__':
    task_list = TaskList()
    task_list.new('get the milk')
    t = task_list.new("buy today's newspaper")
