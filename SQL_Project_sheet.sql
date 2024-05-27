-- SQL PROJECT
use ProjectSQL;

show tables;

select * from olympics
limit 10;


-- 1. Show how many medal counts present for entire data
-- 1)
select count(*) from olympics;

-- 2)
select medal, count(*) from olympics
group by medal;

-- 3)
select medal, count(medal) as medal_count
from Olympics
group by medal
order by medal_count asc;


-- 2. Show count of unique sports present in Olympics

-- 1) wrong
select distinct(count(sport)) from olympics
group by sport;

-- 2) Wright
select count(distinct(sport)) as Unique_sports_count
from olympics;


-- 3. Show how many different medals won by team India

-- 1)
select medal, count(*) as India_Medal_count from olympics
where team="India"
group by medal;

-- 2)
select medal, count(medal) as India_medal_count
from olympics
where team='India'
group by medal
order by India_medal_count desc;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order

-- 1)
select event, team, count(*) as India_medal_H_L
from olympics
where team="India"
group by event, team
order by India_medal_H_L desc;

-- 2)
select event, count(medal) as India_medal_count
from Olympics
where team='India' and medal <> 'nomedal'
group by event
order by India_medal_count desc;


-- 5. Show event wise medals won by India in order of year

-- 1)
select event,year, count(*) as India_medal_won
from olympics
where team='India'
group by event, year
order by India_medal_won;

-- 2)
select event,year, count(medal) as India_medal_won
from Olympics
where team='India' and medal <> 'Nomedal'
group by event, year
order by India_medal_won;


-- 6. show country who won maximum medals.

-- 1)
select team, count(*) as Max_medals
from olympics
group by team
order by Max_medals desc
limit 1;

-- 2)
select  team, count(medal) as Max_medal
from olympics
where medal <> "nomedal"
group by team
order by Max_medal desc
limit 1;

-- 7.show top 10 countries who won gold
-- 1)
select team, count(medal) as Gold from olympics
where medal <> "nomedal" and medal <> "Silver" and medal <> "Bronze"
group by team
order by Gold desc
limit 10;

-- 2)
select team, count(medal) as gold_medal_count
from olympics
where medal <> "nomedal" and medal <> "Silver" and medal <> "Bronze"
group by team
order by gold_medal_count desc
limit 10;


--  8. show in which year did United states won most gold medal

select year, count(medal) as Gold
from Olympics
where medal <> "nomedal" and team="United State"
group by year
order by Gold desc
limit 1;


-- 9. In which sports United States has most medals.
----------------
select sport, count(medal) as most_medal
from olympics
where team="United state"
group by sport
order by most_medal desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country
--------------
select name, sport, team, count(medal) as most_medal
from olympics
group by name, sport, team
order by most_medal desc
limit 3;

-- 11. Find player with most gold medals in cycling along with his country.
--------
select name, team, sport, count(medal) as Gold_medal
from olympics
where medal <> "Silver" and medal <> 'Bronze' and medal <> "nomedal" and sport='cycling'
group by name, team
order by Gold_medal desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select team, name, count(medal) as medal_count
from olympics
where sport = "Basketball"
group by team, name
order by medal_count desc
limit 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

select name, medal, count(medal) as diff_count
from olympics
where name ="Teresa Edwards"
group by name, medal
order by diff_count;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

select year, sex, count(medal) as medal_count
from olympics
where medal <> "nomedal"
group by year, sex
order by year asc;

