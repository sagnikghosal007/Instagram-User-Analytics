# 📊 Instagram Clone Database Analysis

This project performs analytical SQL queries on an Instagram clone database (`ig_clone`) to extract meaningful insights. It answers specific business-oriented questions such as identifying active users, engagement levels, hashtag popularity, and user registration behavior.

---

## 📁 Database Tables Used

- `users`: Contains user information.
- `photos`: Stores photo uploads by users.
- `likes`: Stores likes given by users to photos.
- `tags`: Stores hashtag metadata.
- `photo_tags`: Maps photos to associated hashtags.

- ## Use Cases

-Trending Analysis: Detect most popular hashtags used by the community.

-Targeted Marketing: Use top hashtags to target users with ads and campaigns.

---

## 🔍 SQL Queries & Insights

### 1. 🧓 Oldest Users on Instagram
**Objective:** Identify the five oldest users based on their account creation date.

```sql
SELECT username, created_at 
FROM users 
ORDER BY created_at 
LIMIT 5;
```
Output:


![image](https://github.com/user-attachments/assets/67ea0ef7-14ce-44a5-9a81-bc906785009c)


---

### 2. 📭 Users Who Have Never Posted a Photo
**Objective:** List all users who have not uploaded a single photo.

```sql
SELECT u.username 
FROM users u 
LEFT JOIN photos
ON photos.user_id = users.id 
WHERE photos.id IS NULL 
ORDER BY u.username;
```



Output:

![image](https://github.com/user-attachments/assets/635dab3d-caa3-40db-812a-ead4b11f5eb0)

---

### 3. 🏆 Contest Winner (Most Liked Photo)
**Objective:** Determine the photo with the highest number of likes and retrieve its owner's username.

```sql
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
```

---

### 4. 🔥 Top 5 Most Popular Hashtags
**Objective:** Identify the five most frequently used hashtags.

```sql
SELECT t.name_of_tag as tag_name, COUNT(*) AS total 
FROM photo_tags p 
INNER JOIN tags t ON t.id = p.tag_id 
GROUP BY t.name_of_tag 
ORDER BY total DESC 
LIMIT 5;
```

![image](https://github.com/user-attachments/assets/cbb8d62d-feb7-4c69-b64b-d5d91aac418c)


---

### 5. 📅 Most Popular Registration Day
**Objective:** Find the day of the week when most users register on Instagram. Useful for planning ad campaigns.

```sql
SELECT DATE_FORMAT(created_at, '%W') AS dayy, COUNT(*) AS num_of_users 
FROM users 
GROUP BY dayy 
ORDER BY num_of_users DESC;
```
![image](https://github.com/user-attachments/assets/7fbcf024-18f2-4760-a194-8755770abe02)


---

### 6. 📈 Average Number of Posts per User
**Objective:** Calculate:
- Total number of photos
- Total number of users
- Average posts per user

```sql
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

```

![image](https://github.com/user-attachments/assets/fc58f659-096a-46eb-9da6-ae749455d58d)


---

## ✅ Summary

This analysis helps in:
- Understanding user activity
- Measuring photo and hashtag engagement
- Identifying behavioral patterns for marketing
- Making data-driven decisions for growth

---

##  Requirements

- MySQL WorkBench
- A populated `ig_clone` database

---

## Author Contact

For queries or suggestions, reach out to **SAGNIK GHOSAL**  
📫 sagnikghosal5@gmail.com


## Open for contributions , Thank you. 
---
