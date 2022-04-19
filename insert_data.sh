#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
do
TEAMS=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
if [[ $WINNER != "winner" ]]
then
if [[ -z $TEAMS ]] 
then
INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
if [[ INSERT_TEAM == "INSERT 0 1" ]]
then
echo Inserted into teams, $WINNER
fi
fi
fi

TEAMSO=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
if [[ $OPPONENT != "opponent" ]]
then
if [[ -z $TEAMSO ]] 
then
INSERT_TEAMSO=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
if [[ INSERT_TEAMSO == "INSERT 0 1" ]]
then
echo Inserted into teams, $OPPONENT
fi
fi
fi

TEAM_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
TEAM_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

if [[ -n $TEAM_W || -n $TEAM_O ]]
then
  if [[ $YEAR != "year" ]]
  then
    INSERT_G=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_W, $TEAM_O, $WINNER_G, $OPPONENT_G)")
    if [[ $INSERT_G == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR
      fi
  fi
fi

done
