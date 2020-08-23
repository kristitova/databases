-- выберем спектакли Мариинского театра, отсортированные по дате
use db1;
select ev.title_, ev.date_event, loc.location from events_ ev join locations_ loc
on ev.id_location= loc.id_location where ev.id_location=80 
order by ev.date_event;

-- выберем пользователя, купившего больше всего билетов, и выведем соответствующие мероприятия
select us.first_name, us.last_name, us.tickets, ev.title_ from users_ us join pay p
on us.id=p.id_user
join events_ ev 
on p.id_event=ev.id
where us.tickets=(select max(us1.tickets) from users_ us1);

-- выведем кол-во мероприятий на каждой площадке
create or replace view own_info as
select count(ev.id) 'Кол-во мероприятий', f.location 'Площадка' from events_ ev join locations_ f on ev.id_location=f.id_location
where ev.id_location in (select id_location from locations_)
 group by ev.id_location;
 



