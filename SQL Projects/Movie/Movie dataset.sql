drop database if exists Movies_Dataset;
create database Movies_Dataset;
use Movies_Dataset;
Select * from Actor;
select * from Cast;
Select * from Director;
Select * from genres;
Select * from movie;
select * from Movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

-- 1. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year. 
select * from Movie;
select Mov_title, mov_year from Movie where mov_title = 'American Beauty' and (Select Mov_year from Movie where mov_title = 'American Beauty');

-- 2. Write a SQL query to find those movies, which were released before 1998. Return movie title.
select Mov_title, Mov_year from movie where Mov_year < 1998;

-- 3. Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120. 
select * from Movie where Mov_year > 1995 and Mov_time > 120;

-- 4. Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select mov_year, Mov_title, mov_rel_country from movie order by Mov_year asc limit 7;

-- 5. Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001. 
select * from Movie;
select distinct mov_lang from movie;
update movie set mov_lang = 'Chinese' where Mov_year = 2001;
select * from Movie;
select distinct mov_lang from movie;

-- 6. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'. 
select * from reviewer;
select * from ratings;
select * from Movie;
select rt.rev_id, m.Mov_id, m.Mov_title from ratings rt inner join movie m using (mov_id);
select rt.rev_id,rv.rev_name from ratings rt inner join reviewer as rv using (rev_id);

select rt.rev_id, rv.rev_name, m.mov_title from ratings rt inner join movie m on rv.rev_id = rt.rev_id
inner join movie m on m.Mov_id = rt.mov_id;

select rt.rev_id, rv.rev_name, m.mov_title from ratings as rt inner join 
reviewer as rv on rt.rev_id = rv.rev_id inner join movie as m on m.Mov_id = rt.mov_id where Mov_title = 'Slumdog Millionaire';

-- 7. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
select * from actor;
select a.act_fname,a.act_lname,a.act_gender, c.role from actor as a inner join cast as c on a.act_id = c. act_id where act_gender != 'M';

-- 8. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator).
select * from genres;
select * from actor;
select * from cast;
select * from Movie;
SELECT * FROM actor
WHERE act_id IN (
    SELECT act_id FROM cast
    WHERE mov_id = (SELECT mov_id FROM movie
        WHERE mov_title = 'Annie Hall')
);
select distinct a.* from actor as a
join cast as c on a.act_id = c.act_id
join movie as m on c.mov_id = m.mov_id
where m.mov_title = 'Annie Hall';
select distinct actor;

/* 9. Write a SQL query to find those movies that have been released in countries other 
than the United Kingdom. Return movie title, movie year, movie time, and date of 
release, releasing country. */

select mov_title, mov_year, mov_time, mov_dt_rel, mov_rel_country from movie where mov_rel_country != 'UK';

-- 10. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select * from genres;
select * from Movie;
select * from Movie_genres;
select g.gen_id, g.gen_title, mg.mov_id, m.mov_time from genres as g join movie_genres as mg on g.gen_id = mg.gen_id inner join movie as m where (select max(mov_time) as Max_Time);
SELECT
    g.gen_title AS Genre,
    MAX(m.mov_time) AS MaxDuration,
    COUNT(mg.mov_id) AS MovieCount
FROM genres g
INNER JOIN movie_genres mg ON g.gen_id = mg.gen_id
INNER JOIN movie m ON mg.mov_id = m.mov_id
GROUP BY g.gen_id, g.gen_title;
