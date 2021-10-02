-- 2)a

select dept_name, avg(salary) as avg_salary
from instructor group by dept_name
order by avg_salary;

-- 2b
select building, count(course_id) as cnt_course
from section group by building
order by cnt_course desc limit 1;

-- 2c
select dept_name, count(course_id) as min_cnt from course
group by dept_name
having count(course_id) = (select min(cnt) from (select count(course_id) as cnt from course group by dept_name) as min_cnt);

-- 2d
select student.id, student.name, count(course_id) from student, takes
where student.dept_name='Comp. Sci.' and student.id = takes.id
group by student.id, student.name
having count(course_id) > 3;

-- 2e
select *
from instructor
where dept_name in ('Biology','Philosophy','Music');

-- 2f
select name from instructor
except (Select name from instructor,teaches where instructor.id=teaches.id and teaches.year=2017);