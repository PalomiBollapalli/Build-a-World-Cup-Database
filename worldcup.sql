DROP DATABASE IF EXISTS worldcup;
DROP DATABASE IF EXISTS worldcuptest;
CREATE DATABASE worldcup OWNER freecodecamp;
CREATE DATABASE worldcuptest OWNER freecodecamp;

\c worldcup

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(50) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    FOREIGN KEY (winner_id) REFERENCES teams(team_id),
    FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
);

ALTER TABLE teams OWNER TO freecodecamp;
ALTER TABLE games OWNER TO freecodecamp;

\c worldcuptest

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(50) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    FOREIGN KEY (winner_id) REFERENCES teams(team_id),
    FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
);

ALTER TABLE teams OWNER TO freecodecamp;
ALTER TABLE games OWNER TO freecodecamp;
