#!/bin/env bash

ls -al
tar xvf potrace-1.15.linux-x86_64.tar.gz
cd potrace-1.15.linux-x86_64
./configure --with-libpotrace
make
make install

