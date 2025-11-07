--คำสั่งรวมใบสั่งยา ipd+er
with ipd AS (SELECT 
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
	AND a.an IS NOT NULL
	AND income IN ('02', '03', '04', '05', '17')
GROUP BY 
    a.rxdate
ORDER BY 
    a.rxdate),
    er AS (--ดึงใบสั่งยา พี่กรอง postgresql
SELECT 
    op.rxdate,
    COUNT(DISTINCT o.vn) AS visit_count
FROM ovst o
LEFT JOIN kskdepartment k ON o.main_dep = k.depcode
LEFT JOIN opitemrece op ON o.vn = op.vn
WHERE op.rxdate >= '2025-10-01'
  AND op.rxdate <= '2025-10-31'
  AND op.income IN ('03', '04', '05', '17')
  AND op.rxtime BETWEEN '08:30:00' AND '16:30:00'
  AND k.depcode in ('002','006','010','012','013','016','020','021','022','025','026','027','028','030','031','032','038','043','044','046','048','059','060','061','062','063','064','068','069','071','072','082','096','0A2','0A3','0A8','0A9','0B1','0B2','0B3''163','168')
GROUP BY op.rxdate
ORDER BY op.rxdate)

SELECT 
    ipd.rxdate as DATE,
    ipd.nodrugsummary as IPD,
    er.visit_count as ER
FROM ipd
LEFT JOIN er ON ipd.rxdate = er.rxdate
ORDER BY ipd.rxdate
