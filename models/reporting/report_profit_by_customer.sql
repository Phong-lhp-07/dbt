SELECT 
    CUSTOMERID, 
    SEGMENT, 
    COUNTRY, 
    SUM(orderprofit) AS profit
FROM {{ ref('stg_orders') }}
GROUP BY CUSTOMERID, SEGMENT, COUNTRY