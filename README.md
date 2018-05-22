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

The `.gitmodules` file contains the list of vendored projects.

After cloning this repository for the first time, you'll need to activate the
submodule's:

  `$ ./init.sh`

This will initalize the repositories as well as set their `HEAD`s to the values specified in `.gitmodules`

## Updating a submodule to point to a different commit

For this example, we'll use `pzsvc-exec`:

1. Find the entry in the `.gitmodules` list.
    `[submodule "vendor/pzsvc-exec"]`

2. Edit the checkout tag to your liking.
    `checkout = 1.0.0` -> `checkout = 2.0.0`

You're done!
