SELECT title, description, username
FROM activity
LEFT OUTER JOIN "user"
ON owner_id = "user".id
WHERE creation_date > '2019-09-01'
ORDER BY title;