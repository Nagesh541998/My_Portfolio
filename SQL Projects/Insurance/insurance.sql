Drop database if exists Insure;
create database Insure;
use insure;

-- 1. Count for each categories of ‘region'
select * from Insurance;
select region, count(*) as category_count
from insurance 
group by region;

-- 2. Find 50 records of highest ‘age’ and export data/table to desktop 
select * from insurance order by age desc
limit 50;

-- 3. Add index name ‘quick’ on ‘id’
create index quick_ on insurance(id);
select * from insurance;

-- 4.  Describe the schema of table  
describe insurance;

-- 5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view] 
select id, age, bmi, children, smoker, region, charges from insurance;
select * from insurance;
create or replace view gender as 
select id, age, bmi, children, smoker, region, charges from insurance;
Grant select on gender to userone;

-- 6. Rename the view as ‘type’ 
select * from gender;
create or replace view type as
select id, age, bmi, children, smoker, region, charges from insurance;
drop view gender;
select * from type;

-- 7. Count how many are ‘northwest’ insurance holders 
select region, Count(*) as Count_Northwest
from insurance where region = 'northwest'
group by region  ;

-- 8.  Count how many insurance holders were ‘femail’  
select sex, count(*) as No_of_Females
from insurance where sex ='female'
group by sex;

-- 9. Create Primary key on a suitable column 
select * from Insurance;


-- 10, Create a new column ‘ratio’ which is age multiply by bmi  
alter table insurance add column ratio varchar(20);
update insurance set ratio = age*bmi;
select * from insurance;

-- 11. Arrange the table from high to low according to charges  
select * from insurance order by charges asc;

-- 12.  Find MAX of ‘charges’  
select max(charges) as Max_charges from insurance ; 

-- 13. Find MIN of ‘charges’ 
select min(charges) as Min_Charges from Insurance;

-- 14.  Find average of ‘charges’ of male and female  
select sex, round(avg(charges)) as Avg_Gender from insurance group by sex;

-- 15. Write a Query to rename column name sex to Gender
alter table insurance
rename column sex to gender;
select * from insurance;

/* 16. Add new column as HL_Charges where more than average charges should be 
categorized as HIGH and less than average charges should be categorized as LOW */

alter table insurance add column HL_Charges Varchar (7);
select round(avg(charges)) as AVG_Charges from insurance;
update insurance 
set HL_Charges = case
when charges > 13270 then 'High'
else
'Low'
end;
select * from Insurance;

-- 17. Change location/position of ‘smoker’ and bring before ‘children’
create table NEWInsurance as select id, age, gender, bmi, smoker, children, region, charges, ratio, HL_Charges from Insurance;
select * from NEWInsurance;
drop table Insurance;
Alter table NEWInsurance rename Insurance;
Select * from Insurance;

-- 18. Show top 20 records  
Select * from insurance 
limit 20;

-- 19. Show bottom 20 records 
select * from insurance order by id desc limit 20;

-- 20. Randomly select 20% of records and export to desktop 

-- 21.  Remove column ‘ratio’  
Alter table insurance drop ratio;
select * from Insurance;

-- 22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using # 
use insure;
select * from Insurance;
Select gender, bmi from insurance where bmi > (select round(avg(bmi)) from insurance);

-- 23.  Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children
create or replace view Female_HL_Charges as
select HL_Charges, Gender, smoker, children from insurance where HL_Charges = 'High' and gender = 'Female' and smoker = 'Yes' and Children = 0;
select * from Female_HL_Charges;

/* 24.  Update children column if there is 0 children then make it as Zero Children, if 1 
then one_children, if 2 then two_children, if 3 then three_children, if 4 then 
four_children if 5 then five_children else print it as More_than_five_children. */
 
select * from Insurance;
describe insurance;
alter table insurance 
add column Children_Description Varchar (50);
Update insurance
set Children_Description = case
when children =0 then 'Zero'
when children =1 then 'One_Children'
when children =2 then 'Two_Children'
when children =3 then 'Three_Children'
when children =4 then 'Four_children'
when children =5 then 'Five_children'
else 'More_Than Five'
end;

select * from Insurance;

  