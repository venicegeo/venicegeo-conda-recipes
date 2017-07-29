#!/bin/bash

export GOPATH=$PWD
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
mkdir -p src/github.com/venicegeo/pzsvc-exec
mv `ls | grep -v src` src/github.com/venicegeo/pzsvc-exec/
cd src/github.com/venicegeo/pzsvc-exec && go build
cd pzsvc-taskworker && go build
mv $GOPATH/src/github.com/venicegeo/pzsvc-exec/pzsvc-exec $PREFIX/bin/
mv $GOPATH/src/github.com/venicegeo/pzsvc-exec/pzsvc-taskworker/pzsvc-taskworker $PREFIX/bin/
