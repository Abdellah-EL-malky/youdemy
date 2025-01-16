CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL ,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher', 'admin') NOT NULL,
    status ENUM('active', 'pending', 'suspended') NOT NULL DEFAULT 'pending'
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL 
);

CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    path VARCHAR(255),
    teacher_id INT NOT NULL,
    category_id INT NOT NULL,
    tags_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES users(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (tags_id) REFERENCES tags(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE course_students (
    course_id INT,
    student_id INT,
    PRIMARY KEY (course_id, student_id),
    FOREIGN KEY (course_id) REFERENCES courses(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (student_id) REFERENCES users(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);