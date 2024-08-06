#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#Clear tables
echo $($PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY")


#Read file and pipe input
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

#Go through winner column then opponent column to find team names
do
  if [[ $WINNER != "winner" ]]
  then
    # Get team ID to check for existing entry
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # If team is not found, create new entry
    if [[ -z $TEAM_ID ]]
    then
      #Insert entry
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
      echo Inserted into teams table: $WINNER
      fi
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    # Get team ID to check for existing entry
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # If team is not found, create new entry
    if [[ -z $TEAM_ID ]]
    then
      #Insert entry
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
      echo Inserted into teams table: $OPPONENT
      fi
    fi
  fi

done

# Go through games.csv to input the corresponding data to games table

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
# Take year, round, winner goals, opponent goals and insert into corresponding columns
  if [[ $YEAR != "year" ]]
  then
    # Get winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    GAME_ENTRY=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS")

    if [[ -z $GAME_ENTRY ]]
    then
      # If game_id does not exist, insert new entry
      INSERT_GAME_IDS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      echo Inserted following into Games table: $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS. Total Count: $($PSQL "SELECT COUNT(game_id) FROM games")
    fi
  fi
done
