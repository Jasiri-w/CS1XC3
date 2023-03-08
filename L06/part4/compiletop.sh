#!/bin/bash
LIB=$1

if [ $# -lt 1 ] ; then
    echo "Provide an arg."
else
    gcc -L$LIB -Wl,-rpath=$LIB -Wall -o top top.c -lLab6Part5
fi
