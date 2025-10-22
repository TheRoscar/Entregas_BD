## Query 1: List of students enrolled in "Bases de Datos" with their details and grades

SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    e.enrollment_date,
    e.grade
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE c.name = 'Bases de Datos'
ORDER BY s.last_name, s.first_name;

## Query 2: List of students enrolled in "Python II" with their details and grades

SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    e.enrollment_date,
    e.grade
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE c.name = 'Python II'
ORDER BY s.last_name, s.first_name;


## Query 3: Total number of students enrolled in "Sistemas Operativos"
SELECT 
    c.name AS curso,
    COUNT(e.student_id) AS total_estudiantes
FROM course c
JOIN enrollment e ON c.course_id = e.course_id
WHERE c.name = 'Sistemas Operativos'
GROUP BY c.name;


## Query 4: promedio de calificaciones por curso
SELECT 
    c.course_id,
    c.name AS curso,
    c.credits,
    COUNT(e.student_id) AS total_estudiantes,
    ROUND(AVG(e.grade), 2) AS promedio_calificaciones
FROM course c
JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.name, c.credits
ORDER BY promedio_calificaciones DESC;

