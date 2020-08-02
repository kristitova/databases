
use shop1;
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
select p.name, p.birthday_at, p.created_at, 
p.updated_at, f.total as 'Всего товара'
from users p join orders_products f on p.id=f.id
where f.total is not null;

-- Выведите список товаров products и разделов catalogs, который соответствует товару
select name, desription, price, created_at, updated_at,
(select name from catalogs where id=products.catalog_id) as name_catalog
from products 





