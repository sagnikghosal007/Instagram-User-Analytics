use ig_clone;
describe users;
select * from users;
-- 1.Identify the five oldest users on Instagram from the provided database.
 SELECT username,created_at 
 FROM  users 
 ORDER BY  created_at
 LIMIT 5;

-- 2. Identify users who have never posted a single photo on Instagram
SELECT u.username 
FROM users u 
LEFT JOIN photos
ON photos.user_id = users.id 
WHERE photos.id IS NULL;

-- 3.  Determine the winner of the contest and provide their details to the team (Contest Winner - with most no of likes in a photo)
select * from likes, photos,users;

SELECT username,photos.id,photos.image_url
COUNT(*) AS total
FROM photos
INNER JOIN likes
ON likes.photo_id=photos.id
INNER JOIN users
ON photos.user_id=users_id
GROUP BY photos.id
ORDER BY total DESC 
LIMIT 1;

-- 4. Identify and suggest the top five most commonly used hashtags on the platform.
SELECT * FROM photo_tags,tags;


SELECT t.name_of_tag as tag_name, COUNT(*) AS total 
FROM photo_tags AS p 
INNER JOIN tags AS t ON t.id = p.tag_id 
GROUP BY tag_name 
ORDER BY total DESC 
LIMIT 5;

-- 5. Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.

SELECT * FROM users;
SELECT DATE_FORMAT((created_at), '%W') AS dayy , 
       COUNT(username) 
 AS num_of_users 
 FROM users 
 GROUP BY dayy  
 ORDER BY num_of_users DESC;


-- 6. Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;
