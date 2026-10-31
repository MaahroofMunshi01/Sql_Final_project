# Final Project Sql
create database final_project;
use final_project;

-- TABLE 1: Departments
-- ============================================================
CREATE TABLE Departments (
    DepartmentID   INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- TABLE 2: Students
-- ============================================================
CREATE TABLE Students (
    StudentID      INT PRIMARY KEY AUTO_INCREMENT,
    FirstName      VARCHAR(50)  NOT NULL,
    LastName       VARCHAR(50)  NOT NULL,
    Email          VARCHAR(150) UNIQUE NOT NULL,
    BirthDate      DATE         NOT NULL,
    EnrollmentDate DATE         NOT NULL
);

-- TABLE 3: Courses
-- ============================================================
CREATE TABLE Courses (
    CourseID     INT PRIMARY KEY AUTO_INCREMENT,
    CourseName   VARCHAR(150) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits      INT NOT NULL,
    CONSTRAINT fk_courses_department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLE 4: Instructors
-- Salary column is ASSUMED (not in original schema) to
-- satisfy Query 8: "maximum salary of instructors".
-- ============================================================
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName    VARCHAR(50)  NOT NULL,
    LastName     VARCHAR(50)  NOT NULL,
    Email        VARCHAR(150) UNIQUE NOT NULL,
    DepartmentID INT NOT NULL,
    Salary       DECIMAL(10, 2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_instructors_department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLE 5: Enrollments
-- ============================================================
CREATE TABLE Enrollments (
    EnrollmentID   INT PRIMARY KEY AUTO_INCREMENT,
    StudentID      INT NOT NULL,
    CourseID       INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    CONSTRAINT fk_enroll_student
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_student_course UNIQUE (StudentID, CourseID)
);


-- INSERT: Departments
-- ============================================================
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Business Administration'),
(5, 'Electronics');

-- INSERT: Students (given sample + extras)
-- ============================================================
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1,  'John',    'Doe',      'john.doe@email.com',      '2000-01-15', '2022-08-01'),
(2,  'Jane',    'Smith',    'jane.smith@email.com',    '1999-05-25', '2021-08-01'),
(3,  'Michael', 'Brown',    'michael.brown@email.com', '2001-03-12', '2022-08-01'),
(4,  'Emily',   'Davis',    'emily.davis@email.com',   '2000-07-04', '2023-01-10'),
(5,  'David',   'Wilson',   'david.wilson@email.com',  '1998-11-30', '2020-08-01'),
(6,  'Sarah',   'Connor',   'sarah.connor@email.com',  '2002-02-14', '2023-08-01'),
(7,  'Robert',  'Chen',     'robert.chen@email.com',   '2001-09-19', '2022-08-01'),
(8,  'Linda',   'Park',     'linda.park@email.com',    '2000-12-05', '2024-01-15'),
(9,  'James',   'Miller',   'james.miller@email.com',  '1999-06-22', '2021-08-01'),
(10, 'Priya',   'Sharma',   'priya.sharma@email.com',  '2001-10-11', '2022-08-01'),
(11, 'Daniel',  'Garcia',   'daniel.garcia@email.com', '2000-04-28', '2023-08-01'),
(12, 'Sophia',  'Turner',   'sophia.turner@email.com', '2002-08-17', '2024-08-01');

-- INSERT: Courses (given sample + extras)
-- ============================================================
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL',      1, 4),
(102, 'Data Structures',          1, 3),
(103, 'Discrete Mathematics',     2, 4),
(104, 'Linear Algebra',           2, 3),
(105, 'Calculus I',               2, 4),
(106, 'Calculus II',              2, 4),
(107, 'Probability Theory',       2, 3),
(108, 'Classical Mechanics',      3, 4),
(109, 'Digital Circuits',         5, 3),
(110, 'Marketing Fundamentals',   4, 2);

-- INSERT: Instructors (given sample + extras)
-- ============================================================
INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1, 'Alice',  'Johnson', 'alice.johnson@univ.com',  1, 85000.00),
(2, 'Bob',    'Lee',     'bob.lee@univ.com',        2, 72000.00),
(3, 'Carol',  'Martinez','carol.martinez@univ.com', 1, 95000.00),
(4, 'David',  'Kim',     'david.kim@univ.com',      3, 68000.00),
(5, 'Emma',   'Wright',  'emma.wright@univ.com',    2, 78000.00),
(6, 'Frank',  'Patel',   'frank.patel@univ.com',    4, 60000.00),
(7, 'Grace',  'Nguyen',  'grace.nguyen@univ.com',   1, 88000.00);

-- INSERT: Enrollments (given sample + extras)
-- ============================================================
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1,  1, 101, '2022-08-01'),
(2,  2, 102, '2021-08-01'),
(3,  3, 101, '2022-08-01'),
(4,  4, 101, '2023-01-10'),
(5,  5, 102, '2020-08-01'),
(6,  6, 103, '2023-08-01'),
(7,  7, 101, '2022-08-01'),
(8,  7, 102, '2022-08-01'),
(9,  8, 104, '2024-01-15'),
(10, 9, 105, '2021-08-01'),
(11, 10,101, '2022-08-01'),
(12, 10,102, '2022-08-01'),
(13, 11,106, '2023-08-01'),
(14, 12,107, '2024-08-01'),
(15, 1, 102, '2022-08-01'),
(16, 3, 102, '2022-08-01'),
(17, 4, 103, '2023-01-10'),
(18, 6, 101, '2023-08-01'),
(19, 8, 105, '2024-01-15'),
(20, 9, 106, '2021-08-01');

