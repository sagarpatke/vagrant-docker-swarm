#!/bin/bash

ansible-galaxy install -r roles.yml -p roles
vagrant up
