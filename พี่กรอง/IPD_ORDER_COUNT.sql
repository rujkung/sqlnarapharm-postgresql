SELECT EXTRACT(MONTH FROM rxdate) AS month,
       COUNT(DISTINCT order_no) AS order_count
FROM opitemrece
WHERE rxdate BETWEEN '2023-08-10' AND '2023-08-10'
  AND an IS NOT NULL
  AND income IN ('02', '03', '04', '05', '17')
GROUP BY EXTRACT(MONTH FROM rxdate);
