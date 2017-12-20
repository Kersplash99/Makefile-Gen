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
	Note* do not include the file extensions or else the Makefile wont work without editing.

* -c <compiler>
	Option to use preffered compiler.
	Defaults to 'gcc'

## Features

- [x] generates a Makefile
- [x] user-defined compiler support
- [ ] remove the need to put in the file name without extensions
- [ ] user-defined clean functionality
- [ ] mulitple file and dependency support
