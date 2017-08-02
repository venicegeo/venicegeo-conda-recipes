export PATH="$HOME/miniconda2/bin:$PATH"
echo Clearing out conda-bld
rm -rf ~/miniconda2/conda-bld
echo Rebuilding conda-bld
mkdir -p ~/miniconda2/conda-bld/linux-64
mkdir -p ~/miniconda2/conda-bld/noarch
conda index ~/miniconda2/conda-bld/linux-64
conda index ~/miniconda2/conda-bld/noarch
echo Adding bioconda
conda config --add channels bioconda
echo Adding conda-forge
conda config --add channels conda-forge
echo Adding nexus
conda config --add channels https://proxy:proxy@nexus.devops.geointservices.io/content/repositories/beachfront-conda
echo Adding local
conda config --add channels local
cd share/recipes
vendoredFolders=$(ls)
for f in $vendoredFolders; do
  echo $f
  conda build $f --old-build-string
done
cd
toKeep=$(ls ~/miniconda2/conda-bld/linux-64)
for f in $toKeep; do
  echo $f
done
echo
ls ~/miniconda2/conda-bld/linux-64
echo
ls
echo
mkdir linux-64 && cd linux-64
wget -r -l1 -e robots=off -nH -nd --reject="index.html*" --no-parent --no-cookies https://nexus.devops.geointservices.io/content/repositories/beachfront-conda/linux-64/ --user=proxy --password=proxy
for f in $toKeep; do
  rm $f
done
echo
mv ~/miniconda2/conda-bld/linux-64/* .
cd .. && conda index linux-64 && cd linux-64
find . -type f ! -name 'repodata.*' ! -name $toKeep -delete
ls
