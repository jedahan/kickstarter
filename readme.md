# ksr - commandline kickstarter [![Build Status](https://travis-ci.org/jedahan/kickstarter.svg)](https://travis-ci.org/jedahan/kickstarter)

ksr is a mini kickstarter platform for the commandline

    pip3 install ksr
    ksr --help

## Help

You can use `ksr --help` for a quick reference of all the commands, or `ksr command --help`
 for more details about a particular command. Do not hesitate to [create a github issue](https://github.com/jedahan/kickstarter/issues) or join our chat channel [on the web](http://webchat.freenode.net/?randomnick=1&channels=%23ksr&uio=d4) or [via irc](irc://irc.freenode.net/ksr) if anything is unclear.

## Installation

`ksr` is in the python package repositories, so `pip install ksr` should get you the latest stable release.

If you are in bash, you can activate shell completion with `eval "$(_KSR_COMPLETE=source ksr)"`

## Testing and Development

The tests require [assert.sh](https://github.com/dansoton/assert.sh), which are included as a submodule, and can be installed with `git submodule update --init --recursive`

Run the tests via `./tests.sh`. `ksr` has only been tested on python 3.5 on osx.

If you'd like to contribute, thanks! To install the modifiable source code directly, try `pip install -e .`

## Quick Reference

    Usage: ksr COMMAND [ARGS]...

    Commands:
      project  Create a new project
      back     Back a project
      backer   List a backer's backings
      list     List project details, or all projects if no...

ksr can create a project, list a project, back a project, or list a backers backings.

    ksr back PERSON PROJECT CREDIT_CARD AMOUNT

Have a PERSON back a PROJECT for AMOUNT dollars with a CREDIT_CARD

    ksr project NAME TARGET

Create a project called NAME with a target dollar amount of TARGET

    ksr list [NAME]

If no name is given, list all projects. If a NAME is given, list all
  the people who backed the project, how much they backed it for, and if
  the project is successfull or how much more funds it needs.

    ksr backer NAME

List all the projects a particular backer has backed, and for how much


## Example Session

Here is an example session, which should give you a feel for typical commands:

```bash
> project Awesome_Sauce 500
Added Awesome_Sauce project with target of $500

> back John Awesome_Sauce 4111111111111111 50
John backed project Awesome_Sauce for $50

> back Jane Awesome_Sauce 5555555555554444 50
Jane backed project Awesome_Sauce for $50

> list Awesome_Sauce
-- John backed for $50
-- Jane backed for $50
Awesome_Sauce needs $400 more dollars to be successful

> back Mary Awesome_Sauce 5474942730093167 400
Mary backed project Awesome_Sauce for $400

> list Awesome_Sauce
-- John backed for $50
-- Jane backed for $50
-- Mary backed for $400
Awesome_Sauce is successful!

> backer John
-- Backed Awesome_Sauce for $50
```
