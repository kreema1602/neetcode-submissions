
select student_id, min(exam_id) as exam_id, score
from (
    SELECT
        student_id,
        exam_id,
        score,
        RANK() OVER (
            PARTITION BY student_id
            ORDER BY score DESC
        ) AS score_rank
    FROM exam_results)  
    where score_rank = 1
    group by student_id, score;
