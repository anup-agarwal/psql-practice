-- =====================================
-- LMS DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all students with their city.
-- id | full_name    | city
-- 1  | Rohit Jain   | Delhi
-- 2  | Sneha Modi   | Mumbai
-- 3  | Arjun Rao    | Bangalore
-- 4  | Nisha Iyer   | Chennai
-- 5  | Guest User   | NULL


-- Q2. List all courses with instructor name and difficulty.
-- course_id | title              | instructor_name | difficulty
-- 1         | JavaScript Basics  | Amit Sharma      | beginner
-- 2         | Advanced React     | Amit Sharma      | advanced
-- 3         | UI Design Mastery  | Divya Patel      | intermediate
-- 4         | Data Science 101   | Karan Mehta      | beginner
-- 5         | Deep Learning      | Karan Mehta      | advanced


-- Q3. Enrollments with student, course, progress.
-- student | course             | progress_percent
-- Rohit   | JavaScript Basics  | 80
-- Rohit   | Advanced React     | 20
-- Sneha   | JavaScript Basics  | 40
-- Sneha   | UI Design Mastery  | 10
-- Arjun   | Data Science 101   | 0
-- Nisha   | Deep Learning      | 0


-- Q4. Students per course.
-- course_id | title               | total_students
-- 1         | JavaScript Basics   | 2
-- 2         | Advanced React      | 1
-- 3         | UI Design Mastery   | 1
-- 4         | Data Science 101    | 1
-- 5         | Deep Learning       | 1


-- Q5. Total lectures per course.
-- course_id | title               | lecture_count
-- 1         | JavaScript Basics   | 3
-- 2         | Advanced React      | 2
-- 3         | UI Design Mastery   | 1
-- 4         | Data Science 101    | 1
-- 5         | Deep Learning       | 1


-- Q6. Avg lecture duration.
-- course_id | title               | avg_duration
-- 1         | JavaScript Basics   | ~51.6
-- 2         | Advanced React      | 85
-- 3         | UI Design Mastery   | 40
-- 4         | Data Science 101    | 85
-- 5         | Deep Learning       | 120


-- Q7. Assignments with course.
-- assignment_id | title            | course
-- 1             | JS Quiz 1        | JavaScript Basics
-- 2             | JS Quiz 2        | JavaScript Basics
-- 3             | React Assignment | Advanced React
-- 4             | Data Cleaning…   | Data Science 101


-- Q8. Submissions count per assignment.
-- assignment_id | title            | submissions_count
-- 1             | JS Quiz 1        | 2
-- 2             | JS Quiz 2        | 1
-- 3             | React Assignment | 1
-- 4             | Data Cleaning…   | 0


-- Q9. Students who never submitted anything.
-- student_id | full_name
-- 3          | Arjun Rao
-- 4          | Nisha Iyer
-- 5          | Guest User


-- Q10. Courses with NO assignments.
-- course_id | title
-- 3         | UI Design Mastery
-- 5         | Deep Learning


-- Q11. Enrolled students with no successful payment.
-- student | course
-- Sneha   | JavaScript Basics   (her payment failed)
-- Nisha   | Deep Learning       (payment refunded)


-- Q12. Course revenue.
-- course_id | title               | total_revenue
-- 1         | JavaScript Basics   | 1500
-- 2         | Advanced React      | 3500
-- 4         | Data Science 101    | 4000


-- Q13. Instructor course count.
-- instructor | courses_count
-- Amit       | 2
-- Divya      | 1
-- Karan      | 2


-- Q14. Top 3 highest priced courses.
-- course_id | title
-- 5         | Deep Learning
-- 4         | Data Science 101
-- 2         | Advanced React


-- Q15. Total marks per student.
-- student | total_marks
-- Rohit   | 18 + 25 + 40 = 83
-- Sneha   | 15
-- Others  | NULL / 0


-- Q16. Students with >50% progress.
-- student | course | progress
-- Rohit   | JavaScript Basics | 80


-- Q17. Instructor specialization mismatch.
-- (Only if specialization doesn't match course topic)
-- e.g., UI/UX instructor teaching Data Science  
-- Based on given seed:
-- course_id | title            | instructor_id
-- 2         | Advanced React   | 1  (JavaScript instructor teaching React without "JavaScript" in title)
-- 5         | Deep Learning    | 3  (Data Science instructor teaching Deep Learning without "Data Science" in title)


-- Q18. Failed or refunded payments.
-- student | course             | status
-- Sneha   | JavaScript Basics  | failed
-- Nisha   | Deep Learning      | refunded


-- Q19. Course with highest (lectures + assignments).
-- JavaScript Basics → 3 lectures + 2 assignments = 5  (highest)


-- Q20. Students with >2 submissions (CTE).
-- student_id | full_name | submission_count
-- Rohit Jain | 3
