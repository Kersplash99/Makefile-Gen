#!/bin/bash
# created by: Ammar Abbas

# create and set default variables
compiler="gcc"
std="c99"
target=""

# set up the flags
declare -a flags

# extract data from options
while getopts "wgs:c:t:f:" OPTION; do
  case $OPTION in
  c) # user defined compiler
    compiler="$OPTARG"
    if [ -z "$compiler" ]; then
      echo "Compile cannot be an empty string"
      exit 1;
    fi
    ;;
  t) # user defined target file
    # shave of the file extension if there is one
    target=${OPTARG%.*}
    if [ -z "$target" ]; then
      echo "Target file name cannot be an empty string"
      exit 1;
    fi
    ;;
  s) # user defined standard
    std="$OPTARG"
    if [ -z "$std" ]; then
      echo "Standard cannot be an empty string"
      exit 1;
    fi
    ;;
  w) # enable -Wall
    flags=("${flags[@]}" "-Wall")
    ;;
  g) # enable debugging
    flags=("${flags[@]}" "-g")
    ;;
  f) # user defined standard
    custom_flags="$OPTARG"
    if [ -z "$custom_flags" ]; then
      echo "Standard cannot be an empty string"
      exit 1;
    fi

    flags=("${flags[@]}" "$custom_flags")
    ;;
  *) # undefined option
    echo "Incorrect option entered."
    exit 1
    ;;
  esac
done

# set up the flags
flags=("${flags[@]}" "-std=$std")

# create the MakeFile
touch Makefile

# add in compiler information
echo "# compiler tom use" > MakeFile
echo "CC = ${compiler}" >> MakeFile
echo "" >> MakeFile

# add in compiler flags and options
echo "# compiler flags (c99 standard)" >> MakeFile
echo "CFLAGS = ${flags[@]}" >> MakeFile
echo "" >> MakeFile

if [ -n "$target" ]; then
  echo "# target files" >> MakeFile
  echo "${target}: ${target}.o" >> MakeFile
fi

exit 0
