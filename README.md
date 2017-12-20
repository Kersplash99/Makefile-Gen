# Makefile-Gen

This script provides a template to generate a simple Makefile for c99 code. This is currently bare-bones,
will be added in the future. 

Currently, the script will only produce a template for a Makefile which uses 'gcc' as a compiler, has the flags "-Wall -std=c99"
and will only work with one file. This template can be generated and then edited if need be.


## Usage

```gen Makefile <filename>```

		Note * ensure that the filename does not have a file extension. 

For eg, to generate a Makefile for the file example.c, run the comman:

```gen Makefile example```

## Features

- [x] generates a Makefile
- [ ] user-defined tag support
- [ ] user-defined clean functionality
- [ ] mulitple file and dependency support
