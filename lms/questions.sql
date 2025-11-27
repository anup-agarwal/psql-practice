-- ============================
-- LMS DATASET — PRACTICE QUESTIONS
-- ============================

-- Q1. List all students with their city.
select * from students;

-- Q2. List all courses with instructor name and difficulty level.
select c.*, i.full_name, c.difficulty from courses as c join instructors as i on c.instructor_id=i.id;

-- Q3. List all enrollments with student name, course title, and progress_percent.
select e.*, s.full_name from enrollments as e join students as s on e.student_id=s.id;

-- Q4. Show total number of students enrolled in each course.
select c.*, count(s.id) as student_count
from ((enrollments as e join courses as c on e.course_id=c.id) join students as s on e.student_id=s.id)
group by c.id 
order by c.id;

-- Q5. Show total number of lectures in each course.
select c.*, count(l.*) from lectures as l join courses as c on l.course_id=c.id
group by c.id
order by c.id;

-- Q6. Show average lecture duration (in minutes) per course.
select c.*, avg(l.duration_minutes) from lectures as l join courses as c on l.course_id=c.id
group by c.id
order by c.id;

-- Q7. List all assignments with their course name and max_marks.
select assignments.*, courses.title from courses join assignments on assignments.course_id=courses.id;

-- Q8. For each assignment, show how many students submitted it.
select assignments.*, count(submissions.*) from submissions join assignments on submissions.assignment_id=assignments.id
group by assignments.id
order by assignments.id;
-- select * from assignments;

-- Q9. List students who NEVER submitted any assignment.
select * from students where not exists (
  select assignments.* from submissions join assignments on submissions.assignment_id=assignments.id where submissions.student_id=students.id
);

-- Q10. List courses that have NO assignments at all.
select * from courses where not exists (select * from assignments where assignments.course_id=courses.id);

-- Q11. List students who have enrolled but have NO successful payments.

-- Q12. Show all courses along with their total revenue (sum of successful payments).

-- Q13. List instructors with how many courses they are teaching.

-- Q14. List top 3 highest priced courses.

-- Q15. For each student, show total marks obtained across all submissions.

-- Q16. List students who have completed more than 50% progress in any course.

-- Q17. List courses where the instructor specialization does NOT match course difficulty (e.g., JS instructor teaching Data Science).

-- Q18. List all failed or refunded payments with student and course information.

-- Q19. Find the course with the highest total number of lectures + assignments combined.

-- Q20. Using a CTE:
--      First, calculate total submissions for each student.
--      Then show only students with more than 2 submissions.
