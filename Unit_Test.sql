select count(*) from cap_mi_test.v_financial_account_dim --2699094


select count(*) from cap_mi_test.v_financial_account_dim where account_type is null;--0
select count(*) from cap_mi_test.gl_account_daily_aggregated_fact where account_type is null;--0

select bancs_account_number,account_type,business_date  from
cap_mi_test.gl_account_daily_aggregated_fact
where bancs_account_number in ('0000000300010735') and business_date in ('2016-12-26','2017-09-26')
--0000000300010735	PWC	2016-12-26
--0000000300010735	PWC	2017-09-26

select bancs_account_number,account_type,business_date from
cap_mi_test.v_financial_account_dim
where bancs_account_number in ('0000000300010735') and business_date in ('2016-12-26','2017-09-26')


SELECT 
g.glif_references bancs_account_number, 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '01' THEN 'NRP' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '02' THEN 'PWC' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '03' THEN 'Employer' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '04' THEN 'Bailiff' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '05' THEN 'XXX' 
ELSE CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '06' THEN 'Third Party' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '07' THEN 'XXX' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '08' THEN 'SAR' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '09' THEN 'Employer OD' 
ELSE CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '10' THEN 'PWD OD' ELSE 
CASE WHEN substring(d.acct_scheme_typ, 5, 2) = '11' THEN 'SoS' 
ELSE substring(d.acct_scheme_typ, 5, 2) END END END END END END END END END END END account_type

FROM bancs_base.glif g 
INNER JOIN (select invm.key_1,invm.acct_type,invm.int_cat  from bancs_base.invm 

where upper(trim(invm.current_flg)) = 'Y') i ON concat(upper(trim(g.soc)), upper(trim(g.glif_references))) = upper(trim(i.key_1)) 
INNER JOIN  (select depp.type, depp.int_cat, depp.acct_scheme_typ from bancs_base.depp  where upper(trim(depp.current_flg)) ='Y') d 
ON i.acct_type = d.type AND i.int_cat = d.int_cat 
WHERE  upper(trim(g.current_flg)) = 'Y'
and g.glif_references  in ('0000000300010735') and g.business_date in ('2016-12-26','2017-09-26')







select count(*) from cap_mi_test.v_financial_account_dim where type is null;--0


select count(*) from cap_mi_test.v_financial_account_dim where bancs_account_number is null;--0
select count(*) from cap_mi_test.gl_account_daily_aggregated_fact where bancs_account_number is null;

select count(*) from cap_mi_test.v_financial_account_dim where gl_class_code is null;--0
gl_transcation_id


select count(*) from cap_mi_test.v_financial_account_dim where gl_transcation_id is null;--0

select count(*) from cap_mi_test.v_financial_account_dim where gl_code is null;--0


select count(*) from cap_mi_test.v_financial_account_dim where gl_branch is null
union all
select count(*) from cap_mi_test.v_financial_account_dim where scheme is null
union all
select count(*) from cap_mi_test.v_financial_account_dim where division is null

--0 0 0

select count(*) from cap_mi_test.gl_account_daily_aggregated_fact where branch is null
union all
select count(*) from cap_mi_test.gl_account_daily_aggregated_fact where scheme is null
union all
select count(*) from cap_mi_test.gl_account_daily_aggregated_fact where division is null
-- 0 0 0 


select bancs_account_number,branch,scheme,division,business_date from
cap_mi_test.gl_account_daily_aggregated_fact
where bancs_account_number in ('0000000300009503') and business_date in ('2018-03-12','2017-11-12')
--0000000300009503	01000	FS	GB	2017-11-12
--0000000300009503	01000	FS	GB	2018-03-12

select bancs_account_number,gl_branch,scheme,division,business_date from
cap_mi_test.v_financial_account_dim
where bancs_account_number in ('0000000300009503') and business_date in ('2018-03-12','2017-11-12')


SELECT 
g.glif_references bancs_account_number, 
g.brch gl_branch, 
CASE WHEN substring(d.acct_scheme_typ, 2, 1) = '1' THEN 'FS' ELSE CASE WHEN substring(d.acct_scheme_typ, 2, 1) = '2' THEN 'RB' ELSE substring(d.acct_scheme_typ, 2, 1) END END scheme, 

