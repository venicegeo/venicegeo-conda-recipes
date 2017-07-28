export PATH="$HOME/miniconda2/bin:$PATH"
rm -rf ~/miniconda2/conda-bld
cd share/recipes
vendoredFolders=$(ls)
for f in $vendoredFolders; do
  conda build $f
done
ls ~/miniconda2/conda-bld/linux-64
