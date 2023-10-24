# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Students_27
(
student_id int, 
student_name varchar(20)
);

Create table If Not Exists Subjects_27
(
subject_name varchar(20)
);

Create table If Not Exists Examinations_27 
(
student_id int, 
subject_name varchar(20)
);

Truncate table Students_27;
insert into Students_27 (student_id, student_name) values ('1', 'Alice');
insert into Students_27 (student_id, student_name) values ('2', 'Bob');
insert into Students_27 (student_id, student_name) values ('13', 'John');
insert into Students_27 (student_id, student_name) values ('6', 'Alex');

Truncate table Subjects_27;
insert into Subjects_27 (subject_name) values ('Math');
insert into Subjects_27 (subject_name) values ('Physics');
insert into Subjects_27 (subject_name) values ('Programming');

Truncate table Examinations_27;
insert into Examinations_27 (student_id, subject_name) values ('1', 'Math');
insert into Examinations_27 (student_id, subject_name) values ('1', 'Physics');
insert into Examinations_27 (student_id, subject_name) values ('1', 'Programming');
insert into Examinations_27 (student_id, subject_name) values ('2', 'Programming');
insert into Examinations_27 (student_id, subject_name) values ('1', 'Physics');
insert into Examinations_27 (student_id, subject_name) values ('1', 'Math');
insert into Examinations_27 (student_id, subject_name) values ('13', 'Math');
insert into Examinations_27 (student_id, subject_name) values ('13', 'Programming');
insert into Examinations_27 (student_id, subject_name) values ('13', 'Physics');
insert into Examinations_27 (student_id, subject_name) values ('2', 'Math');
insert into Examinations_27 (student_id, subject_name) values ('1', 'Math');

/*
Q. Write an SQL query to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.

Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Output: 
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+
Explanation: 
The result table should contain all students and all subjects.
Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
Alex did not attend any exams.
John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.
*/

SELECT * FROM Students_27;
SELECT * FROM Subjects_27;
SELECT * FROM Examinations_27;

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students_27 AS s
CROSS JOIN Subjects_27 AS sub
LEFT JOIN Examinations_27 AS e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, sub.subject_name, s.student_name
ORDER BY s.student_id, sub.subject_name;