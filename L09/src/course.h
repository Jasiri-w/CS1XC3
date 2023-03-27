#include "student.h"
#include <stdbool.h>

/**
 * @brief Represents a course in a school system.
 *
 * This struct contains information about a course's name, code, and enrolled students.
 */
typedef struct _course 
{
  char name[100]; /**< The name of the course. */
  char code[10]; /**< The code of the course. */
  Student *students; /**< An array of pointers to the students enrolled in the course. */
  int total_students; /**< The total number of students enrolled in the course. */
} Course;

void enroll_student(Course *course, Student *student);
void print_course(Course *course);
Student *top_student(Course* course);
Student *passing(Course* course, int *total_passing);

