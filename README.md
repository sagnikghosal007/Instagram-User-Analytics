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

---

### 2. 📭 Users Who Have Never Posted a Photo
**Objective:** List all users who have not uploaded a single photo.

```sql
SELECT u.username 
FROM users u 
LEFT JOIN photos p ON p.user_id = u.id 
WHERE p.image_url IS NULL 
ORDER BY u.username;
```

---

### 3. 🏆 Contest Winner (Most Liked Photo)
**Objective:** Determine the photo with the highest number of likes and retrieve its owner's username.

```sql
SELECT p.id AS photo_id, u.username, COUNT(l.user_id) AS number_of_likes 
FROM likes l
INNER JOIN photos p ON l.photo_id = p.id
INNER JOIN users u ON p.user_id = u.id
GROUP BY p.id, u.username 
ORDER BY number_of_likes DESC 
LIMIT 1;
```

---

### 4. 🔥 Top 5 Most Popular Hashtags
**Objective:** Identify the five most frequently used hashtags.

```sql
SELECT t.name_of_tag, COUNT(p.photo_id) AS usage_count 
FROM photo_tags p 
INNER JOIN tags t ON t.id = p.tag_id 
GROUP BY t.name_of_tag 
ORDER BY usage_count DESC 
LIMIT 5;
```

---

### 5. 📅 Most Popular Registration Day
**Objective:** Find the day of the week when most users register on Instagram. Useful for planning ad campaigns.

```sql
SELECT DATE_FORMAT(created_at, '%W') AS registration_day, COUNT(*) AS num_of_users 
FROM users 
GROUP BY registration_day 
ORDER BY num_of_users DESC;
```

---

### 6. 📈 Average Number of Posts per User
**Objective:** Calculate:
- Total number of photos
- Total number of users
- Average posts per user

```sql
WITH base AS (
  SELECT u.id AS user_id, COUNT(p.id) AS photo_count 
  FROM users u 
  LEFT JOIN photos p ON p.user_id = u.id 
  GROUP BY u.id
)
SELECT 
  SUM(photo_count) AS total_photos, 
  COUNT(user_id) AS total_users, 
  ROUND(SUM(photo_count) / COUNT(user_id), 2) AS average_photos_per_user 
FROM base;
```

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
