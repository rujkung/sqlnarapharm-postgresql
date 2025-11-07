SELECT 
    a.rxdate,
    COUNT(DISTINCT a.order_no) AS nodrugsummary
FROM 
    opitemrece a
JOIN 
    ipt_order_no b 
    ON a.an = b.an
WHERE 
    a.rxdate BETWEEN '2025-10-01' AND '2025-10-31'
    AND a.rxtime BETWEEN '08:00:00' AND '16:30:00'
GROUP BY 
    a.rxdate
ORDER BY 
    a.rxdate;
