#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN(){
  echo Enter your username:
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  if [[ -z $USER_ID ]]
  then
    INSERT_NEW_USERNAME_RESULT=$($PSQL "INSERT INTO users (username, games_played) VALUES ('$USERNAME',0)");
    echo Welcome, $USERNAME! It looks like this is your first time here.
    # get new user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    GAME
  

  else 

    USER_NAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GAME

  fi

}

GAME(){
  
  MIN=1
  MAX=1000
  SECRET_NUMBER=$((RANDOM % ( MAX - MIN + 1 ) + MIN ))
    echo Guess the secret number between 1 and 1000:
  
  COUNTER=0
  while true
  do
    read SELECTED_NUMBER
    if [[ ! "$SELECTED_NUMBER" =~ ^[0-9]+$ ]]
    then

      echo That is not an integer, guess again:

    else
      COUNTER=$((COUNTER + 1 ))
      if [[ $SELECTED_NUMBER -gt $SECRET_NUMBER ]]
      then
        
        echo -e "It's lower than that, guess again:"

      elif [[ $SELECTED_NUMBER -lt $SECRET_NUMBER ]]
      then

        echo -e "It's higher than that, guess again:"

      else

        echo You guessed it in $COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!       
        UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")
        UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $COUNTER WHERE user_id = $USER_ID AND ( best_game > $COUNTER OR best_game IS NULL ) ")
        
        break 

      fi
    fi
  done 
  }

  

MAIN