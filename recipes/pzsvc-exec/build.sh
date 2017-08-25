#!/bin/bash

export GOPATH=$PWD
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$PATH
mkdir -p src/github.com/venicegeo/pzsvc-exec
mv `ls | grep -v src` src/github.com/venicegeo/pzsvc-exec/ && mkdir bin
cd src/github.com/venicegeo/pzsvc-exec && go install
cd pzsvc-taskworker && go install
cp $GOBIN/* $PREFIX/bin/
