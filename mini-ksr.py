#!/usr/bin/env python3
import sys

command = sys.argv[0].split('/')[-1]

if command == 'ksr':
  sys.argv.pop(0)
  command = sys.argv[0].split('/')[-1]

if command == "project":
  project = sys.argv[1]
  target = int(sys.argv[2])
  print("Added %s project with target of $%i" % (project, target) )
elif command == "back":
  person = sys.argv[1]
  project = sys.argv[2]
  card = sys.argv[3]
  amount = sys.argv[4]
  print("%s backed project %s $%i" % (person, project, amount) )
