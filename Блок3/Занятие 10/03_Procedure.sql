select o.onum, 
       o.cnum, 
       o.osamt-o.ocamt as dolg, 
       (select top 1 dcamt 
           from Documents d 
           where d.onum = o.onum and dcamt > 0
           order by ddate desc) as pamt, 
       (select top 1 ddate 
           from Documents d 
           where d.onum = o.onum  and dcamt > 0
           order by ddate desc) as pdateamt, 
       o.snum
   INTO ReportV
   FROM Orders o