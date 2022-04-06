/* We use COUNT function to count the numbers of records (a.k.a row) in a table. Here is the syntax of the COUNT function:

SELECT COUNT(column_name)
FROM table_name; */

SELECT COUNT (Student_id) as count_of_students
FROM students;

/*An important point for COUNT(*) function is that the result table includes NULL and 
duplicate values. If you want the number of non-null values, use the syntax COUNT(column_name).*/

SELECT COUNT (*)
FROM students;

SELECT COUNT(DISTINCT FirstName) as distinct_count_of_name
FROM employees;















