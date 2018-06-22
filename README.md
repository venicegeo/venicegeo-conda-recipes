# venicegeo-conda-recipes
Conda recipes for the venicegeo channel.

## Purpose of This Repo
This repository contains the Venice Geo conda recipes to build each of the
the actual recipes located under `./recipes`. It's a _meta_ repository.

Using [Anaconda](https://www.anaconda.com/download/#linux), you can build and 
deploy almost any langauge and application to PCF by using the PCF Python Buildpack.

## How to Build

Every recipe in the `./recipes` folder should contain a `checkout.txt`. This contains a single line with the full repo name, ex. venicegeo/beachfront-py, and an optional checkout symbol, ex. 1.0.0. If the checkout symbol is blank, assume master. Simply clone that repository and checkout the symbol, then run `conda build`.

## Creating Release

There is a `tag.sh` script that tags in a new tag as an argument and creates a new tag on this repository, but changes all build version to the new tag
