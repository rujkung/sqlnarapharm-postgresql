SELECT rxdate,
       COUNT(DISTINCT order_no) AS order_count
FROM opitemrece
WHERE rxdate BETWEEN '2025-10-01' AND '2025-10-31'
	AND rxtime between '08:00:00' and '16:30:00'
  AND an IS NOT NULL
  AND income IN ('02', '03', '04', '05', '17')
GROUP BY rxdate;
