# Compiler-design-antlr

This repository contains my ANTLR implementation of a simple programming language, developed as part of the "formal languages and automata" course in 2023.

## Project Overview
- **Language Parser Implementation** using ANTLR v4
- Features a custom grammar for a simple OOP language with:
  - Class definitions and inheritance
  - Functions and constructors
  - Variables and arrays
  - Control structures (loops, conditionals)
  - Exception handling
- Includes test cases demonstrating language capabilities

## Project Structure
- `grammerProject.g4`: ANTLR grammar file
- `testcase.txt`: Sample programs written in the language
- `Antlr_project.pdf`: Original project specification

## Technical Details
- Developed as my first compiler-related project
- Implements lexer/parser using ANTLR's grammar rules
- Handles language syntax including:
  - Import statements and library requirements
  - Class definitions with access modifiers
  - Various data types and array declarations
  - Complex expressions with operator precedence
