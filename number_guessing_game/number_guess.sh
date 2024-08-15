#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username: "
read USERNAME
SEARCH_USERNAME=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
#if username does not exist in DB
if [[ -z $SEARCH_USERNAME ]]
then
  #print Welcome, <username>! It looks like this is your first time here.
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  #add user to DB
  ADD_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  #give confirmation to user that registration was successful
  if [[ $ADD_NEW_USER == "INSERT 0 1" ]]
  then
    echo -e "\nYou have been registered."
  else
    echo -e "\nRegistration has failed."
  fi
else
  #else print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
  echo -e "\nWelcome back, $USERNAME!" #to add rest of welcome statement
fi

#generate random number and store in variable

#play game to guess number
