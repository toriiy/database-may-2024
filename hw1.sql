show databases;
use torii24;

select * from cars;
select * from cars where year<2000;
select * from cars where year>2015;
select * from cars where year between 2008 and 2010;
select * from cars where year in (2008, 2009, 2010);
select * from cars where year not between 2008 and 2010;
select * from cars where year not in (2008, 2009, 2010);
select * from cars where year = price;

select * from cars where model = 'bmw' and year<2014;
select * from cars where model = 'audi' and year>2014;
select * from cars limit 5;
select * from cars order by id desc limit 5;

select avg(price), model from cars where model = 'kia';
select avg(price), model from cars group by model;
select count(*), model from cars group by model;
select count(*),model from cars group by model order by count(*) desc limit 1;

select * from cars where model like '_a%a_';
select * from cars where length(model)>8;

select avg(price) from cars;
select * from cars where price> (select avg(price) from cars);