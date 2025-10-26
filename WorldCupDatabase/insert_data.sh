#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Note: Since 'games' relies on 'teams', you must clear 'games' first.
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

INSERT_TEAM() {
  local TEAM_NAME=$1
  
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")

  if [[ -z $TEAM_ID ]]
  then
    INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')")


    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  fi

  echo $TEAM_ID
}

# Read games.csv, piping the content into the while loop
# Column variables: YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
cat games.csv | while IFS="," read YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
do
  # Skip the header line
  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$(INSERT_TEAM "$WINNER_NAME")
    OPPONENT_ID=$(INSERT_TEAM "$OPPONENT_NAME")
    
    INSERT_GAME_RESULT=$($PSQL "
      INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
      VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)
    ")


  fi
done
