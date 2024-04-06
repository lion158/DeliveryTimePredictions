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
SELECT *, TIMESTAMPDIFF(SECOND, segment_start_time, segment_end_time) AS time_diff_in_seconds FROM route_segments
ORDER BY driver_id, segment_id DESC, segment_end_time ASC
# WHERE driver_id = 1
# ORDER BY segment_start_time ASC, segment_end_time DESC, segment_id DESC
# ORDER BY segment_start_time ASC
# GROUP BY order_id



SELECT * FROM route_segments
order by driver_id, segment_id, segment_end_time
