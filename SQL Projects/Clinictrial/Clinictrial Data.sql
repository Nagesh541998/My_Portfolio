drop database if exists clinictrail;
create database clinic;
use clinic;
select * from Clinictrial;

-- 1. Add index name fast on Name
create index idx_fast on clinictrial(BP);
select * from clinictrial where BP< 200;
alter table clinictrial drop index idx_fast;

-- 2. Describe the schema of table 
describe clinictrial;

-- 3. Find average of Age
select round(avg(age)) from clinictrial;

-- 4. Find minimum of Age 
select min(age) from clinictrial;

-- 5. Find maximum of Age
select max(age) from clinictrial;

-- 6. Find average age of those were pregnant and not pregnant
select pregnant, round(avg(age),2) from clinictrial
group by pregnant;

-- 7.  Find average blood pressure of those had drug reaction and did not had drug reaction
select * from clinictrial;
select drug_reaction, round(avg(BP),2) as AVG_Drug_reaction from clinictrial
group by  drug_reaction;

/* 8. Add new column name as ‘Age_group’ and those having age between 16 & 21 
should be categorized as Low, more than 21 and less than 35 should be 
categorized as Middle and above 35 should be categorized as High. */
alter table clinictrial add column Age_group varchar(10);
update clinictrial 
set age_group = case 
when age <21 then 'Low'
when age <35 then 'Middle'
else 'High'
end; 
select * from clinictrial;

-- 9. Change ‘Age’ of Reetika to 32 
update clinictrial  
set age= 32 where name = 'reetika';

-- 10. Change name of Reena as Shara’ 
update clinictrial
set name = 'Shara' where name = 'Reena';

-- 11. Remove Chlstrl column 
Alter table clinictrial
drop column chlstrl;

-- 12.  Select only Name, Age and BP
Select name, age, BP from clinictrial;

-- 13. Select ladies whose first name starts with ‘E’ 
select Name from clinictrial where name like 'e%';

-- 14. Select ladies whose Age_group were Low
select name, age, age_group from clinictrial where age_group = 'Low';

-- 15. Select ladies whose Age_group were High 
select name, age, age_group from clinictrial where age_group = 'high';

-- 16. Select ladies whose name starts with ‘A’ and those were pregnant 
select name, pregnant from clinictrial where name like 'a%' and pregnant = 'Yes';

-- 17. Identify ladies whose BP was more than 120  
select name, BP from clinictrial where BP> 120;

-- 18.  Identify ladies whose BP was between 100 and 120  
select name, BP from clinictrial where 100<BP> 120;

-- 19.  Identify ladies who had No anxiety aged less than 30 
select * from clinictrial;
select name, Anxty_LH, age from clinictrial where Anxty_LH = 'No' and age<30;

-- 20.  Select ladies whose name ends with ‘i’ 
select name from clinictrial where name like '%i';

-- 21. Select ladies whose name ends with ‘a’  
select name from clinictrial where name like '%a';

-- 22. Select ladies whose name starts with ‘K’ 
select name from clinictrial where name like 'k%';

-- 23. Select ladies whose name have ‘a’ anywhere 
select name from clinictrial where name like '%a%';

-- 24.  Order ladies in ascending way based on ‘BP’ 
select * from clinictrial order by BP asc;

-- 25. Order ladies in descending way based on ‘Age’
select * from clinictrial order by age desc;