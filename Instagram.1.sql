/*Finding the 5 oldest instagram users*/
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;


/*We need to figure out when to schedule an ad campgain.
Which day do most users register on? */
SELECT 
    DAYNAME(created_at) AS day, COUNT(*) AS Total_Registration
FROM
    users
GROUP BY day
ORDER BY Total_Registration DESC;

/* finding inactive users so we can perform actions like sending email
So we find the user who have never posted images*/
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photos.id IS NULL;



