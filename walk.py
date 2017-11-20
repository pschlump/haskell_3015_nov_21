import os

for dirname, dirnames, filenames in os.walk('.'):
    # print path to all filenames.
    for filename in filenames:
        print(os.path.join(dirname, filename))

