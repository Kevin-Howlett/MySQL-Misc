#Creates table that represents students and majors,
#with student_id as primary key.
#NOT NULL requires a value.
#PRIMARY KEY indicates the primary key value (must be unique).
#DEFAULT sets value specified if none is given.
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'Undecided'
);

#Adds students with varying majors into table 'students'.
INSERT INTO students VALUES(1, 'Benjamin', 'Chemistry');
INSERT INTO students VALUES(2, 'Harriet', 'Music');
INSERT INTO students VALUES(3, 'Sydney', 'Computer Science');
INSERT INTO students(student_id, name) VALUES(4, 'Carol');
INSERT INTO students VALUES(5, 'Frank', 'Biochemistry');
 
#Describes table and displays all data in it.
DESCRIBE students;
SELECT * FROM students;

#Changes major of an individual student.
UPDATE students
SET major = 'Data Science'
WHERE name = 'Benjamin';

#Deletes an individual student from the table.
DELETE FROM students 
WHERE student_id = 4;

#Adds a column (gpa) to 'students' and updates the gpa values.
ALTER TABLE students ADD gpa DECIMAL(3, 2);
UPDATE students
SET gpa = 3.50;
UPDATE students
SET gpa = 4.00
WHERE student_id = 1;

#Deletes gpa column from 'students' because NCF does not
#do grades.
ALTER TABLE students DROP COLUMN gpa;

#Dsiplays part of table, organized by alphabetical order by name.
SELECT student_id, name, major FROM students
ORDER BY name;

#Displays data where student_id is less than or equal to 3
#and the students name is not Benjamin.
SELECT * 
FROM students
WHERE student_id <= 3 AND name <> 'Benjamin';

#Displays data for students with computer science or
#data science major.
SELECT *
FROM students 
WHERE major IN ('Data Science', 'Computer Science');
