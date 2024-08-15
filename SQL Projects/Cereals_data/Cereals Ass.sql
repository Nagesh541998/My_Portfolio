show databases;
drop database if exists cereals;
create database cereals;
use cereals;
select * from cereals_data;
-- Assisgnment Questions
-- 1. Add index name fast on name 
create index Fast on cereals_data (name);

-- 2.  Describe the schema of table  
describe cereals_data;

-- 3.  Create view name as see where users can not see type column [first run appropriate query then create view]  
select name, mfr, calories, protein, fat, sodium, fiber, carbo, sugars, potass, vitamins, shelf, weight, cups, rating from cereals_data;
create or replace view SEE as
select name, mfr, calories, protein, fat, sodium, fiber, carbo from cereals_data;
select * from SEE;

-- 4.  Rename the view as saw 
create or replace view SAW as
select name, mfr, calories, protein, fat, sodium, fiber, carbo from Cereals_data;
drop view SEE;
select * from SAW;

-- 5.Count how many are cold cereals  
select * from Cereals_data;
select * from cereals_data where type= 'C';
select count(*) as Cold_cereals_count from cereals_data where type= 'C';

-- 6.  Count how many cereals are kept in shelf 3 
select * from cereals_data;
select count(*) as cereals_kept_Shelf_3 from cereals_data where shelf = 3;

-- 7. Arrange the table from high to low according to ratings  
select * from cereals_data;
select * from Cereals_data order by rating asc;

-- 8.  Suggest some column/s which can be Primary key
alter table cereals_data add column SLNO varchar (10) first;
insert into SLNO 
select * from cereals_data;

-- 9.  Find average of calories of hot cereal and cold cereal in one query
select * from cereals_data;
select type, round(avg(calories),2) as Average_cereals_on_type
from cereals_data
group by type;

-- 10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW
select avg(calories) as Average_Calories
from cereals_data;
alter table cereals_data add column HL_Calories varchar(5);
select * from cereals_data;
update cereals_data 
set HL_Calories = case
	when calories > (106.9737) then 'High'
    else 'Low'
end;
select * from cereals_data;


-- 11. List only those cereals whose name begins with B 
select * from cereals_data where name like 'b%';


-- 12.  List only those cereals whose name begins with F 
select * from cereals_data where name like 'f%';

-- 13. List only those cereals whose name ends with s 
select * from cereals_data where name like '%s';

-- 14. Select only those records which are HIGH in column HL_calories
select * from cereals_data where HL_calories = 'High';

-- 15.  Find maximum of ratings  
select * from Cereals_data;
select Max(rating) as Max_rating from Cereals_data;
 
-- 16. Find average ratings of those were High and Low calories
select HL_calories, round(avg(rating),2) as Avg_Rating 
from Cereals_data
group by HL_Calories;

-- 17. Remove column fat  
alter table cereals_data
drop fat;
select * from Cereals_data;


-- 18. Count records for each manufacturer [mfr]  
select mfr, count(*) as NO_of_mfr from cereals_data group by mfr;

-- 19. Select name, calories and ratings only 
select name, calories, rating from cereals_data;



