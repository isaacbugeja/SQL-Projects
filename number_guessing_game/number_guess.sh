#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
random_number=$((1 + RANDOM % 1000))
#Get username
echo -e "\nEnter your username:"
read username
#Search DB for username
check_user_exists=$($PSQL "SELECT user_id FROM users WHERE username='$username';")
#If username does not exist
if [[ -z $check_user_exists ]]
then
  #Create username and rest of prompt
  insert_user_result=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$username', 0, 0);")
  if [[ $insert_user_result == "INSERT 0 1" ]]
  then
    echo -e "\nWelcome, $username! It looks like this is your first time here."
  fi
else #if username does exist
  get_games_played=$($PSQL "SELECT games_played FROM users WHERE user_id=$check_user_exists")
  get_best_game=$($PSQL "SELECT best_game FROM users WHERE user_id=$check_user_exists")
  echo -e "\nWelcome back, $username! You have played $get_games_played games, and your best game took $get_best_game guesses."
fi

#Give welcome back message and rest of prompt
get_user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username';") # Gets user ID after registration/Welcome back message.
echo -e "\nGuess the secret number between 1 and 1000:"
user_guess=0 # Initialize variable and set to 0
number_of_guesses=0 # Initialize counter to 0
while [[ $user_guess -ne $random_number ]]
do
  read user_guess
  #Check if user input is a number
  if [[ $user_guess =~ ^[0-9]+$ ]]
  then
    #Increment guess count by 1
    number_of_guesses=$((number_of_guesses + 1))
    
    #Check if number is lower than random num
    if [[ $user_guess -lt $random_number ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $user_guess -gt $random_number ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
  fi
done

echo -e "\nYou guessed it in $number_of_guesses tries. The secret number was $random_number. Nice job!"
#Insert relevant data into DB
#Get games played and increment by 1 and update DB
get_games_played=$($PSQL "SELECT games_played FROM users WHERE user_id=$get_user_id")
get_games_played=$((get_games_played + 1))
update_games_played=$($PSQL "UPDATE users SET games_played = $get_games_played WHERE user_id=$get_user_id")

#Get best_game info from DB
get_best_game=$($PSQL "SELECT best_game FROM users WHERE user_id=$get_user_id")
if [[ $get_best_game == "0" ]]
then
  update_best_game=$($PSQL "UPDATE users SET best_game = $number_of_guesses WHERE user_id = $get_user_id")
elif [[ $get_best_game -gt $number_of_guesses ]]
then
  update_best_game=$($PSQL "UPDATE users SET best_game = $number_of_guesses WHERE user_id = $get_user_id")
fi