CASE WHEN substring(d.acct_scheme_typ, 3, 1) = '1' THEN 'GB' ELSE CASE WHEN substring(d.acct_scheme_typ, 3, 1) = '2' THEN 'NI' ELSE substring(d.acct_scheme_typ, 3, 1) END END division
--same as above with all records


FROM bancs_base.glif g 
INNER JOIN (select invm.key_1,invm.acct_type,invm.int_cat  from bancs_base.invm 

where upper(trim(invm.current_flg)) = 'Y') i ON concat(upper(trim(g.soc)), upper(trim(g.glif_references))) = upper(trim(i.key_1)) 
INNER JOIN  (select depp.type, depp.int_cat, depp.acct_scheme_typ from bancs_base.depp  where upper(trim(depp.current_flg)) ='Y') d 
ON i.acct_type = d.type AND i.int_cat = d.int_cat 
WHERE  upper(trim(g.current_flg)) = 'Y'
and g.glif_references in ('0000000300009503') 
and g.business_date in  ('2018-03-12','2017-11-12')
--same as above with all records


---this has been repeated for ('0000000300017646') and g.business_date in ('2018-11-07','2017-05-17')




select bancs_account_number,aggregate_value_of_nrp_child_maintenance_libality_charged,aggregate_value_of_pwc_child_maintenance_liability_charged,
business_date
from cap_mi_test.gl_account_daily_aggregated_fact where bancs_account_number = '0000000300014944'
and business_date = '2018-02-17'

0000000300014944	0	-305.66

select bancs_account_number,gl_code,gl_transcation_amount,business_date from
cap_mi_test.v_financial_account_dim
where bancs_account_number in ('0000000300014944') and business_date in ('2018-02-17')

0000000300014944	56001	305.66	2018-02-17
0000000300014944	11001	-305.66	2018-02-17




select count(*) from cap_mi_test.v_Asset_dim where key_1 is null --0


select account_type,count(*) from cap_mi_test.tmp_financial_account where master_case_number_finance is null
group by account_type




select 
count(*)

 from 
(select substr(concat(substr(key_1,4),cast(

(case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),16,1) as int) = 0 then 0
else cast(substr('010203040506070809',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),16,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),15,1) as int) = 0 then 0
else cast(substr('020406081001030507',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),15,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),14,1) as int) = 0 then 0
else cast(substr('040801050902061003',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),14,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),13,1) as int) = 0 then 0
else cast(substr('080502100704010906',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),13,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),12,1) as int) = 0 then 0
else cast(substr('051004090308020701',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),12,1) as int) *2,1) as int) end
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),11,1) as int) = 0 then 0
else cast(substr('100908070605040302',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),11,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),10,1) as int) = 0 then 0
else cast(substr('090705030110080604',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),10,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),9,1) as int) = 0 then 0
else cast(substr('070310060209050108',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),9,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),8,1) as int) = 0 then 0
else cast(substr('030609010407100205',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),8,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),7,1) as int) = 0 then 0
else cast(substr('060107020803090410',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),7,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),6,1) as int) = 0 then 0
else cast(substr('010203040506070809',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),6,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),5,1) as int) = 0 then 0
else cast(substr('020406081001030507',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),5,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),4,1) as int) = 0 then 0
else cast(substr('040801050902061003',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),4,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),3,1) as int) = 0 then 0
else cast(substr('080502100704010906',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),3,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),2,1) as int) = 0 then 0
else cast(substr('051004090308020701',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),2,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),1,1) as int) = 0 then 0
else cast(substr('100908070605040302',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),1,1) as int) *2,1) as int) end 
)%10 as string)),8) as accno,key_1,acct_type,int_cat

from 
bancs_base.invm where upper(trim(current_flg))='Y' and key_1 in

(select key_1 from cap_mi_test.tmp_financial_account where master_case_number_finance is null and account_type = 'NRP')

) invm
left outer join

(select  asset_num,pr_con_id,case_id,owner_accnt_id from siebel_base.s_asset  where upper(trim(s_asset.current_flg)) = 'Y')s_asset

on invm.accno = s_asset.asset_num


