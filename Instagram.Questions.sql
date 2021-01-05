/*Finding the 5 oldest instagram users*/
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;


/*Which day do most users register on? */
SELECT 
    DAYNAME(created_at) AS day, COUNT(*) AS Total_Registration
FROM
    users
GROUP BY day
ORDER BY Total_Registration DESC;

/* find the user who have never posted images*/
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photos.id IS NULL;


/*total number of photos/total number of users*/

SELECT 
    ROUND((SELECT COUNT(id)
                FROM
                    photos) / (SELECT COUNT(id) FROM users), 2);
            
            
            
   /*Most likes on a single photo.*/
            SELECT 
    users.username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total
FROM
    likes
        JOIN
    photos ON photos.id = likes.photo_id
        JOIN
    users ON users.id = likes.user_id
GROUP BY id
ORDER BY total DESC
LIMIT 1;


/*User ranking by postings higher to lower*/
SELECT 
    users.username, COUNT(photos.image_url) AS total
FROM
    users
        JOIN
    photos ON photos.user_id = users.id
GROUP BY users.id
ORDER BY total DESC;


/* Top 5 most commonly used hashtags?*/
SELECT 
    tags.tag_name, COUNT(photo_tags.tag_id) AS Counts
FROM
    tags
        JOIN
    photo_tags ON photo_tags.photo_id = tags.id
GROUP BY tags.id
ORDER BY counts DESC;


