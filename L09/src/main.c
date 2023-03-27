/**
 * @file main.c
 * @author Jasiri Wa-Kyendo
 * @date March 27th 2023
 * @brief A program to manage a course and its students.
 */
#include <stdlib.h> 
#include <stdio.h>
#include <string.h>
#include "time.h"
#include "course.h"
/**
 * Main program function.
 *
 * Initializes the random number generator, creates a course,
 * enrolls students, prints out course information, finds the
 * top student, and prints out passing students.
 *
 * @return 0 indicating successful execution.
 *
 */

int main()
{
  srand((unsigned) time(NULL));

  Course *MATH101 = calloc(1, sizeof(Course)); /**< Create a new course */
  strcpy(MATH101->name, "Basics of Mathematics"); /**< Set course name */
  strcpy(MATH101->code, "MATH 101"); /**< Set course code */

  for (int i = 0; i < 20; i++) 
    enroll_student(MATH101, generate_random_student(8)); /**< Enroll students */
  
  print_course(MATH101); /**< Print course information */

  Student *student;
  student = top_student(MATH101); /**< Find top student */
  printf("\n\nTop student: \n\n"); /**< Find passing students */
  print_student(student);

  int total_passing;
  Student *passing_students = passing(MATH101, &total_passing);
  printf("\nTotal passing: %d\n", total_passing);
  printf("\nPassing students:\n\n");
  for (int i = 0; i < total_passing; i++) print_student(&passing_students[i]); /**< Print passing students information */
  
  return 0; /**< Indicate successful execution */
}
