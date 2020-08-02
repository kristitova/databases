use snet_vk_;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select user_id, id, name, lastname, gender, timestampdiff(year, profiles.birthday, now()) as 'age',
(select count(profile_id) total_likes from likes_posts where profile_id= profiles.user_id),
(select count(profile_id) own_likes_photo from likes_photo where profile_id= profiles.id) from 
profiles where birthday is not null 
order by birthday desc limit 10;