# Q1 : CRUD 
INSERT INTO Students (FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES ('Nina', 'Patel', 'nina.patel@email.com', '2002-05-20', '2024-08-01');

INSERT INTO Courses (CourseName, DepartmentID, Credits)
VALUES ('Operating Systems', 1, 4);

INSERT INTO Instructors (FirstName, LastName, Email, DepartmentID, Salary)
VALUES ('Henry', 'Ford', 'henry.ford@univ.com', 3, 66000.00);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES (13, 111, '2024-08-01');


SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;


UPDATE Students
SET Email = 'john.doe@university.edu'
WHERE StudentID = 1;

UPDATE Courses
SET Credits = 5
WHERE CourseID = 101;

UPDATE Instructors
SET Salary = 90000.00
WHERE InstructorID = 1;

UPDATE Enrollments
SET EnrollmentDate = '2022-08-15'
WHERE EnrollmentID = 1;

UPDATE Departments
SET DepartmentName = 'Computer Science & Engineering'
WHERE DepartmentID = 1;


 # Q2 -
 SELECT
    StudentID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Email,
    EnrollmentDate
FROM Students
WHERE EnrollmentDate > '2022-12-31'
ORDER BY EnrollmentDate;

# Q3 :
SELECT
    c.CourseID,
    c.CourseName,
    d.DepartmentName,
    c.Credits
FROM Courses c
INNER JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
ORDER BY c.CourseID
LIMIT 5;

# Q4 -
SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS StudentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5
ORDER BY StudentCount DESC;

# Q5-
SELECT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS FullName,
    s.Email
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c     ON e.CourseID  = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName, s.Email
HAVING COUNT(DISTINCT c.CourseName) = 2;

# Q6-
SELECT DISTINCT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS FullName,
    s.Email
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c     ON e.CourseID  = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
ORDER BY s.StudentID;

# Q7-
SELECT
    ROUND(AVG(Credits), 2) AS AverageCredits
FROM Courses;

# Q8 :
SELECT
    MAX(i.Salary) AS MaxInstructorSalary
FROM Instructors i
INNER JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science & Engineering';

# Q9 :
SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Courses c      ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e  ON c.CourseID     = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY StudentCount DESC;

# Q-10
SELECT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c     ON e.CourseID  = c.CourseID
ORDER BY s.StudentID, c.CourseID;


# Q 11:
SELECT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c     ON e.CourseID  = c.CourseID
ORDER BY s.StudentID, c.CourseID;

# Q12 :Students enrolled in courses that have MORE THAN 10
--      students (Note: sample dataset has fewer than 10
--      per course, so the inner query returns 0 rows).
SELECT DISTINCT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS FullName,
    s.Email
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10);
    
# Q13 -
SELECT
    StudentID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    EnrollmentDate,
    YEAR(EnrollmentDate)               AS EnrollmentYear,
    MONTH(EnrollmentDate)              AS EnrollmentMonth,
    MONTHNAME(EnrollmentDate)          AS EnrollmentMonthName,
    DATE_FORMAT(EnrollmentDate, '%Y')  AS YearFormatted
FROM Students
ORDER BY EnrollmentDate;
    
 # Q 14-
 SELECT
    InstructorID,
    FirstName,
    LastName,
    CONCAT(FirstName, ' ', LastName)      AS FullName
FROM Instructors
ORDER BY InstructorID;

# Q15-
SELECT
    e.EnrollmentID,
    e.EnrollmentDate,
    c.CourseID,
    c.CourseName,
    s.StudentID,
    COUNT(e.StudentID) OVER (
        ORDER BY e.EnrollmentDate, e.EnrollmentID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotalStudents
FROM Enrollments e
INNER JOIN Courses  c ON e.CourseID  = c.CourseID
INNER JOIN Students s ON e.StudentID = s.StudentID
ORDER BY e.EnrollmentDate, e.EnrollmentID;


# Q16 -
SELECT
    StudentID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    EnrollmentDate,
    CURDATE()                                        AS Today,
    DATEDIFF(CURDATE(), EnrollmentDate)              AS DaysSinceEnrollment,
    ROUND(DATEDIFF(CURDATE(), EnrollmentDate) / 365, 2) AS YearsSinceEnrollment,
    CASE
        WHEN DATEDIFF(CURDATE(), EnrollmentDate) > (4 * 365) THEN 'Senior'
        ELSE                                                     'Junior'
    END AS StudentLevel
FROM Students
ORDER BY EnrollmentDate;



