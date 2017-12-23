#!/bin/bash
# created by: Ammar Abbas

# create and set default variables
compiler="gcc"
std="c99"
target=""
has_dep="0" # true if there are multiple files

# set up the flags, dependencies and temp files to clean
declare -a flags
declare -a dep
declare -a clean

# extract data from options
while getopts "dwgs:c:t:f:r:d" OPTION; do
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
    tmp_files="$OPTARG"
    if [ -z "$tmp_files" ]; then
      echo "Temporary file to clean cannot be an empty string."
      exit 1;
    fi

    clean=($tmp_files)
    ;;
  d) # the make file has mulitple dependencies
    has_dep="1"
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

# is there a target file
if [ -n "$target" ]; then
  echo "# target files" >> MakeFile

  echo -n "${target}: ${target}.o" >> MakeFile

  # are there multiple dependencies
  if [ "$has_dep" -eq "1" ]; then
    read -p "Enter dependencies of target: " -a dep
    for file in "${dep[@]}"; do
      echo -n " ${file%.*}.o" >> MakeFile
    done
  fi

  echo "" >> Makefile
  echo "" >> MakeFile
fi

# are there dependencies
if [ ${#dep[@]} -gt "0" ]; then
  echo "# dependencies" >> MakeFile
  # add target file so that its dependencies are accounted
  dep=("$target" "${dep[@]}")

  for tar in  "${dep[@]}"; do
    echo -n "${tar%.*}.o:" >> MakeFile
    declare -a headers

    read -p "Enter header files included in ${tar}: " -a headers
    for file in "${headers[@]}"; do
      echo -n " ${file%.*}.h" >> MakeFile
    done
    echo "" >> Makefile
  done

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
