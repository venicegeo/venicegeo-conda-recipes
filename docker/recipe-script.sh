export PATH="$HOME/miniconda2/bin:$PATH"
echo Clearing out conda-bld
rm -rf ~/miniconda2/conda-bld
echo Rebuilding conda-bld
mkdir -p ~/miniconda2/conda-bld/linux-64
mkdir -p ~/miniconda2/conda-bld/noarch
conda index ~/miniconda2/conda-bld/linux-64
conda index ~/miniconda2/conda-bld/noarch
echo Adding local
conda config --add channels local
echo Adding nexus
conda config --add channels https://proxy:proxy@nexus.devops.geointservices.io/content/repositories/beachfront-conda
echo Adding conda-forge
conda config --add channels conda-forge
echo Adding bioconda
conda config --add channels bioconda
echo Adding defaults
conda config --add channels defaults
cd share/recipes
vendoredFolders=$(ls)
for f in $vendoredFolders; do
  echo $f
  conda build $f
done
ls ~/miniconda2/conda-bld/linux-64
