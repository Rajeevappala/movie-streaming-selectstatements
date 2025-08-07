
USE MovieStreamingDB;


select * from Users;
select * from Subscriptions;
select * from Movies;
Select * from Reviews;
Select * from Genres;
select * from MovieGenres;
select * from WatchHistory;

-- Get All Users and Their Subscription Plans

SELECT U.Name, U.Email, S.PlanName, S.StartDate, S.EndDate
FROM Users U
INNER JOIN Subscriptions S ON U.UserID = S.UserID;


-- List All Movies with Their Genres
SELECT M.Title, G.GenreName
FROM Movies M
INNER JOIN MovieGenres MG ON M.MovieID = MG.MovieID
INNER JOIN Genres G ON MG.GenreID = G.GenreID;

--- All Movie Reviews with Ratings and Comments

SELECT U.Name, M.Title, R.Rating, R.Comment, R.ReviewDate
FROM Reviews R
JOIN Users U ON R.UserID = U.UserID
JOIN Movies M ON R.MovieID = M.MovieID
ORDER BY R.ReviewDate DESC;


--- MOVIES WITH RATING 5
SELECT
M.MovieID, M.Title AS MovieName, M.Description, R.Comment, R.Rating
FROM Movies AS M INNER JOIN Reviews AS R
ON
M.MovieID = R.MovieID
WHERE R.Rating = 5;

-- Watch History of All Users

SELECT U.Name, M.Title, WH.WatchDate
FROM WatchHistory WH
JOIN Users U ON WH.UserID = U.UserID
JOIN Movies M ON WH.MovieID = M.MovieID
ORDER BY WH.WatchDate DESC;

--- List All Movies Released After 2020

SELECT Title, ReleaseYear, Language
FROM Movies
WHERE ReleaseYear > 2000;

--- Movies with Duration Between 90 and 150 Minutes

SELECT Title, Duration
FROM Movies
WHERE Duration BETWEEN 90 AND 150;


--- Subscriptions with PlanName LIKE 'Premium%' AND Price > 500
SELECT UserID, PlanName, Price
FROM Subscriptions
WHERE PlanName LIKE 'Premium%'
  AND Price > 500;

---  Reviews with Comment Containing 'Fantastic' OR 'Emotional'
SELECT UserID, MovieID, Rating, Comment
FROM Reviews
WHERE Comment LIKE '%Fantastic%'
   OR Comment LIKE '%Emotional%';

