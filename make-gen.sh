#!/bin/bash
# created by: Ammar Abbas

# create and set default variables
compiler="gcc"
std="c99"
target=""

# set up the flags and temp files to clean
declare -a flags
declare -a clean

# extract data from options
while getopts "wgs:c:t:f:r:" OPTION; do
  case $OPTION in
  c) # user defined compiler
    compiler="$OPTARG"
    if [ -z "$compiler" ]; then
      echo "Compile cannot be an empty string."
      exit 1;
    fi
    ;;
  t) # user defined target file
    # shave of the file extension if there is one
    target=${OPTARG%.*}
    if [ -z "$target" ]; then
      echo "Target file name cannot be an empty string."
      exit 1;
    fi
    ;;
  s) # user defined standard
    std="$OPTARG"
    if [ -z "$std" ]; then
      echo "Standard cannot be an empty string."
      exit 1;
    fi
    ;;
  w) # enable -Wall
    flags=("${flags[@]}" "-Wall")
    ;;
  g) # enable debugging
    flags=("${flags[@]}" "-g")
    ;;
  f) # user defined compiler flags
    custom_flags="$OPTARG"
    if [ -z "$custom_flags" ]; then
      echo "Custom flags cannot be empty."
      exit 1;
    fi

    flags=("${flags[@]}" "$custom_flags")
    ;;
  r) # file to remove
    tmp_file="$OPTARG"
    if [ -z "$tmp_file" ]; then
      echo "Temporary file to clean cannot be an empty string."
      exit 1;
    fi

    clean=("${clean[@]}" "$tmp_file")
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
  echo "" >> MakeFile
fi

if [ ${#clean[@]} -gt 0 ]; then
  # add in files to clean
  echo "# remove unwanted temporary files" >> MakeFile
  echo "clean:" >> Makefile

  for file in "${clean[@]}"; do
    echo "  rm -f ${file}" >> MakeFile
  done
  echo "" >> MakeFile
fi

exit 0
