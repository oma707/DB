-- 3a
select student.id, name, course.title, grade from takes, student, course
where student.id = takes.id
and takes.course_id = course.course_id
and course.dept_name = 'Comp. Sci.'
and takes.grade in ('A', 'A-')
order by student.name asc;

-- 3b
select distinct i_id, s_id, name from advisor,student, takes
where student.id = advisor.s_id and takes.id = student.id and takes.grade in ('C', 'C-', 'F');

-- 3c
select distinct dept_name from course
where dept_name not in (select dept_name from course,takes
where course.course_id=takes.course_id and takes.grade in ('F','C','C-', 'C+'));

-- 3d
select distinct name from instructor
where name not in (select name from takes,teaches,instructor
where takes.course_id=teaches.course_id and teaches.id=instructor.id and takes.grade in ('A', 'A-'));

-- 3e
select title from course, time_slot, section
where course.course_id = section.course_id
and section.time_slot_id = time_slot.time_slot_id
and section.time_slot_id in ('A', 'B', 'C');