#!/bin/bash
# created by: Ammar Abbas

# create the MakeFile
touch Makefile

# add in compiler information
echo "# compiler to use" > MakeFile
echo "CC = gcc" >> MakeFile
echo "" >> MakeFile

# add in compiler flags and options
echo "# compiler flags (c99 standard)" >> MakeFile
echo "CFLAGS = -Wall -std=c99" >> MakeFile
echo "" >> MakeFile

# are there enough options
if [ "$#" -lt "2"  ]; then
  echo "Incorrect options."
  echo "Syntax: make-gen.sh <target name> ..."
else
  # target file name (executable file)
  target = $1;
  if [ -n "$target" ]; then
    echo "# target files" >> MakeFile
    echo "$target: $target.o" >> MakeFile
  fi
fi
