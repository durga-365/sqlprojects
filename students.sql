-- Create the Student Database Management System tables

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255),
    age INT,
    class VARCHAR(50),
    birth_date DATE,
    parent_name VARCHAR(255),
    parent_occupation VARCHAR(100)
);

-- Teachers table
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(255),
    subject VARCHAR(100)
);

-- Classes table
CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    teacher_id INT REFERENCES Teachers(teacher_id)
);

-- Schedule table
CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY,
    class_id INT REFERENCES Classes(class_id),
    day_of_week VARCHAR(15),
    start_time TIME,
    end_time TIME
);

-- Exams table
CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(100)
);

-- Exam Grades table
CREATE TABLE ExamGrades (
    exam_grade_id INT PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    exam_id INT REFERENCES Exams(exam_id),
    grade DECIMAL(5, 2)
);

-- Attendance table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    class_id INT REFERENCES Classes(class_id),
    attendance_date DATE,
    is_present BOOLEAN
);
