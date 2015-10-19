# ksr - A mini kickstarter platform for the commandline

ksr is a mini kickstarter platform for the commandline. After cloning, you will probably want to `alias ksr=$PWD/bin/ksr` to immediately start using `ksr`.

You can use `ksr help` for a quick reference of all the commands, or `ksr help [command]` for more details about a particular command.

## Installation

This has only been tested on python 3.5. It requires the click module, which can be installed with `pip install click`

## Commands

### project
`ksr project [Project_Name] [Target_Dollars]`, for example `ksr project Awesome_Sauce 500`

To create a new project, just pick a project name and dollar amount for it to be successfull. Your project name must be unique, and cannot be changed.

