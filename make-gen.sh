#!/bin/bash
# created by: Ammar Abbas

type=$1
name=$2

if [ -n "$type" -a -n "$name" -a "$type" == "Makefile" ]; then
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

  # add the specified target
  if [ -n "$name" ]; then 
    echo "# target files" >> MakeFile
    echo "$name: $name.o" >> MakeFile
  fi

else
  echo "Syntax: gen <type> <name>"
  echo "Valid Types: Makefile"
fi


