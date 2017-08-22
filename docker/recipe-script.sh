export PATH="$HOME/miniconda2/bin:$PATH"
echo Clearing out conda-bld
rm -rf ~/miniconda2/conda-bld
echo Rebuilding conda-bld
mkdir -p ~/miniconda2/conda-bld/linux-64
mkdir -p ~/miniconda2/conda-bld/noarch
conda index ~/miniconda2/conda-bld/linux-64
conda index ~/miniconda2/conda-bld/noarch
echo Removing defaults
conda config --remove channels defaults
echo Adding nexus
conda config --add channels CONDA_CHANNEL
echo Adding local
conda config --add channels local
cd share/recipes
vendoredFolders=$(ls)
for f in $vendoredFolders; do
  echo "Starting build for $f"
  conda build $f --old-build-string -q
done
cd
toKeep=$(ls ~/miniconda2/conda-bld/linux-64)
for f in $toKeep; do
  echo $f
done
mkdir linux-64 && cd linux-64
wget -q -r -l1 -e robots=off -nH -nd --reject="index.html*" --no-parent --no-cookies SED_CHANNEL/linux-64/ --user=SED_USER --password=SED_PASSWORD
mv ~/miniconda2/conda-bld/linux-64/* .
conda index .
deleteString="find . -type f"
for f in $toKeep; do
  deleteString=$deleteString" ! -name $f"
done
deleteString=$deleteString" -delete"
$deleteString
cd ..
mv linux-64 share/
