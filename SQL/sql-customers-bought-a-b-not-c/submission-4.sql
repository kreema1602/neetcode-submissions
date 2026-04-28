select c.customer_id, customer_name
from orders o left join customers c on o.customer_id = c.customer_id
group by c.customer_id, customer_name
HAVING COUNT( Distinct
    CASE
        WHEN product_name in ('A', 'B') THEN product_name
    END
) = 2
and COUNT(
    CASE
        WHEN product_name in ('C') THEN 1
    END
) = 0
order by customer_name;