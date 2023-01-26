DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions 
(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    state VARCHAR,
    country VARCHAR
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    pref_region INT REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    userid INT REFERENCES users,
    location VARCHAR,
    region INT REFERENCES regions
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category VARCHAR NOT NULL
);

CREATE TABLE posts_categories
(
    id SERIAL PRIMARY KEY,
    postid INT REFERENCES posts,
    catid INT REFERENCES categories
);
