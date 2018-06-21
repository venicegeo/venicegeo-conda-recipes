#!/bin/bash
v=$1
if [ -z "$v" ]; then
  exit 1
fi
cd recipes
for f in $(ls); do
  cd "$f"
  pwd
  sed -i "s/REPLACE_VERSION/$v/g" meta.yaml
  sed -i "s/REPLACE_VERSION/$v/g" checkout.txt
  cd ..
done
