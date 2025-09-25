SELECT
	EXTRACT( MONTH FROM dchdate ) AS MONTH,
	SUM( admdate ) AS sum_admdate 
FROM
	an_stat 
WHERE
	dchdate >= '2023-05-01' 
	AND dchdate <= '2023-06-30' 
GROUP BY
	EXTRACT( MONTH FROM dchdate );
