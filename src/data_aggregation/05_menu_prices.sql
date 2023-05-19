USE restaurant;

SELECT category_id,
       ROUND(AVG(price), 2) as 'Average Price',
       ROUND(MIN(price), 2) as 'Cheapest Product',
       ROUND(MAX(price), 2) as 'Most Expensive Product'
FROM products
GROUP BY category_id;