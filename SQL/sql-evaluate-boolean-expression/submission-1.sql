SELECT e.*,
       CASE
        WHEN OPERATOR = '>' and lv.value > rv.value THEN 'true'
        WHEN OPERATOR = '<' and lv.value < rv.value THEN 'true'
        WHEN OPERATOR = '=' and lv.value = rv.value THEN 'true'
        ELSE 'false'
        END AS VALUE
FROM   expressions e
       JOIN variables lv
       ON lv.name = e.left_operand
       JOIN variables rv
       ON rv.name = e.right_operand;