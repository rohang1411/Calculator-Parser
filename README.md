# Calculator-Parser

## Introduction
A simple parser for Calculator using Lex (Lexical Analyzer Generator) and YACC (Yet Another Compiler-Compiler) which can perform simple arithmetic operations. Lex tool helps write programs whose control flow is directed by instances of regular expressions in the input stream. It is well suited for segmenting input in preparation for a parsing routine. Lex tool source is the table of regular expressions and corresponding program fragments. The table is translated to a program which reads an input stream, copying it to an output stream and partitioning the input into strings which match the given expressions. On the other hand YACC tool receives input of the user grammar. Starting from this grammar it generates the C source code for the parser. YACC invokes Lex to scan the source code and uses the tokens returned by Lex to build a syntax tree. With the help of YACC and Lex tool we have developed our own parser for a calculator.


## Steps to run the Code

Linux & MacOS

Type the following commands in your terminal - 
1. cd <Project Directory>
2. yacc -d calc.y
3. lex calc.l  
4. gcc lex.yy.c y.tab.c -w
5. ./a.out

Windows

Type the following commands in your terminal - 
1. cd <Project Directory>
2. flex calc.l
3. bison -dy calc.y
4. gcc lex.yy.c y.tab.c -w
5. a.exe
