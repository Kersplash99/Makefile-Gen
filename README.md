# Makefile-Gen

This script provides a template to generate a simple Makefile for c99 code. This is currently bare-bones,
will be added in the future. 

Currently, the script will only produce a template for a Makefile with the flags "-Wall -std=c99"
and will only work with one file. This template can be generated and then edited if need be.


## Usage

First add the bash script to the ~/bin/ folder (on OSX) and run

```chmod +x make-gen.sh```

To use the generator -> ```./make-gen.sh ...``` in the bash terminal you use	 

For eg, to generate a Makefile for the file example.c, run the comman:

```./make-gen.sh -c gcc -t example```

## Options

* -t <file-name>

		Option to add a target file.

* -c <compiler>
	
		Option to use preffered compiler.
		Defaults to 'gcc'

* -w

                Compile with '-Wall' flag

* -g 

		Compile with debugging '-g' flag enabled

* -s <std>

		Specify the standard of C/C++ to use.
		Defaults to c99.

* -f "<custom flag> ..."

		Add other flags/ compiler option.
		Requires a string put flags in double quotes.
			
		eg. ./make-gen.sh -t test.c -w -g -s c99 -f "-DNDEBUG"

## Features

- [x] generates a Makefile
- [x] user-defined compiler support
- [x] remove the need to put in the file name without extensions
- [x] user defined compiler flags
- [x] user defined compiler standard
- [ ] user-defined clean functionality
- [ ] mulitple file and dependency support
