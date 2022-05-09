#!/bin/bash

sed '{ s/#.*$//g; }' "$1" | tr '\n' ' ' | sed '{ s/\ *$/\n/g; s/^\ *//g; s/\ \+/ /g }'

