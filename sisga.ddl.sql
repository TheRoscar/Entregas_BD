-- ============================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS
-- Sistema de Gestión Académica (SISGA)
-- ============================================

-- (Opcional) Crear la base de datos
CREATE DATABASE sisga;
\c sisga;

-- ============================================
-- 1. TABLA: student
-- ============================================
CREATE TABLE student (
    student_id      SERIAL PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE - (random() * 365 * 5)::integer)
);

-- ============================================
-- 2. TABLA: course
-- ============================================
CREATE TABLE course (
    course_id       SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    description     TEXT,
    credits         INT CHECK (credits > 0),
    status          VARCHAR(20) DEFAULT 'active'
);

-- ============================================
-- 3. TABLA: instructor
-- ============================================
CREATE TABLE instructor (
    instructor_id   SERIAL PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    hire_date       DATE NOT NULL
);

-- ============================================
-- 4. TABLA: course_instructor
-- Relación muchos a muchos entre curso e instructor
-- ============================================
CREATE TABLE course_instructor (
    id              SERIAL PRIMARY KEY,
    course_id       INT NOT NULL,
    instructor_id   INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id) ON DELETE CASCADE,
    UNIQUE (course_id, instructor_id)
);

-- ============================================
-- 5. TABLA: enrollment
-- Relación muchos a muchos entre estudiante y curso
-- ============================================
CREATE TABLE enrollment (
    id              SERIAL PRIMARY KEY,
    student_id      INT NOT NULL,
    course_id       INT NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade           DECIMAL(4,2) CHECK (grade BETWEEN 0 AND 5),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE,
    UNIQUE (student_id, course_id)
);
