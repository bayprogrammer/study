#!/usr/bin/python3

class Singleton:
    instance = None

    def __new__(cls):
        if cls.instance:
            return cls.instance

        cls.instance = super(cls, cls).__new__(cls)
        return cls.instance
