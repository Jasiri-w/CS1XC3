#!/bin/bash
DIR=$( pwd )
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR"
export LD_LIBRARY_PATH

./top

unset LD_LIBRARY_PATH
