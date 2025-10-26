#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
NUMBER_OF_GUESSES=0

echo "Enter your username:"
read USERNAME 

USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  # New User
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Existing User 
  IFS='|' read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESS_PROMPT="Guess the secret number between 1 and 1000:"
echo $GUESS_PROMPT

GUESSING_GAME() {
  read GUESS
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  # check if input is an integer 
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESSING_GAME
    return
  fi

  # Check the guess
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    # Guessed correctly
    GAME_OVER
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    GUESSING_GAME
  else
    echo "It's higher than that, guess again:"
    GUESSING_GAME
  fi
}

GAME_OVER() {
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  # Update database with game result 
  if [[ -z $USER_INFO ]]
  then
    # New user: insert new record
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES)")
  else
    # Existing user: update games_played and potentially best_game
    NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
    
    # Check if this is a new best game
    if [[ $BEST_GAME -eq 0 || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
    else
      UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME'")
    fi
  fi
}

GUESSING_GAME