-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE albums_producers
(
  id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES albums,
  producer_id INTEGER REFERENCES producers
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER REFERENCES albums
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs,
  artist_id INTEGER REFERENCES artists
);


INSERT INTO producers
  (name)
VALUES
  ('Al Shux'),
  ('Benjamin Rice'),
  ('Benny Blanco'),
  ('Cirkut'),
  ('Darkchild'),
  ('Dust Brothers'),
  ('Max Martin'),
  ('Rick Parashar'),
  ('Roy Thomas Baker'),
  ('Shellback'),
  ('Stephen Lironi'),
  ('The Matrix'),
  ('Walter Afanasieff');

INSERT INTO artists
  (name)
VALUES
  ('Alicia Keys'),
  ('Avril Lavigne'),
  ('Boyz II Men'),
  ('Bradley Cooper'),
  ('Christina Aguilera'),
  ('Destiny''s Child'),
  ('Hanson'),
  ('Jay Z'),
  ('Juicy J'),
  ('Katy Perry'),
  ('Lady Gaga'),
  ('Mariah Cary'),
  ('Maroon 5'),
  ('Nickelback'),
  ('Queen');

INSERT INTO albums
  (name, release_date)
VALUES
  ('A Night at the Opera', '1997-04-15'),
  ('A Star Is Born', '1975-10-31'),
  ('Daydream', '1995-11-14'),
  ('Hands All Over', '2018-09-27'),
  ('Let Go', '2001-08-21'),
  ('Middle of Nowhere', '2009-10-20'),
  ('Prism', '2013-12-17'),
  ('Silver Side Up', '2011-06-21'),
  ('The Blueprint 3', '2002-05-14'),
  ('The Writing''s on the Wall', '1999-11-07');

INSERT INTO albums_producers
  (album_id, producer_id)
VALUES
  (6, 6),
  (6, 12),
  (1, 9),
  (3, 13),
  (2, 2),
  (8, 8),
  (9, 1),
  (7, 7),
  (7, 4),
  (4, 10),
  (4, 3),
  (5, 12),
  (10, 5);

INSERT INTO songs
  (title, duration_in_seconds, album_id)
VALUES
  ('Bohemian Rhapsody', 355, 1),
  ('Complicated', 244, 5),
  ('Dark Horse', 215, 7),
  ('How You Remind Me', 223, 8),
  ('MMMBop', 238, 6),
  ('Moves Like Jagger', 201, 4),
  ('New York State of Mind', 276, 9),
  ('One Sweet Day', 282, 3),
  ('Say My Name', 240, 10),
  ('Shallow', 216, 2);

INSERT INTO songs_artists
  (song_id, artist_id)
VALUES
  (5, 7),
  (1, 15),
  (8, 12),
  (8, 3),
  (10, 11),
  (10, 4),
  (4, 14),
  (7, 8),
  (7, 1),
  (3, 10),
  (3, 9),
  (6, 13),
  (6, 5),
  (2, 2),
  (9, 6);


-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
