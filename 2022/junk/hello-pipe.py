#!/usr/bin/python3

def greet(name="world"):
    return "Hello, {}.".format(name)

def ask_name(default="world"):
    name = input("Name please [{}]: ".format(default))
    if name == '':
        name = default

    return name

def upcase(string):
    return string.upper()

def pipe(*fns):
    def pipeline(*args):
        for fn in fns:
            if type(args) == tuple:
                args = fn(*args)
            else:
                args = fn(args)

        return args

    return pipeline

# print(greet(upcase(ask_name())))
pipe(ask_name, upcase, greet, print)()

# print(greet(upcase(ask_name("Bob"))))
pipe(ask_name, upcase, greet, print)("Bob")

