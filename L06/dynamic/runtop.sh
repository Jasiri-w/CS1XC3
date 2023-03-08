export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/wakyendj/CS1XC3/L06/dynamic/libLab6Part5.so"

gcc -L/home/wakyendj/CS1XC3/L06/dynamic/libLab6Part5.so -Wall -o top top.c -ILab6Part5

unset LD_LIBRARY_PATH
