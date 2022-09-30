#!/bin/bash
# number guessing game that runs in the terminal and saves user information 

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

# check if username has been used before
GAMES_PLAYED=$($PSQL "SELECT games_played FROM guess WHERE username='$USERNAME'")
# if not found
if [[ -z $GAMES_PLAYED ]]
then
  INSERT_USER=$($PSQL "INSERT INTO guess(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
# if username has been used before
else
  BEST_GAME=$($PSQL "SELECT best_game FROM guess WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#start game
WIN_NUMBER=$(( RANDOM % 1000 +1 ))
#for checking
#echo $WIN_NUMBER
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
NUMBER_GUESS=1

# guess loop
while [[ $USER_GUESS != $WIN_NUMBER ]]
do
  #check if number
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    # if lower
    if [[ $USER_GUESS > $WIN_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
  # take input again
  read USER_GUESS
  ((NUMBER_GUESS++))
done

# when correct
echo "You guessed it in $NUMBER_GUESS tries. The secret number was $WIN_NUMBER. Nice job!"

# insert game data
# if new
if [[ -z $BEST_GAME || $BEST_GAME > $NUMBER_GUESS ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE guess SET best_game=$NUMBER_GUESS WHERE username='$USERNAME'")
fi
# update games played
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE guess SET games_played=games_played+1 WHERE username='$USERNAME'")
