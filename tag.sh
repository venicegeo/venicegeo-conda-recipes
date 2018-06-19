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
    echo "$line" >> tmp
    if [ $i == 1 ]; then
      echo "  version: "$tag >> tmp
    fi
    i=$((i+1))
  done < "meta.yaml"
  mv "tmp" "meta.yaml"
  cd ..
done
