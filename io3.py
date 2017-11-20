import os
import sys

def ls(aFn):
    fn = []
    for filename in os.listdir(aFn):
        if filename[0:1] != ".":
            fn.insert ( 0, filename )

    fn.sort()
    for filename in fn:
        print ( filename )


if len(sys.argv) <= 1:
    ls(".")
else:
    for i in range ( 1, len(sys.argv) ):
        ls(sys.argv[i])
