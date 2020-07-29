
-- 1 и 2 запросы из урока 5
use vk_1;
alter table users drop column  created_at, 
					drop column updated_at;

alter table users add column created_at varchar(150),
					add column updated_at varchar(150);

update users
	set created_at=now(),
		updated_at=now() where id>0 and id<=100;

select cast(created_at as datetime ) as created_at, cast(updated_at as datetime) as updated_at from users;
-- 3 запрос из урока 5
DROP DATABASE IF EXISTS products;
CREATE DATABASE products;
USE products;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	value_ int
    );
    
insert into storehouses_products values
	(15),
	(82),
	(44),
	(97),
	(90),
	(89),
	(41),
	(9),
	(49),
	(30),
	(68),
	(99),
	(0),
	(49),
	(94),
	(8),
	(92),
	(7),
	(70),
	(76),
	(63),
	(7),
	(27),
	(56),
	(29),
	(45),
	(55),
	(4),
	(94),
	(4),
	(9),
	(18),
	(63),
	(13),
	(95),
	(0),
	(93),
	(83),
	(59),
	(24),
	(19),
	(7),
	(59),
	(94),
	(54),
	(95),
	(9),
	(84),
	(12),
	(17),
	(93),
	(52),
	(34),
	(32),
	(45),
	(39),
	(5),
	(89),
	(97),
	(52),
	(17),
	(18),
	(92),
	(74),
	(22),
	(23),
	(27),
	(63),
	(52),
	(97),
	(57),
	(77),
	(31),
	(48),
	(23),
	(52),
	(57),
	(62),
	(55),
	(66),
	(55),
	(58),
	(82),
	(83),
	(89),
	(30),
	(58),
	(31),
	(40),
	(6),
	(23),
	(63),
	(78),
	(9),
	(87),
	(25),
	(2),
	(10),
	(59),
	(42);

select value_ from storehouses_products
order by case when value_= 0 then 1 else 0 end, value_ ASC;

-- 4 запрос из урока 5
Use vk_1;

select * from profiles_ where monthname(birthday)='May' 
or monthname(birthday)='August';

-- 5 запрос из урока 5
select * from users where id in (5, 1,2) order by field(id, 5, 1,2); 

-- 6 запрос из урока 5
select round(avg(year(now())-year(birthday)),0) as 'Средний возраст'
 from profiles_;
 
 