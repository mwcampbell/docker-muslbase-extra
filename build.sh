#!/bin/bash

# Setup
set -e
umask 022
jobs=-j8
export LC_ALL=POSIX
export DEPS=$SRC/deps
export PATCHDIR=$SRC/patches

for script in $SRC/steps/*
do
  mkdir /work
  cd /work
  echo Running $script
  . $script
  cd /
  rm -rf /work
  hash -r
done
