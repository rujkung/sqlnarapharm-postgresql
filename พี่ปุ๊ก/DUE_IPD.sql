SELECT
	a.an,
	a.hn,
	( p.pname || p.fname || ' ' || p.lname ) AS ptname,
	p2.NAME AS pttype,
	w.NAME AS ward,
	a.regdate,
	a.dchdate,
	i.dchstts,
	ds.NAME AS dc_stts,
	o.icode,
	d.NAME AS drug_name,
	SUM( o.qty ) AS total_qty,
	COUNT( o.icode ) AS count_rx_day,
	aa1.NAME,
	aa2.NAME,
	aa3.NAME,
	aa4.NAME,
	aa5.NAME,
	aa6.NAME,
	aa7.NAME 
FROM
	an_stat a
	LEFT JOIN patient p ON a.hn = p.hn
	LEFT JOIN pttype p2 ON a.pttype = p2.pttype
	LEFT JOIN opitemrece o ON a.an = o.an
	LEFT JOIN drugitems d ON o.icode = d.icode
	LEFT JOIN ward w ON a.ward = w.ward
	LEFT JOIN ipt i ON a.an = i.an
	LEFT JOIN dchstts ds ON i.dchstts = ds.dchstts
	LEFT JOIN icd101 aa1 ON a.pdx = aa1.
	CODE LEFT JOIN icd101 aa2 ON a.dx0 = aa2.
	CODE LEFT JOIN icd101 aa3 ON a.dx1 = aa3.
	CODE LEFT JOIN icd101 aa4 ON a.dx2 = aa4.
	CODE LEFT JOIN icd101 aa5 ON a.dx3 = aa5.
	CODE LEFT JOIN icd101 aa6 ON a.dx4 = aa6.
	CODE LEFT JOIN icd101 aa7 ON a.dx5 = aa7.CODE 
WHERE
	o.rxdate >= '2020-08-01' 
	AND o.rxdate <= '2020-08-31' 
	AND d.icode IN ( '1500022', '1530041', '1000845', '1000775', '1560033', '1570038', '1590017', '1000492' ) 
GROUP BY
	a.an,
	a.hn,
	ptname,
	p2.NAME,
	w.NAME,
	a.regdate,
	a.dchdate,
	i.dchstts,
	ds.NAME,
	o.icode,
	d.NAME,
	aa1.NAME,
	aa2.NAME,
	aa3.NAME,
	aa4.NAME,
	aa5.NAME,
	aa6.NAME,
	aa7.NAME;
