#!/usr/bin/env bash

# don't overwrite files.
set -o noclobber

# Exit if no arguments were provided.
[ $# -eq 0 ] && { echo "Usage: $0 [target directory]"; exit 1; }

# the first argument passed into the script should be the dir
# where you want the folder structure setup

echo "Setting up folder structure in $1"

if [ ! -d "$1" ]; then
    mkdir $1
fi
cd $1
mkdir doc data src bin tmp results

cd doc
echo "Doc directory with one subdirectory per manuscript" > README
touch .gitkeep

cd ../data
echo "Data directory for storing fixed data sets" > README
touch .gitkeep

cd ../src
echo "Src directory for source code" > README
touch .gitkeep

cd ../bin
echo "Bin directory for compiled binaries or scripts" > README
touch .gitkeep

cd ../tmp
echo "Tmp directory for temporary files that don't need to be stored long-term" > README
touch .gitkeep

cd ../results
echo "Results directory for tracking computational experiments peformed on data" > README
touch .gitkeep

echo "Folders created."

cd ..

cat > README.md << EOF
#computational-project-cookie-cutter
A cookie cutter (aka project template) to set up a folder structure for a computational project.
This is a quick way to setup a folder structure that follows one standard to organize a project.
This helps with project management, reproducibility, sharing, and publishing your data, analysis, and results.

This project was forked from chendaniely, originally inspired (and modeled off) by:

[Noble WS 2009 A Quick Guide to Organizing Computational Biology Projects. PLoS Comput Biol 5 7: e1000424. doi:10.1371/journal.pcbi.1000424](http://dx.doi.org/10.1371/journal.pcbi.1000424)

## What it does
The \`setup_project_dir.sh\` script creates the following folder structure:

    Path_Provided
    |- doc/           # directory for documentation, one subdirectory for manuscript
    |
    |- data/          # directory for storing fixed data sets
    |
    |- src/           # directory for any source code
    |
    |- bin/           # directory for any compiled binaries or scripts
    |
    |- tmp/           # directory for temporary files that don't need to be stored long-term
    |
    |- results/       # directory for output for tracking computational experiments performed on data

A README containing a brief blurb is placed in each folder.
This is because git will not track empty folders and placing a README will
remind you of what goes in each folder, and also the overall
folder structure will be retained

If you use a webservice in conjunction with your version control (e.g. github, bitbucket, gitlabs, gitbucket, etc)
the webservice will be able to render these README and other [markdown](https://help.github.com/articles/markdown-basics/) files automatically.

This project was taken from [this](https://github.com/chendaniely/computational-project-cookie-cutter) github repo
EOF
echo "Top-level README.md created"
