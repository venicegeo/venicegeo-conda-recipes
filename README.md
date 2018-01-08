# venicegeo-conda-recipes
Conda recipes for the venicegeo channel.

## Purpose of This Repo
This repository contains the Venice Geo conda recipes to build each of the
the actual projects located under `./vendor`. It's a _meta_ repository.

Using [Anaconda](https://www.anaconda.com/download/#linux), you can build and 
deploy almost any langauge and application to PCF by using the PCF Python Buildpack.

## How to Build

The directories located under the `./vendor` directory are [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) which can be thought of as git repos within a git
repo.

Each project points to a specific commit in the submodule's history.

After cloning this repository for the first time, you'll need to activate the
submodule's:

1. `$ git submodule update --init --recursive`

Or if you happen to be using a newer version of git, when you clone this repository,
you can have git recursively clone the submodules as well:

1. `$ git clone --recursive $PROJECT_URL`

After one of the above commands, your `./vendor` directories will contain clones
with `HEAD` pointing at the commit specified in this repository.

## Updating a submodule to point to a different commit

First, change to the project you want to update. For this example, we'll use
`pzsvc-exec`:

1. `$ cd vendor/pzsvc-exec`

Next, like you would in any repository, fetch the desired commit. For our example,
we want to update `pzsvc-exec` to the latest commit in the master branch:

1. `$ git fetch origin`
2. `$ git merge origin/master`

or just

1. `$ git pull`

If you happen to like doing everything at once.

Now, change directories back to the `./vendor` directory, and add and commit
your changes:

1. `$ cd ../`
2. `$ git add pzsvc-exec`
3. `$ git commit -m "Use latest to incoroprate bugfix #1234"`

You're done!

## Caveats
This repository contains a `.gitmodules` file, which specifies which commit
the respective submodules point to.
