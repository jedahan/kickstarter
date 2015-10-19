#!/bin/bash

set -e

. assert.sh/assert.sh

[ -f db.json ] && rm db.json

assert './ksr.py project Awesome_Sauce 500' \
'Added Awesome_Sauce project with target of $500'

assert './ksr.py back John Awesome_Sauce 4111111111111111 50' \
'John backed project Awesome_Sauce for $50'

assert './ksr.py back Sally Awesome_Sauce 1234567890123456 10' \
'ERROR: This card is invalid'

assert './ksr.py back Jane Awesome_Sauce 4111111111111111 50' \
'ERROR: That card has already been added by another user!'

assert './ksr.py back Jane Awesome_Sauce 5555555555554444 50' \
'Jane backed project Awesome_Sauce for $50'

assert './ksr.py list Awesome_Sauce' \
'-- John backed for $50\n'\
'-- Jane backed for $50\n'\
'Awesome_Sauce needs $400 more dollars to be successful'

assert './ksr.py back Mary Awesome_Sauce 5474942730093167 400' \
'Mary backed project Awesome_Sauce for $400'

assert './ksr.py list Awesome_Sauce' \
'-- John backed for $50\n'\
'-- Jane backed for $50\n'\
'-- Mary backed for $400\n'\
'Awesome_Sauce is successful!'

assert './ksr.py backer John' \
'-- Backed Awesome_Sauce for $50'

assert './ksr.py project Floating_target 500.01' \
'Added Floating_target project with target of $500.01'

assert './ksr.py back Kwabena Floating_target 4563960122001999 50.01' \
'Kwabena backed project Floating_target for $50.01'

assert './ksr.py list Floating_target' \
'-- Kwabena backed for $50.01\n'\
'Floating_target needs $450 more dollars to be successful'

assert './ksr.py project Add_then_remove 500' \
'Added Add_then_remove project with target of $500'

assert './ksr.py back Kwabena Add_then_remove 4563960122001999 50.01' \
'Kwabena backed project Add_then_remove for $50.01'

assert './ksr.py back Kwabena Add_then_remove 4563960122001999 0' \
'Kwabena is no longer backing Add_then_remove'

assert './ksr.py list Add_then_remove' \
'Add_then_remove needs $500 more dollars to be successful'

assert './ksr.py back Mary Add_then_remove 4222222222220 99.99' \
'Mary backed project Add_then_remove for $99.99'

assert './ksr.py list Add_then_remove' \
'-- Mary backed for $99.99\n'\
'Add_then_remove needs $400.01 more dollars to be successful'

assert './ksr.py backer Mary' \
'-- Backed Awesome_Sauce for $400\n'\
'-- Backed Add_then_remove for $99.99'


assert_end tests
