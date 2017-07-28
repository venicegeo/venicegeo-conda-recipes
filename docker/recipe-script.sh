export PATH="$HOME/miniconda2/bin:$PATH"
rm -rf ~/miniconda2/conda-bld
conda config --add channels local
conda config --add channels https://proxy:proxy@nexus.devops.geointservices.io/content/repositories/beachfront-conda
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels default
cd share/recipes
vendoredFolders=$(ls)
for f in $vendoredFolders; do
  conda build $f
done
ls ~/miniconda2/conda-bld/linux-64
