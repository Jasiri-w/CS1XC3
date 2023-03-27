/**
 * @author Jasiri Wa-Kyendo
 * @date March 27th 2023
 * @brief Represents a student in a school system.
 * This struct contains information about a student's name, ID, and grades.
 */

typedef struct _student 
{ 
  char first_name[50]; /**< The first name of the student. */
  char last_name[50]; /**< The last name of the student. */
  char id[11]; /**< The unique ID of the student. */
  double *grades; /**< An array of the student's grades. */
  int num_grades; /**< The number of grades in the grades array. */
} Student;

void add_grade(Student *student, double grade);
double average(Student *student);
void print_student(Student *student);
Student* generate_random_student(int grades); 
