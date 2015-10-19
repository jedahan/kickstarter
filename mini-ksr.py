#!/usr/bin/env python3
import click
import sys
from tinydb import TinyDB, where

db = TinyDB('db.json')
projects = db.table('projects')
backings = db.table('backings')

@click.group()
def cli():
  """ksr is a command line tool to manage crowdfunding campaigns"""
  pass

def error(string):
  print(string)
  sys.exit(1)

def get_project(name):
  return projects.get(where('name') == name) or error("Project %r not found" % name)

@cli.command()
@click.argument('name')
@click.argument('target', type=int)
def project(name, target):
  """Create a new project"""
  if projects.search(where('name') == name):
    error("Project %s already exists, please choose a unique name" % name)
  else:
    projects.insert({'name': name, 'target': target})
    print("Added %s project with target of $%i" % (name, target) )

@cli.command('list')
@click.argument('name', required=False)
def list_project(name):
  """List project details, or all projects if no name is specified"""
  if name == None:
    all_projects = projects.all()
    if len(all_projects):
      print("Projects:\n-- " + "\n-- ".join([p['name'] for p in all_projects]))
  else:
    project = get_project(name)
    amount = 0
    for backing in backings.all():
      amount = amount + backing['amount']
      print("-- %s backed for $%i" % (backing['person'], backing['amount']) )
    if amount > project['target']:
      print("%s is successfull!")
    else:
      print("%s needs %i more dollars to be successful" % (name, project['target'] - amount))

@cli.command('back')
@click.argument('person')
@click.argument('project')
@click.argument('credit_card', type=int)
@click.argument('amount', type=float)
def back(person, project, credit_card, amount):
  """Back a project"""
  project = get_project(project)
  backing = {
    'person': person,
    'project': project,
    'credit_card': credit_card,
    'amount': amount}
  if backings.contains((where('person')==person) & (where('project')==project)):
    error("%r has already backed %r" % (person, project))
  else:
    backings.insert(backing)
    print("%s backed project %s for $%i" % (person, project['name'], amount) )

if __name__ == "__main__":
    cli()
