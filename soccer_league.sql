DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    coach VARCHAR
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    teamid INT REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);

CREATE TABLE season_dates
(
    season INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    season INT REFERENCES season_dates(season),
    date DATE,
    team1 INT REFERENCES teams,
    team2 INT REFERENCES teams,
    ref1 INT REFERENCES referees,
    ref2 INT REFERENCES referees
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    playerid INT REFERENCES players,
    matchid INT REFERENCES matches,
    teamid INT REFERENCES teams
);

CREATE TABLE outcomes
(
    id SERIAL PRIMARY KEY,
    teamid INT REFERENCES teams,
    matchid INT REFERENCES matches,
    refid INT REFERENCES referees,
    outcome TEXT
);
