SELECT
    ovst.vn,
    ovst.hn,
    p.pname || p.fname || '  ' || p.lname AS ptname,
    ovst.vstdate,
    p2.name,
    d.name,
    o.qty,
    CASE
        WHEN o.sp_use <> '' THEN s.name1 || ' ' || s.name2 || ' ' || s.name3
        ELSE du.name1 || ' ' || du.name2 || ' ' || du.name3
    END AS Drug_use,
    dr.name,
    r.lab_items_name_ref AS Lab_name,
    r.lab_order_result AS Result
FROM
    ovst
    LEFT OUTER JOIN patient p ON ovst.hn = p.hn
    LEFT OUTER JOIN pttype p2 ON p2.pttype = ovst.pttype
    LEFT OUTER JOIN opitemrece o ON ovst.vn = o.vn
    RIGHT OUTER JOIN drugitems d ON o.icode = d.icode
    LEFT OUTER JOIN doctor dr ON dr.code = ovst.doctor
    LEFT OUTER JOIN drugusage du ON o.drugusage = du.drugusage
    LEFT OUTER JOIN sp_use s ON o.sp_use = s.sp_use
    LEFT OUTER JOIN lab_head l1 ON ovst.vn = l1.vn
    RIGHT OUTER JOIN lab_order r ON r.lab_order_number = l1.lab_order_number
WHERE
    ovst.vstdate >= '2023-10-08'
    AND ovst.vstdate <= '2023-10-30'
    AND r.lab_items_name_ref ILIKE '%GFR%'
    AND d.icode IN ('1620166', '1550019', '1590011');
