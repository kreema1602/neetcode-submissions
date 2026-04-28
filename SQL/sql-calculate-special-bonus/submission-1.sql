select e.employee_id, CASE
        WHEN e.employee_id % 2 = 1 and e.name NOT LIKE 'M%' THEN e.salary
        ELSE 0
    END AS bonus
from employees e
order by e.employee_id;