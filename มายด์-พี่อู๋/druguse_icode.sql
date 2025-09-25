SELECT
  o.hn,
  o.an,
  o.vn,
  p.pname || p.fname || '  ' || p.lname AS ptname,
  p2.name,
  d.name,
  d.strength,
  CASE
    WHEN o.sp_use <> ''
      THEN s.name1 || ' ' || s.name2 || ' ' || s.name3
      ELSE du.name1 || ' ' || du.name2 || ' ' || du.name3
  END AS drug_use,
  d.icode,
  o.rxdate,
  o.qty,
  dr.name
FROM
  opitemrece o
  LEFT JOIN patient p ON o.hn = p.hn
  LEFT JOIN pttype p2 ON p2.pttype = o.pttype
  LEFT JOIN drugitems d ON o.icode = d.icode
  LEFT JOIN drugusage du ON o.drugusage = du.drugusage
  LEFT JOIN sp_use s ON o.sp_use = s.sp_use
  LEFT JOIN doctor dr ON dr.code = o.doctor
WHERE 
  d.icode IN ('1590032')
  AND o.rxdate >= '2023-09-01'
  AND o.rxdate <= '2023-11-21';
