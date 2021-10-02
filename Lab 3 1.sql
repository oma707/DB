-- task 1
select * from course where credits>3;

-- 1)b
select * from classroom
where building='Packard' or building='Watson';

-- 1)c
select * from course
where dept_name='Comp. Sci.';

-- 1)d
select course.course_id, course.title, course.dept_name, course.credits from course, section
where course.course_id=section.course_id and section.semester='Fall';


-- 1)e
select * from student
where tot_cred > 45 and tot_cred < 90;

-- 1)f
select * from student
where name like '%a'
or name like '%e'
or name like '%i'
or name like '%o'
or name like '%u'
or name like '%y';

-- 1)g
select course.course_id, course.title, course.dept_name, course.credits from prereq, course
where prereq.prereq_id='CS-101' and prereq.course_id=course.course_id;