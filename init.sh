#!/bin/bash

git submodule init
git submodule update
git submodule foreach -q --recursive 'git checkout $(git config -f $toplevel/.gitmodules submodule.$name.checkout)'