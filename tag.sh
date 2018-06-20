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
  while IFS='' read -r line || [[ -n "$line" ]]; do
    if [ $i == 2 ]; then
      echo "  version: "$tag >> tmp
    else
      echo "$line" >> tmp
    fi
    i=$((i+1))
  done < "meta.yaml"
  mv "tmp" "meta.yaml"
  cd ..
done
