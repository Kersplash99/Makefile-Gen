#!/bin/bash
# created by: Ammar Abbas

# create the MakeFile
touch Makefile

# create and set default variables
compiler="gcc"
flags="-Wall -std=c99"
target=""

# extract data from options
while getopts "c:t:" OPTION; do
  case $OPTION in
  c) # user defined compiler
    compiler="$OPTARG"
    if [ -z "$compiler" ]; then
      echo "Compile cannot be an empty string"
      exit 1;
    fi
    ;;
  t) # user defined target file
    target="$OPTARG";
    if [ -z "$target" ]; then
      echo "Target file name cannot be an empty string"
      exit 1;
    fi
    ;;
  *) # undefined option
    echo "Incorrect option entered."
    exit 1
    ;;
  esac
done

# add in compiler information
echo "# compiler to use" > MakeFile
echo "CC = ${compiler}" >> MakeFile
echo "" >> MakeFile

# add in compiler flags and options
echo "# compiler flags (c99 standard)" >> MakeFile
echo "CFLAGS = ${flags}" >> MakeFile
echo "" >> MakeFile

if [ -n "$target" ]; then
  echo "# target files" >> MakeFile
  echo "${target}: ${target}.o" >> MakeFile
fi

exit 0
