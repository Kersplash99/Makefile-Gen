#!/bin/bash
# created by: Ammar Abbas

# create the MakeFile
touch Makefile

# create and set default variables
compiler="gcc"
flags="-Wall -std=c99"


# add in compiler information
echo "# compiler to use" > MakeFile
echo "CC = ${compiler}" >> MakeFile
echo "" >> MakeFile

# add in compiler flags and options
echo "# compiler flags (c99 standard)" >> MakeFile
echo "CFLAGS = ${flags}" >> MakeFile
echo "" >> MakeFile

# are there enough options
if [ "$#" -ge "1"  ]; then
  # target file name (executable file)
  target="$1";
  if [ -n "$target" ]; then
    echo "# target files" >> MakeFile
    echo "${target}: ${target}.o" >> MakeFile
  fi
fi
