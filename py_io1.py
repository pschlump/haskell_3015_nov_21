
import sys

print ( "Some Input Please? ", end='' )
sys.stdout.flush()
line = sys.stdin.readline()
print ( "Echo of ->{0}<-".format(line) )

