--Create Videos Table: unique ID, title, length in min, URL
CREATE TABLE ch_video(
video_id serial PRIMARY KEY,
title VARCHAR (355),
length_in_minutes INT,
url VARCHAR (355) UNIQUE);

--Create Reviewers Table: name, rating = Null, 0 - 5, review
CREATE TABLE ch_reviewers(
review_id serial PRIMARY KEY,
video_id INT,
user_name VARCHAR (55), 
rating smallint CHECK (rating BETWEEN 0 and 5),
review_description VARCHAR (255),
CONSTRAINT fk_video
FOREIGN KEY(video_id)
REFERENCES ch_video(video_id)
);

--Insert value: 3 videos
INSERT INTO ch_video (title, length_in_minutes, url)
VALUES
('Introduction to SQL Programming for Excel Users Part 1 - Overview',6,'https://youtu.be/gh1-9VSjawY'),
('SQL Tutorial - Full Database Course for Beginners',240,'https://www.youtube.com/watch?v=HXV3zeQKqGY'),
('What is SQL?',4,'https://www.youtube.com/watch?v=27axs9dO7AE');

/*Check 
SELECT *
FROM ch_video; */

--Insert reviews: 2 per video
INSERT INTO ch_reviewers (video_id, user_name, rating, review_description)
VALUES
(1, 'Chelsea',5,'great resource'),
(1, 'Matt',2,'not enough detail'),
(2, 'Keira',4,'helpful'),
(2, 'Jason',5,'excellent video'),
(3,'Lily',1,'not enough details');

--Insert review with no rating
INSERT INTO ch_reviewers (video_id, user_name, review_description)
VALUES (3,'Harvey','nice overview');

/*Check
SELECT *
FROM ch_reviewers;*/

--JOIN tables
SELECT v.video_id, v.title, v.length_in_minutes, v.url, r.review_id, r.user_name, r.rating, r.review_description
FROM ch_video AS v
INNER JOIN ch_reviewers AS r
ON v.video_id=r.video_id
ORDER BY v.video_id, rating DESC;