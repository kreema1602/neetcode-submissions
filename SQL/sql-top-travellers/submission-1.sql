select name, COALESCE(travelled_distance, 0) AS travelled_distance
from users left join 
    (select user_id, sum(distance) as travelled_distance
    from rides
    group by user_id) travel_dis 
on users.id = travel_dis.user_id
order by travelled_distance desc, name
;