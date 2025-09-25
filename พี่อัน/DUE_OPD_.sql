SELECT
    ovst.vn,
    ovst.hn,
    p.pname || p.fname || ' ' || p.lname AS ptname,
    ovst.vstdate,
    p2.name,
    d.name,
    o.qty,
    CASE
        WHEN o.sp_use <> '' THEN s.name1 || ' ' || s.name2 || ' ' || s.name3
        ELSE du.name1 || ' ' || du.name2 || ' ' || du.name3
    END AS drug_use,
    dr.name,
    i.name,
    i.tname
FROM
    ovst
    LEFT OUTER JOIN patient p ON ovst.hn = p.hn
    LEFT OUTER JOIN pttype p2 ON p2.pttype = ovst.pttype
    LEFT OUTER JOIN opitemrece o ON ovst.vn = o.vn
    RIGHT OUTER JOIN drugitems d ON o.icode = d.icode
    LEFT OUTER JOIN drugusage du ON o.drugusage = du.drugusage
    LEFT OUTER JOIN sp_use s ON o.sp_use = s.sp_use
    LEFT OUTER JOIN ovstdiag od ON ovst.vn = od.vn
    RIGHT OUTER JOIN icd101 i ON od.icd10 = i.code
    LEFT OUTER JOIN doctor dr ON dr.code = ovst.doctor
WHERE
    ovst.vstdate >= '2023-02-08'
    AND ovst.vstdate <= '2023-04-08'
    AND d.icode IN (
        '1600082',
        '1620166',
        '1000700',
        '1550019',
        '1590011',
        '1650146',
        '1550024',
        '1650095',
        '1660033',
        '1640156'
    );
