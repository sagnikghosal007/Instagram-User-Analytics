use ig_clone;
describe users;
select * from users;
-- 1.Identify the five oldest users on Instagram from the provided database.
select username,created_at from users order by created_at limit 5;

-- 2. Identify users who have never posted a single photo on Instagram
select * from photos,users;
select u.username from users u left join photos p on p.user_id=u.id where p.image_url is null order by u.username;

-- 3.  Determine the winner of the contest and provide their details to the team
select * from likes, photos,users;

select likes.photo_id,users.username, count(likes.user_id) as numberoflike from likes inner join photos on likes.photo_id=users.id group by likes.photo_id,users.username order by numberoflike desc ;

-- 4. Identify and suggest the top five most commonly used hashtags on the platform.
select * from photo_tags,tags;
select t.name_of_tag , count(p.photo_id) as ht from photo_tags p inner join tags t on t.id=p.tag_id group by t.name_of_tag order by ht desc;

-- 5. Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.

select * from users;
select DATE_FORMAT((created_at), '%W') as dayy , count(username) as num_0f_users from users group by 1 order by 2 desc;


-- 6. Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.
select * from photos,users;
with base as (
select u.id as userid,count(p.id) as phtotid from users u left join photos p on p.user_id=u.id group by u.id)
select sum(photid) as total photos, count(userid) as total_users, sum(photo_id)/count(userid) as photo_per_user 
from base;