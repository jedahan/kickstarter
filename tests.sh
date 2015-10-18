#!/bin/bash

set -e

. assert.sh/assert.sh

export PATH="bin:$PATH"

assert 'project Awesome_Sauce 500' \
'Added Awesome_Sauce project with target of $500'

assert 'back John Awesome_Sauce 4111111111111111 50' \
'John backed project Awesome_Sauce for $50'

assert 'back Sally Awesome_Sauce 1234567890123456 10' \
'ERROR: This card is invalid'

assert 'back Jane Awesome_Sauce 4111111111111111 50' \
'ERROR: That card has already been added by another user!'

assert 'back Jane Awesome_Sauce 5555555555554444 50' \
''

assert 'list Awesome_Sauce' \
'-- John backed for $50' \
'-- Jane backed for $50' \
'Awesome_Sauce needs $400 more dollars to be successful'

assert 'back Mary Awesome_Sauce 5474942730093167 400' \
'Mary backed project Awesome_Sauce for $400'

assert 'list Awesome_Sauce' \
'-- John backed for $50' \
'-- Jane backed for $50' \
'-- Mary backed for $400' \
'Awesome_Sauce is successful!'

assert 'backer John' \
'-- Backed Awesome_Sauce for $50'

assert_end tests
