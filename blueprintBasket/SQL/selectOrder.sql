SELECT order_id, order_time, price
FROM orders
WHERE buyer_id = '$patient'
ORDER BY order_time DESC
LIMIT 1