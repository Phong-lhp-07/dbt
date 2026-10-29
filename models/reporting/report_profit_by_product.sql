SELECT 
    PRODUCTID, 
    PRODUCTNAME, 
    category, 
    subcategory, 
    SUM(orderprofit) AS profit
FROM {{ ref('stg_orders') }}
GROUP BY productid, productname, category, subcategory

