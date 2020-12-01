-- Queries

-- Find all the producers id who have already collaborate with artist called Matt Waller
-- Ordered by producer id

SELECT collaborate.producer_id
FROM collaborate
INNER JOIN artist
    ON collaborate.artist_id = artist.id
    AND artist.first_name = 'Matt' AND artist.last_name = 'Waller'
ORDER BY collaborate.producer_id;

-- Find complete names of artists that makes over 40'000 sales with a signle collaboration
-- Ordered initially by first name and then by last name

SELECT artist.first_name, artist.last_name
FROM artist
INNER JOIN collaborate
    ON artist.id = collaborate.artist_id
    AND collaborate.total_sales > 40000
ORDER BY artist.first_name, artist.last_name;

-- Find the different album names of artists born in 1962 and 1989 and their release dates
-- Ordered by release date

SELECT album.name, album.date
FROM album
INNER JOIN artist
    ON album.artist_id = artist.id
    AND (artist.birth_date LIKE '%1962%' OR artist.birth_date LIKE '%1989%')
ORDER BY album.date;

-- Find all the track names and corresponding category id which are product by Stanislaw
-- Ordered by track name

SELECT track.name, track.category_id
FROM track
INNER JOIN collaborate
    ON track.artist_id = collaborate.artist_id
INNER JOIN producer
    ON collaborate.producer_id = producer.id
    AND producer.surname = 'Stanislaw'
ORDER BY track.name;





-- Views

-- Only view the track names that are longer than 3 minutes
-- Ordered by duration

CREATE VIEW tracks_shorter_3_minutes AS
SELECT track.name AS 'tracks < 3 min', track.duration
FROM track
WHERE track.duration < 3.00
ORDER BY track.duration;

-- Only view the track names from Rap and Pop categories
-- Ordered by names

CREATE VIEW rap_and_pop_tracks AS
SELECT track.name AS 'rap and pop tracks'
FROM track
INNER JOIN category
    ON track.category_id = category.id
    AND (category.name = 'Rap' OR category.name = 'Pop')
ORDER BY track.name;

-- Only view tracks whose artists are women
-- Ordered by names

CREATE VIEW female_tracks AS
SELECT track.name AS 'female tracks'
FROM track
INNER JOIN artist
    ON track.artist_id = artist.id
    AND (artist.sex = 'F')
ORDER BY track.name;

-- Only view the track names that has been released between 1980 and 1990
-- Ordered by names

CREATE VIEW tracks_from_1980_to_1990 AS
SELECT track.name AS 'track names', track.date AS 'release dates'
FROM track
WHERE track.date > '1980-01-01' AND track.date < '1990-12-31'
ORDER BY track.date;





-- Views Viewer --

-- 1st view

SELECT *
FROM tracks_shorter_3_minutes;

-- 2nd view

SELECT *
FROM rap_and_pop_tracks;

-- 3rd view

SELECT *
FROM female_tracks;

-- 4th view

SELECT *
FROM tracks_from_1980_to_1990;
