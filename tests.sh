#!/bin/bash

set -e

. assert.sh/assert.sh

export PATH="bin:$PATH"

[ -f db.json ] && rm db.json

assert 'ksr project Awesome_Sauce 500' \
'Added Awesome_Sauce project with target of $500'

assert 'ksr back John Awesome_Sauce 4111111111111111 50' \
'John backed project Awesome_Sauce for $50'

assert 'ksr back Sally Awesome_Sauce 1234567890123456 10' \
'ERROR: This card is invalid'

assert 'ksr back Jane Awesome_Sauce 4111111111111111 50' \
'ERROR: That card has already been added by another user!'

assert 'ksr back Jane Awesome_Sauce 5555555555554444 50' \
'Jane backed project Awesome_Sauce for $50'

assert 'ksr list Awesome_Sauce' \
'-- John backed for $50\n'\
'-- Jane backed for $50\n'\
'Awesome_Sauce needs $400 more dollars to be successful'

assert 'ksr back Mary Awesome_Sauce 5474942730093167 400' \
'Mary backed project Awesome_Sauce for $400'

assert 'ksr list Awesome_Sauce' \
'-- John backed for $50\n'\
'-- Jane backed for $50\n'\
'-- Mary backed for $400\n'\
'Awesome_Sauce is successful!'

assert 'ksr backer John' \
'-- Backed Awesome_Sauce for $50'

assert_end tests
