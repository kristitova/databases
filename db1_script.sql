-- создаем базу данных мероприятий
DROP DATABASE IF EXISTS db1;
CREATE DATABASE db1;
USE db1;


-- создаем таблицу мероприятий, включающую общую информация и явл. ключевой таблицей в базе
DROP TABLE IF EXISTS events_;
CREATE TABLE events_(
	id SERIAL PRIMARY KEY,
    title_ varchar(200),
    date_event  Datetime,
    id_location BIGINT UNSIGNED NOT NULL,
    location varchar(250),
    id_members BIGINT UNSIGNED NOT NULL,
    members varchar (150),
    id_theme BIGINT UNSIGNED NOT NULL,
    theme varchar(30),
    sum_ BIGINT UNSIGNED NOT NULL, 
    index(id_members),
    index(id_location),
    index(id_theme)
    );
 -- добавляем данные в таблицу мероприятий
 Insert into events_ values
 (1, 'Концерт группы Мельница', '2020-12-04 20:00', 20, 'Клуб А2 Green Concert', 420, 'Группа "Мельница"',03, 'Рок концерт', 1900 ),
 (2, 'Концерт группы Poets of the fall', '2021-11-06 20:00', 20, 'Клуб А2 Green Concert', 310, 'Группа Poets of the fall',03, 'Рок концерт' , 1800),
 (3, 'Концерт группы In extremo', '2020-11-15 20:00', 30, 'Клуб Космонавт', 240, 'Группа In extremo', 03, 'Рок концерт', 2200 ),
 (4, 'Мирей Матье. Юбилейная программа', '2020-11-25 19:00', 10, 'Большой концертный зал "Октябрьский"', 200, 'Концерт Мирей Матье',04, 'Поп концерт',2800 ),
 (5, 'Музыкальный спектакль на льду "Алладин и повелитель огня', '2020-11-01 19:00', 50, 'Спортивный комплекс "Юбилейный"', 110, 'Детский ледовый тетр',05, 'Шоу ледовое' , 800),
 (6, 'Спектакль "Бесприданница"', '2020-09-18 19:00', 60, 'Театр им. Ленсовета', 140, 'Актеры театра', 06,'Спектакль драма', 1200 ),
 (7, 'Спектакль Ревизор', '2020-09-10 18:00', 60, 'Театр им. Ленсовета ', 150, 'Актеры театра', 06,'Спектакль драма', 1200),
 (8, 'Балет "Сильфида"', '2020-08-07 19:30', 80, 'Мариинский театр', 190, 'Актеры театра',07, 'Балет', 2000),
 (9, 'Опера "Летучий голландец"', '2020-08-05 19:30', 80, 'Мариинский театр', 210, 'Актеры театра',08, 'Опера',2200),
 (10, 'Опера "Иоланта"', '2020-08-09 19:00', 80, 'Мариинский театр', 230, 'Актеры театра',08, 'Опера',1600),
 (11, 'Концерт группы Наив"', '2020-10-01 20:00', 30, 'Клуб Космонавт', 260, 'Группа Наив',03, 'Рок концерт',1500),
 (12, 'Мюзикл "Мастер и Маргарита', '2020-09-11 18:30', 100, 'ЛДМ Новая сцена', 220, 'Актеры театра', 09,'Мюзикл',2000);
 
 -- создаем таблицу календаря мероприятий
 DROP TABLE IF EXISTS calendar;
CREATE TABLE calendar(
	id_event serial primary key,
    date_event  Datetime,
    date_today Datetime DEFAULT NOW(),
    title_ varchar(200),
    id_location BIGINT UNSIGNED NOT NULL,
    location varchar(250),
    theme varchar(30),
    premier bool,
    FOREIGN KEY (id_event) REFERENCES events_(id)
    );
    
