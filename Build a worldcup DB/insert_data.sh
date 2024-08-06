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