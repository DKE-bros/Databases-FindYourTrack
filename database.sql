-- Drop Tables --

DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS collaborate;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS producer;

DROP VIEW IF EXISTS tracks_shorter_3_minutes;
DROP VIEW IF EXISTS rap_and_pop_tracks;
DROP VIEW IF EXISTS female_tracks;
DROP VIEW IF EXISTS tracks_from_1980_to_1990;





-- Table creations --

CREATE TABLE artist (
    id INT NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    birth_date DATE NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE category (
    id INT NOT NULL,
    name VARCHAR(20) NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE album (
    id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    artist_id INT NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE
);

CREATE TABLE track (
    id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    date DATE NOT NULL,
    duration DECIMAL(3,2) NOT NULL,
    category_id INT NOT NULL,
    album_id INT,
    artist_id INT NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(category_id) REFERENCES category(id) ON DELETE CASCADE,
    FOREIGN KEY(album_id) REFERENCES album(id) ON DELETE CASCADE,
    FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE
);

CREATE TABLE producer (
    id INT NOT NULL,
    surname VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    years_exp INT NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE collaborate (
    artist_id INT NOT NULL,
    producer_id INT NOT NULL,
    total_sales INT NOT NULL,

    PRIMARY KEY(artist_id, producer_id),

    FOREIGN KEY(artist_id) REFERENCES artist(id) ON DELETE CASCADE,
    FOREIGN KEY(producer_id) REFERENCES producer(id) ON DELETE CASCADE
);





-- Insert values --

-- artist

INSERT INTO artist
VALUES
    (100, 'Omar', 'Collins', 'M', '1972-08-23'),
    (101, 'Saul', 'Adams', 'M', '1943-07-25'),
    (102, 'Shane', 'Curry', 'F', '1986-05-18'),
    (103, 'Dennis', 'Davie', 'M', '1936-02-04'),
    (104, 'Maaria', 'Parker', 'F', '1962-09-28'),
    (105, 'Dale', 'Johnston', 'F', '1954-11-16'),
    (106, 'Roland', 'Cristal', 'M', '1978-06-07'),
    (107, 'Jennie', 'Duarte', 'F', '1989-07-15'),
    (108, 'Matt', 'Waller', 'M', '1968-01-12'),
    (109, 'Myra', 'Mills', 'F', '1956-12-22');

-- album

INSERT INTO album
VALUES
    (200, 'Flowers In Your Hair', '1985-03-23', 104),
    (201, 'Submarines', '1990-01-14', 108),
    (202, 'Classy Girls', '2011-06-18', 102),
    (203, 'Dead Sea', '2019-09-05', 109),
    (204, 'Big Parade', '1963-10-30', 101),
    (205, 'Charlie Boy', '1958-05-24', 103),
    (206, 'Stubborn Love', '1974-08-17', 105),
    (207, 'Morning Album', '2009-12-13', 107),
    (208, 'Speed UP', '1994-08-29', 100),
    (209, 'Able', '1978-11-15', 106);

-- category

INSERT INTO category
VALUES
    (1, 'Blues'),
    (2, 'Dancehall'),
    (3, 'Country'),
    (4, 'Pop'),
    (5, 'Rap'),
    (6, 'Electro'),
    (7, 'Folk'),
    (8, 'Jazz'),
    (9, 'Rock'),
    (10,'R&B');

-- track

INSERT INTO track
VALUES
    (300, 'Generation', '1958-04-12', 3.11, 4, 205, 103),
    (301, 'Take My Hand', '1994-08-05', 2.42, 7, 208, 100),
    (302, 'The End', '1989-11-24', 4.23, 9, 201, 108),
    (303, 'Boogie Man', '1978-09-06', 3.04, 6, 209, 106),
    (304, 'Save You', '2011-06-01', 4.56, 2, NULL, 102),
    (305, 'Holding On', '1974-06-19', 2.37, 1, 206, 105),
    (306, 'What If', '1958-02-24', 2.21, 4, 205, 103),
    (307, 'Human', '2009-11-12', 3.08, 8, 207, 107),
    (308, 'Ego', '1994-06-04', 3.51, 7, 208, 100),
    (309, 'Grace ', '1990-01-03', 4.31, 9, 201, 108),
    (310, 'Panthera', '1978-10-21', 5.52, 6, 209, 106),
    (311, 'Fade To Nothing', '2011-02-26', 4.18, 2, 202, 102),
    (312, 'Healed', '2009-09-09', 2.24, 8, 207, 107),
    (313, 'As You Are', '1963-04-30', 3.39, 5, 204, 101),
    (314, 'Be The Man', '1974-05-07', 2.56, 1, 206, 105),
    (315, 'Blue Gipsy', '1985-01-18', 3.07, 3, NULL, 104),
    (316, 'Mexico', '2019-05-21', 4.32, 10, 203, 109),
    (317, 'Dream Factory', '1963-03-29', 3.41, 5, 204, 101),
    (318, 'Smokeloud', '1985-01-14', 2.25, 3, 200, 104),
    (319, 'By The Fire', '2019-07-25', 4.48, 10, 203, 109);

-- Producer

INSERT INTO producer
VALUES
    (400, 'Naseem', 'M', 5),
    (401, 'Kellie', 'F', 12),
    (402, 'Tayler', 'M', 2),
    (403, 'Kerry', 'M', 7),
    (404, 'Myla', 'F', 15),
    (405, 'Jennie', 'F', 18),
    (406, 'Jasmina', 'F', 6),
    (407, 'Carmelo', 'M', 3),
    (408, 'Stanislaw', 'M', 21),
    (409, 'T-Jay', 'M', 9);

-- collaborate

INSERT INTO collaborate
VALUES
    (103, 407, 10000),
    (105, 408, 85000),
    (101, 404, 62500),
    (100, 402, 9000),
    (109, 401, 56000),
    (108, 405, 74000),
    (105, 403, 18500),
    (102, 406, 15800),
    (106, 409, 28700),
    (109, 408, 79200),
    (100, 404, 60000),
    (103, 400, 13400),
    (104, 401, 37000),
    (107, 406, 13500),
    (108, 409, 22500);





-- Table viewers --

-- artist

SELECT *
FROM artist;

-- category

SELECT *
FROM category;

-- album

SELECT *
FROM album;

-- track

SELECT *
FROM track;

-- producer

SELECT *
FROM producer;

-- collaborate

SELECT *
FROM collaborate;
