select *,
    case 
    when operator = '>' then 
    (case 
        when 
        (select value from variables where name = left_operand) > 
        (select value from variables where name = right_operand)
        then 'true' 
        else 'false' 
        end )

    when operator = '<' then 
    (case 
        when 
        (select value from variables where name = left_operand) <
        (select value from variables where name = right_operand)
        then 'true' 
        else 'false' 
        end ) 

    when operator = '=' then 
    (case 
        when 
        (select value from variables where name = left_operand) = 
        (select value from variables where name = right_operand)
        then 'true' 
        else 'false' 
        end ) 
    end as value
from expressions;