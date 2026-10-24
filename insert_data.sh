#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;"

while IFS=',' read -r year round winner opponent winner_goals opponent_goals
 do
  if [[ "$year" == "year" ]]; then
    continue
  fi

  winner_id=$($PSQL "INSERT INTO teams (name) VALUES ('$winner') ON CONFLICT (name) DO NOTHING; SELECT team_id FROM teams WHERE name = '$winner';" | tail -n 1 | tr -d '[:space:]')
  opponent_id=$($PSQL "INSERT INTO teams (name) VALUES ('$opponent') ON CONFLICT (name) DO NOTHING; SELECT team_id FROM teams WHERE name = '$opponent';" | tail -n 1 | tr -d '[:space:]')

  $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals);"
done < games.csv
