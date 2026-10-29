WITH orders AS (
    SELECT * FROM {{ ref('raw_orders') }}
),
customers AS (
    SELECT * FROM {{ ref('raw_customers') }}
),
products AS (
    SELECT * FROM {{ ref('raw_products') }}
)
SELECT 
    o.orderid, 
    o.orderdate, 
    o.shipdate, 
    o.shipmode, 
    o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE AS orderprofit, 
    o.ordercostprice, 
    o.ordersellingprice, 
    o.customerid, 
    c.customername, 
    c.segment, 
    c.country, 
    p.productid, 
    p.category, 
    p.productname, 
    p.subcategory 
FROM orders o 
LEFT JOIN customers c ON o.customerid = c.customerid 
LEFT JOIN products p ON o.productid = p.productid