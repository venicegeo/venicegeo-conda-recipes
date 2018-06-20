#!/bin/bash
tag=$1
if [ -z "$tag" ]; then
  exit 1
fi
cd recipes
for f in $(ls); do
  cd "$f"
  pwd
  tmp=$(cat checkout.txt)
  echo $tmp" "$tag > checkout.txt
  i=0
  sed -i "s/beachfront x/beachfront $tag/g" meta.yaml
  sed -i "s/version: x/version: $tag/g" meta.yaml
  cd ..
done
