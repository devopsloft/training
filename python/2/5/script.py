#!/usr/bin/python3

f = open("text.txt", "ab")
f.write(b"hello world, again\n")
f.write(b"... and again\n")
f.close()