-- добавляем данные в таблицу календарь
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (1, '2020-12-04 20:00', 'Концерт группы Мельница', 20, 'Клуб А2 Green Concert','Рок концерт', true);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (12, '2020-09-11 18:30', 'Мюзикл "Мастер и Маргарита', 100, 'ЛДМ Новая сцена','Мюзикл', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (11, '2020-10-01 20:00', 'Концерт группы Наив"', 30, 'Клуб Космонавт','Рок концерт', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (10, '2020-08-09 19:00', 'Опера "Иоланта"',  80, 'Мариинский театр','Опера', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (9, '2020-08-05 19:30', 'Опера "Летучий голландец"', 80, 'Мариинский театр','Опера', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (8, '2020-08-07 19:30', 'Балет "Сильфида"', 80, 'Мариинский театр','Балет', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (7, '2020-09-10 18:00',  'Спектакль Ревизор', 60, 'Театр им. Ленсовета ','Спектакль драма', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (6, '2020-09-18 19:00', 'Спектакль "Бесприданница"', 60, 'Театр им. Ленсовета','Спектакль драма', true);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (5, '2020-11-01 19:00', 'Музыкальный спектакль на льду "Алладин и повелитель огня"', 50, 'Спортивный комплекс "Юбилейный"','Шоу ледовое', true);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (4, '2020-11-25 19:00', 'Мирей Матье. Юбилейная программа', 10, 'Большой концертный зал "Октябрьский"','Поп концерт', false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (3, '2020-11-15 20:00', 'Концерт группы In extremo', 30, 'Клуб Космонавт','Рок концерт',false);
insert into calendar (id_event, date_event, title_, id_location, location, theme, premier) values (2, '2021-11-06 20:00', 'Концерт группы Poets of the fall', 20, 'Клуб А2 Green Concert','Рок концерт',false);

-- создаем таблицу участников мероприятий

DROP TABLE IF EXISTS members_;
CREATE TABLE members_(
	id_member BIGINT UNSIGNED NOT NULL,
    name_member varchar(100),
    activity varchar (100),
    biography  text,
    Primary key(id_member),
    FOREIGN KEY (id_member) REFERENCES events_(id_members)
    );
    
-- добавляем данные в таблицу участников мероприятий

insert into members_ values
(420, 'Группа "Мельница"', 'Рок-группа, Фолк стиль', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libeo ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(310, 'Группа Poets of the fall', 'Рок группа', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in feli. Donec semper sapien a libero. Nam dui.'),
(240, 'Группа In extremo', 'Немецкая рок группа', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(200, 'Концерт Мирей Матье', 'Французская певица Мирей Матье', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nlla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoqu penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(110, 'Детский ледовый тетр', 'Санкт-Петербургский детский ледовый театр', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(140, 'Актеры театра им. Ленсовета', 'Актеры, занятые в данном спектакле', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(150, 'Актеры театра им. Ленсовета', 'Актеры, занятые в данном спектакле', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravidanisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(190, 'Актеры  Мариинского театра', 'Актеры, занятые в данном спектакле', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam spien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(210, 'Актеры  Мариинского театра', 'Актеры, занятые в данном спектакле',  'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convllis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque,vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(230, 'Актеры  Мариинского театра','Актеры, занятые в данном спектакле', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(260, 'Группа Наив', 'Рок группа Наив', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libro non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsu ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(220, 'Актеры театра  ЛДМ',  'Актеры, занятые в данном спектакле', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus.Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere fels sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');

 -- создаем таблицу мест проведения мероприятий
 DROP TABLE IF EXISTS locations_;
CREATE TABLE locations_(
	id_location serial primary key,
    location varchar(250),
    adress varchar(180),
    description text,
    FOREIGN KEY (id_location) REFERENCES events_(id_location)
    );

-- добавляем данные в таблицу мест проведения мероприятий
insert into locations_ values
(20, 'Клуб А2 Green Concert','8 Lindbergh Street', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),

(30, 'Клуб Космонавт', '4462 Forest Dale Hill', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(10, 'Большой концертный зал "Октябрьский"', '64 Rutledge Center', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(50, 'Спортивный комплекс "Юбилейный"', '21600 Butternut Drive', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(60, 'Театр им. Ленсовета', '6 Elka Park', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),

(80, 'Мариинский театр','674 Prairieview Pass', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(100, 'ЛДМ Новая сцена', '59278 Katie Way', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');

 -- создаем таблицу тематики  мероприятий
 DROP TABLE IF EXISTS theme;
CREATE TABLE theme(
	id_theme serial primary key,
    theme varchar(100),
	FOREIGN KEY (id_theme) REFERENCES events_(id_theme)
    );
    
-- добавляем данные в таблицу тематики мероприятий

insert into theme values
(03, 'Рок концерт'),
(04, 'Поп концерт'),
(05, 'Шоу ледовое'),
(06,'Спектакль драма'),
(07, 'Балет'),
(08, 'Опера'),
(09, 'Мюзикл');

-- создаем таблицу аккаунтов
DROP TABLE IF exists users_;
Create TAble users_ (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	gender VARCHAR(50),
	email VARCHAR(50),
	tickets INT
); 

-- добавляем данные в таблицу аккаунтов
insert into users_ values
	(1,'Cozmo', 'Cabrales', 'Male', 'ccabrales0@dailymotion.com', 2),
	(2, 'Alejandra', 'Adrian', 'Female', 'aadrian1@com.com', 1),
    (3, 'Weylin', 'Martel', 'Male', 'wmartel2@home.pl', 3),
    (4, 'Carilyn', 'Bramhill', 'Female', 'cbramhill3@meetup.com', 1),
    (5, 'Lorrie', 'Lisciandro', 'Female', 'llisciandro4@feedburner.com', 1),
    (6, 'Margaretta', 'Dainty', 'Female', 'mdainty5@e-recht24.de', 2),
    (7, 'Evelyn', 'Kik', 'Male', 'ekik6@yale.edu', 1),
    (8, 'Kasey', 'Heigold', 'Female', 'kheigold7@tripod.com', 1),
    (9, 'Farleigh', 'Murfin', 'Male', 'fmurfin8@opensource.org', 2),
    (10, 'Simon', 'Dufore', 'Male', 'sdufore9@springer.com', 2),
    (11, 'Gayle', 'Matthaus', 'Male', 'gmatthausa@oracle.com', 2),
    (12, 'Leanora', 'Montfort', 'Female', 'lmontfortb@angelfire.com', 2);

-- создаем таблицу покупок билетов
DROP TABLE IF exists pay;
CREATE TABLE pay (
	id_user BIGINT UNSIGNED NOT NULL,
	id_event BIGINT UNSIGNED NOT NULL,
	action boolean,
    id_act BIGINT UNSIGNED NULL,
	sum BIGINT UNSIGNED NULL,
    primary key(id_user, id_event),
    index(id_act),
    FOREIGN KEY (id_user) REFERENCES users_(id),
    FOREIGN KEY (id_event) REFERENCES events_(id)
); 

-- добавляем данные в таблицу покупок билетов

insert into pay values
(1,1,false, NULL,1900 ),
(1,6,false, 15,1200 ),
(2,7,true, 30,1200 ),
(3,2,false, NULL,1800 ),
(3,3,false, NULL,2200 ),
(3,12,false, NULL,2000 ),
(4,7,true, 30,1200 ),
(5,8,false, NULL,2000 ),
(6,4,false, NULL,2800 ),
(6,9,false, NULL,2200 ),
(7,12,false, NULL,2000 ),
(8,11,false, NULL,1500 ),
(9,5,false, NULL,800 ),
(10,8,false, NULL,2000 ),
(10,1,false, NULL,1900 ),
(11,6,false, 15,1200 ),
(11,9,false, NULL,2200 ),
(12,1,false, NULL,1900 ),
(12,3,false, NULL,2200 );

-- создаем таблицу акций
DROP TABLE IF EXISTS actions_;
CREATE TABLE actions_(
	id serial primary key,
    title_action varchar(100),
    title_event varchar (200),
	FOREIGN KEY (id) REFERENCES pay(id_act)
    );
    
-- добавляем данные в таблицу акцийalter

insert into actions_ values
(15, 'Акция 15%',  'Спектакль "Бесприданница"' ),
(30, 'Акция 30%',  'Спектакль "Ревизор"' );

-- создаем таблицу отзывов 
drop table if exists review_ ;
create table review_ (
	id serial primary key,
    id_user BIGINT UNSIGNED NOT NULL,
    id_event_ BIGINT UNSIGNED NOT NULL,
    review text,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_user) REFERENCES users_(id)
);

insert into review_ values
(1,5,8,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2020-08-10'),
(2, 10,1,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.','2020-08-10'),
(3,9,5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2020-08-11');



