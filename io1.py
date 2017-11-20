import sys
print ( "Some Input Please? ", end='' )
sys.stdout.flush()
line = sys.stdin.readline()
line = line.strip('\n')
print ( "Echo of ->{0}<-".format(line) )