left outer join 
(select 

A.row_id,A.mstr_case_id from 
(select *,row_number () over (partition by `s_contact`.`row_id` order by `s_contact`.`business_date` desc) as rownum
from siebel_base.s_contact where `s_contact`.`current_flg`='Y') A
where A.rownum = 1) s_contact
on s_contact.row_id  = s_asset.pr_con_id

left outer join 
(
select B.row_id,B.case_num from 
(select *,row_number () over (partition by `s_case`.`row_id` order by `s_case`.`business_date` desc) as rownum
from siebel_base.s_case where `s_case`.`current_flg`='Y') B
where B.rownum = 1) s_case

on s_case.row_id =s_contact.mstr_case_id

where s_asset.asset_num is not null

and s_contact.row_id is not null
and s_case.row_id is not null
---0


--------------------

employer




select count(*) from cap_mi_test.tmp_financial_account where 
--employer_name is not null
--and  
branch = '05000'



select 

--distinct owner_accnt_id
count(*)
 from 
(select substr(concat(substr(key_1,4),cast(

(case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),16,1) as int) = 0 then 0
else cast(substr('010203040506070809',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),16,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),15,1) as int) = 0 then 0
else cast(substr('020406081001030507',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),15,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),14,1) as int) = 0 then 0
else cast(substr('040801050902061003',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),14,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),13,1) as int) = 0 then 0
else cast(substr('080502100704010906',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),13,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),12,1) as int) = 0 then 0
else cast(substr('051004090308020701',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),12,1) as int) *2,1) as int) end
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),11,1) as int) = 0 then 0
else cast(substr('100908070605040302',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),11,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),10,1) as int) = 0 then 0
else cast(substr('090705030110080604',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),10,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),9,1) as int) = 0 then 0
else cast(substr('070310060209050108',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),9,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),8,1) as int) = 0 then 0
else cast(substr('030609010407100205',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),8,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),7,1) as int) = 0 then 0
else cast(substr('060107020803090410',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),7,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),6,1) as int) = 0 then 0
else cast(substr('010203040506070809',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),6,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),5,1) as int) = 0 then 0
else cast(substr('020406081001030507',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),5,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),4,1) as int) = 0 then 0
else cast(substr('040801050902061003',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),4,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),3,1) as int) = 0 then 0
else cast(substr('080502100704010906',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),3,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),2,1) as int) = 0 then 0
else cast(substr('051004090308020701',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),2,1) as int) *2,1) as int) end 
+
case when cast(substr(LPAD(SUBSTR (KEY_1,4),16,'0'),1,1) as int) = 0 then 0
else cast(substr('100908070605040302',cast(substr(LPAD(SUBSTR(KEY_1,4),16,'0'),1,1) as int) *2,1) as int) end 
)%10 as string)),8) as accno,key_1,acct_type,int_cat

from 
bancs_base.invm where upper(trim(current_flg))='Y' and key_1 in

(select key_1 from cap_mi_test.tmp_financial_account where  branch = '05000')

) invm
left outer join

(select  asset_num,pr_con_id,case_id,owner_accnt_id from siebel_base.s_asset  where upper(trim(s_asset.current_flg)) = 'Y')s_asset

on invm.accno = s_asset.asset_num


left outer join 
(select 

A.row_id,A.mstr_case_id from 
(select *,row_number () over (partition by `s_contact`.`row_id` order by `s_contact`.`business_date` desc) as rownum
from siebel_base.s_contact where `s_contact`.`current_flg`='Y') A
where A.rownum = 1) s_contact
on s_contact.row_id  = s_asset.pr_con_id

left outer join 
(
select B.row_id,B.case_num from 
(select *,row_number () over (partition by `s_case`.`row_id` order by `s_case`.`business_date` desc) as rownum
from siebel_base.s_case where `s_case`.`current_flg`='Y') B
where B.rownum = 1) s_case

on s_case.row_id =s_contact.mstr_case_id

left outer join cap_mi_test.v_employer_dim
on s_asset.owner_accnt_id=v_employer_dim.employer_id

where s_asset.asset_num is not null
and s_asset.owner_accnt_id is not null
and v_employer_dim.employer_id is not null



------------------------------------------------------------------