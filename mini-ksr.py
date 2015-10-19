#!/usr/bin/env python3
import click
import sys

backings = set()

@click.group()
def cli():
  """ksr is a command line tool to manage crowdfunding campaigns"""
  global projects
  projects = dict()
  pass

def error(string):
  print(string)
  sys.exit(1)

@cli.command()
@click.argument('name')
@click.argument('target', type=int)
def project(name, target):
  """Create a new project"""
  if name in projects:
    error("Project %s already exists, please choose a unique name" % name)
  else:
    projects[name] = target
    print("Added %s project with target of $%i" % (name, target) )

@cli.command('list')
@click.argument('project', required=False)
def list_project(project):
  """List project details, or all projects if no name is specified"""
  if project not in projects:
    if len(projects) > 0:
      print("Projects:\n-- "+"\n-- ".join(projects))
  else:
    amount = 0
    for backing in backings:
      amount = amount + backing.amount
      print("-- %s backed for $%i" % (backing.name, backing.amount) )
    if amount > projects[project]:
      print("%s is successfull!")
    else:
      print("%s needs %i more dollars to be successful" % projects[name] - amount)

@cli.command('back')
@click.argument('person')
@click.argument('project')
@click.argument('credit_card', type=int)
@click.argument('amount', type=int)
def back(person, project, credit_card, amount):
  """Back a project"""
  if project not in projects:
    error("Project %s does not exist" % project)
  backings.add({
    person: person,
    project: project,
    credit_card: credit_card,
    amount: amount})
  print("%s backed project %s $%i" % (person, project, amount) )

if __name__ == "__main__":
    cli()
