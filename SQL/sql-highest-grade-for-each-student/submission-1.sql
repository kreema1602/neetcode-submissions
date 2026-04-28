
select er.student_id, min(er.exam_id) as exam_id, score
from exam_results er join(
    SELECT
        student_id,
        exam_id,
        RANK() OVER (
            PARTITION BY student_id
            ORDER BY exam_id
        ) AS exam_id_rank,
        RANK() OVER (
            PARTITION BY student_id
            ORDER BY score DESC
        ) AS score_rank
    FROM exam_results) ranking 
    on er.student_id = ranking.student_id
    and er.exam_id = ranking.exam_id and score_rank = 1
    group by er.student_id, score
    ;
