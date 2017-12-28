# Makefile-Gen

This bash script generates a Makefile. Makefiles are build automation tools that are smart and reduce the effort and time it can take to build projects.

## Usage

First add the bash script to the ~/bin/ folder (on OSX) and run

```chmod +x make-gen.sh```

To use the generator -> ```./make-gen.sh ...``` in the bash terminal you use	 

For eg, to generate a Makefile for the file example.c, run the comman:

```./make-gen.sh -c gcc -t example```

## Options

* -c \<compiler\>
	
		Option to use preferred compiler.
		Defaults to 'gcc'

* -w

		Compile with '-Wall' flag


* -s \<std\>

		Specify the standard of C/C++ to use.
		Defaults to c99.

* -f "\<custom-flag\> ..."

		Add other flags/compiler options.
			
		eg. ./make-gen.sh -t test.c -w -g -s c99 -f "-DNDEBUG"

* -g 

		Compile with debugging '-g' flag enabled

* -e \<file-name\>

		Option to add an executable file.

* -d
	
		Project has multiple dependencies

* -r "\<tmp-file\> ..."

		Will create clean functionality in the Makefile for the specified files.

## Features

- [x] generates a Makefile
- [x] user-defined compiler support
- [x] remove the need to put in the file name without extensions
- [x] user defined compiler flags
- [x] user defined compiler standard
- [x] user-defined clean functionality
- [x] mulitple file and dependency support
- [ ] user proof input option, prevent flags to be duplicated etc
