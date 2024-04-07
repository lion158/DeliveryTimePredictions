# Part 1
SELECT op.product_id as productId, SUM(op.quantity * p.weight) as totalWeight
FROM orders as o
JOIN droptime.orders_products op on o.order_id = op.order_id
JOIN droptime.products p on p.product_id = op.product_id
JOIN droptime.route_segments rs on o.order_id = rs.order_id
WHERE DATE(rs.segment_end_time) = '2024-02-13' and rs.order_id is not null and o.customer_id = 32
GROUP BY op.product_id
ORDER BY totalWeight ASC

# Part 2

# route segments data
SELECT *, TIMESTAMPDIFF(SECOND, segment_start_time, segment_end_time) AS time_diff_in_seconds FROM route_segments
ORDER BY driver_id, segment_id DESC, segment_end_time ASC;
# WHERE driver_id = 1
# ORDER BY segment_start_time ASC, segment_end_time DESC, segment_id DESC
# ORDER BY segment_start_time ASC
# GROUP BY order_id

# orders planed delivery data
SELECT order_id, planned_delivery_duration, sector_id FROM orders


# weight of every order
SELECT o.order_id, SUM(p.weight * op.quantity) AS total_weight
FROM orders o
JOIN orders_products op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id
GROUP BY o.order_id;

# order quantity
SELECT o.order_id, SUM(op.quantity) AS total_quantity
FROM orders o
JOIN orders_products op ON o.order_id = op.order_id
GROUP BY o.order_id;



