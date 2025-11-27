-- Clean up if re-run
DROP TABLE IF EXISTS submissions, assignments, lectures, enrollments, payments, courses, instructors, students CASCADE;

-- Students
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  city TEXT,
  joined_at DATE NOT NULL
);

-- Instructors
CREATE TABLE instructors (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  specialization TEXT
);

-- Courses
CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  instructor_id INT REFERENCES instructors(id),
  price NUMERIC(10,2),
  difficulty TEXT,   -- beginner, intermediate, advanced
  created_at DATE NOT NULL
);

-- Lectures inside a course
CREATE TABLE lectures (
  id SERIAL PRIMARY KEY,
  course_id INT REFERENCES courses(id),
  title TEXT NOT NULL,
  duration_minutes INT NOT NULL
);

-- Assignments inside a course
CREATE TABLE assignments (
  id SERIAL PRIMARY KEY,
  course_id INT REFERENCES courses(id),
  title TEXT NOT NULL,
  max_marks INT NOT NULL
);

-- Students enrolling into courses (many-to-many)
CREATE TABLE enrollments (
  student_id INT REFERENCES students(id),
  course_id INT REFERENCES courses(id),
  enrolled_at DATE NOT NULL,
  progress_percent INT DEFAULT 0,
  PRIMARY KEY (student_id, course_id)
);

-- Assignment submissions by students
CREATE TABLE submissions (
  id SERIAL PRIMARY KEY,
  assignment_id INT REFERENCES assignments(id),
  student_id INT REFERENCES students(id),
  submitted_at DATE,
  marks_obtained INT
);

-- Payments for course enrollments
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(id),
  course_id INT REFERENCES courses(id),
  amount NUMERIC(10,2),
  status TEXT,       -- success / failed / refunded
  paid_at DATE
);

------------------------------------------------------
-- Seed Data
------------------------------------------------------

-- Students
INSERT INTO students (id, full_name, email, city, joined_at) VALUES
  (1, 'Rohit Jain',  'rohit@example.com',   'Delhi',     '2024-01-10'),
  (2, 'Sneha Modi',  'sneha@example.com',   'Mumbai',    '2024-01-12'),
  (3, 'Arjun Rao',   'arjun@example.com',   'Bangalore', '2024-01-15'),
  (4, 'Nisha Iyer',  'nisha@example.com',   'Chennai',   '2024-02-01'),
  (5, 'Guest User',  'guest@example.com',   NULL,        '2024-02-10');

-- Instructors
INSERT INTO instructors (id, full_name, email, specialization) VALUES
  (1, 'Amit Sharma', 'amit@teach.com',   'JavaScript'),
  (2, 'Divya Patel', 'divya@teach.com',  'UI/UX'),
  (3, 'Karan Mehta', 'karan@teach.com',  'Data Science');

-- Courses
INSERT INTO courses (id, title, instructor_id, price, difficulty, created_at) VALUES
  (1, 'JavaScript Basics', 1, 1500.00, 'beginner',     '2024-02-01'),
  (2, 'Advanced React',    1, 3500.00, 'advanced',     '2024-02-15'),
  (3, 'UI Design Mastery', 2, 2500.00, 'intermediate', '2024-02-20'),
  (4, 'Data Science 101',  3, 4000.00, 'beginner',     '2024-03-01'),
  (5, 'Deep Learning',     3, 5000.00, 'advanced',     '2024-03-05');

-- Lectures
INSERT INTO lectures (course_id, title, duration_minutes) VALUES
  (1, 'Variables & Types', 45),
  (1, 'Loops',             60),
  (1, 'Functions',         50),
  (2, 'Hooks Deep Dive',   80),
  (2, 'Performance',       90),
  (3, 'Color Theory',      40),
  (4, 'Data Cleaning',     85),
  (5, 'Neural Nets',      120);

-- Assignments
INSERT INTO assignments (course_id, title, max_marks) VALUES
  (1, 'JS Quiz 1', 20),
  (1, 'JS Quiz 2', 30),
  (2, 'React Assignment', 50),
  (4, 'Data Cleaning Task', 40);

-- Enrollments
INSERT INTO enrollments (student_id, course_id, enrolled_at, progress_percent) VALUES
  (1, 1, '2024-02-02', 80),
  (1, 2, '2024-02-20', 20),
  (2, 1, '2024-02-05', 40),
  (2, 3, '2024-02-22', 10),
  (3, 4, '2024-03-02', 0),
  (4, 5, '2024-03-06', 0);

-- Submissions
INSERT INTO submissions (assignment_id, student_id, submitted_at, marks_obtained) VALUES
  (1, 1, '2024-02-05', 18),
  (2, 1, '2024-02-10', 25),
  (1, 2, '2024-02-08', 15),
  (3, 1, '2024-03-01', 40);

-- Payments
INSERT INTO payments (student_id, course_id, amount, status, paid_at) VALUES
  (1, 1, 1500.00, 'success',  '2024-02-02'),
  (1, 2, 3500.00, 'success',  '2024-02-20'),
  (2, 1, 1500.00, 'failed',   '2024-02-05'),
  (3, 4, 4000.00, 'success',  '2024-03-02'),
  (4, 5, 5000.00, 'refunded', '2024-03-06');
