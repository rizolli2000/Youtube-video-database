select* from Videodetails2
select* from Videodetails
---to check which video has received the highest comment rate
select*from Videodetails
where comment_count>63
----viewing the details of one particular youtuber
select*from Videodetails
where channel_title='Logan Paul Vlogs'

---to check and analyse which youtube has the most views
SELECT 
  videodetails.*, 
  DENSE_RANK() OVER (ORDER BY [views] DESC) AS [Highest view count]
FROM 
  videodetails

  ---viewing the like count of each channel
  SELECT 
  videodetails.*, 
  RANK() OVER (ORDER BY [likes] DESC) AS [Highest like count]
FROM 
  videodetails
---creating a link join  query for another table in the same database
  SELECT 
  videodetails.*, 
  videodetails2.*
FROM 
  videodetails
JOIN 
  videodetails2 
ON 
  videodetails.channel_title = videodetails2.channel_title
---checking the relation between two tables and checking the dislike ratio of each channel
SELECT 
  videodetails.*, 
  videodetails2.*,
  DENSE_RANK() OVER (ORDER BY videodetails.dislikes DESC) AS [Dislike index]
FROM 
  videodetails
JOIN 
  videodetails2 
ON 
  videodetails.dislikes = videodetails2.dislikes

---now created a view of an existing tabble
CREATE VIEW videodetailsview AS
SELECT channel_title, category_id, publish_time, likes, dislikes
FROM videodetails;


SELECT * FROM videodetailsview

---this gives an overall views collected in the entire database 
SELECT SUM(views) FROM videodetails ;

---this gives us the total likes of the entire database
SELECT COUNT(*) FROM videodetails;
SELECT COUNT(likes) FROM videodetails;
----gives the amount of views and dislikes to overall youtube channels present in the database
SELECT MIN(views) FROM videodetails;
SELECT MAX(dislikes) FROM videodetails;
----draws the relation ship between the views between different tables in the same database note we are only working in the same data base
SELECT *
FROM videodetails 
JOIN videodetails2 ON videodetails.views = videodetails2.views;


----used the union opertator to draw conclusion of what are the relationship between the views,title and likes
SELECT title, views, likes
FROM videodetails
UNION
SELECT title, views, likes
FROM videodetails2;


SELECT channel_title, views, likes
FROM videodetails
UNION ALL
SELECT channel_title, views, likes
FROM videodetails2;


SELECT title, views, likes
FROM videodetails
EXCEPT
SELECT title, views, likes
FROM videodetails2;










