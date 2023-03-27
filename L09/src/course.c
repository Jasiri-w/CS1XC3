/**

@file course.c
@author Jasiri Wa-Kyendo
@date March 27th 2023
@brief This file implements functions for the Course struct, including enrolling a student,
printing course information, finding the top student, and retrieving a list of passing students.
*/

#include "course.h"
#include <stdlib.h>
#include <stdio.h>

/**
@brief This function enrolls a student in a course.
@param course A pointer to the course the student is being enrolled in.
@param student A pointer to the student being enrolled in the course.
@return void
*/

void enroll_student(Course *course, Student *student)
{
  course->total_students++;
  if (course->total_students == 1) 
  {
    course->students = calloc(1, sizeof(Student));
  }
  else 
  {
    course->students = 
      realloc(course->students, course->total_students * sizeof(Student)); 
  }
  course->students[course->total_students - 1] = *student;
}
/**

@brief This function prints course information.
@param course A pointer to the course to print.
@return void
*/
void print_course(Course* course)
{
  printf("Name: %s\n", course->name);
  printf("Code: %s\n", course->code);
  printf("Total students: %d\n\n", course->total_students);
  printf("****************************************\n\n");
  for (int i = 0; i < course->total_students; i++) 
    print_student(&course->students[i]);
}
/**

@brief This function finds the top student in a course.
@param course A pointer to the course to search.
@return A pointer to the top student in the course.
*/
Student* top_student(Course* course)
{
  if (course->total_students == 0) return NULL;
 
  double student_average = 0;
  double max_average = average(&course->students[0]);
  Student *student = &course->students[0];
 
  for (int i = 1; i < course->total_students; i++)
  {
    student_average = average(&course->students[i]);
    if (student_average > max_average) 
    {
      max_average = student_average;
      student = &course->students[i];
    }   
  }

  return student;
}
/**
@brief This function retrieves a list of passing students in a course.
@param course A pointer to the course to search.
@param total_passing A pointer to an integer that will hold the total number of passing students.
@return A pointer to an array of passing students.
*/
Student *passing(Course* course, int *total_passing)
{
  int count = 0;
  Student *passing = NULL;
  
  for (int i = 0; i < course->total_students; i++) 
    if (average(&course->students[i]) >= 50) count++;
  
  passing = calloc(count, sizeof(Student));

  int j = 0;
  for (int i = 0; i < course->total_students; i++)
  {
    if (average(&course->students[i]) >= 50)
    {
      passing[j] = course->students[i];
      j++; 
    }
  }

  *total_passing = count;

  return passing;
}
