CC = gcc
CFLAGS = -Wall
SRC_DIR = src
BUILD_DIR = build

$(shell mkdir -p build documentation documentation/docs)

student : ./src/student.c
	gcc -c $< -o build/student.o $(CFLAGS)

course : ./src/course.c
	gcc -c $< -o build/course.o $(CFLAGS)

main : ./src/main.c ./build/student.o ./build/course.o
	gcc -c $< -o build/main.o $(CFLAGS)
	gcc ./build/student.o ./build/course.o ./build/main.o -o build/main $(CFLAGS)

doxygen :
	doxygen -g

docs : doxygen
	doxygen doxyfile

all : student course main

clean :
	rm $(BUILD_DIR)/* -f $(BUILD_DIR) -r
