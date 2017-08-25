#!/bin/bash

user=$1
pass=$2
channel_url=$3

creds_channel_url=https://$user:$pass@$channel_url
channel_url=https://$channel_url

rm -f $HOME/.condarc
echo Clearing out conda-bld
rm -rf $HOME/miniconda2/conda-bld
echo Removing defaults
conda config --remove channels defaults
echo Adding nexus
conda config --add channels $creds_channel_url
conda install conda-build -y -q
echo Rebuilding conda-bld
mkdir -p $HOME/miniconda2/conda-bld/linux-64
mkdir -p $HOME/miniconda2/conda-bld/noarch
conda index $HOME/miniconda2/conda-bld/linux-64
conda index $HOME/miniconda2/conda-bld/noarch
echo Adding local
conda config --add channels local
cd recipes
vendoredFolders=$(ls)
for f in $vendoredFolders; do
  echo "Starting build for $f"
  conda build $f --old-build-string -q
done
cd ..
toKeep=$(ls $HOME/miniconda2/conda-bld/linux-64)
for f in $toKeep; do
  echo $f
done
mkdir linux-64 && cd linux-64
wget -q -r -l1 -e robots=off -nH -nd --reject="index.html*" --no-parent --no-cookies $channel_url/linux-64/ --user=$user --password=$pass
mv $HOME/miniconda2/conda-bld/linux-64/* .
conda index .
deleteString="find . -type f"
for f in $toKeep; do
  deleteString=$deleteString" ! -name $f"
done
deleteString=$deleteString" -delete"
echo $deleteString
$deleteString
