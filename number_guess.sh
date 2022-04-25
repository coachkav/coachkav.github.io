#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERNAME_I=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
GAMES=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")
BEST_G=$($PSQL "SELECT MIN(number_guess) FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")

if [[ -z $USERNAME ]]
then
INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
echo "Welcome, $USERNAME! It looks like this is your first time here."
else
echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST_G guesses."
fi

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
GUESS=1
echo "Guess the secret number between 1 and 1000:"
while read NUM
  do
    if [[ ! $NUM =~ ^[0-9]+$ ]]
    then
    echo "That is not an integer, guess again:"
    else
    if [[ $NUM -eq $RANDOM_NUMBER ]]
      then
      break;
      else
        if [[ $NUM -gt $RANDOM_NUMBER ]]
        then
        echo -n "It's lower than that, guess again:"
        elif [[ $NUM -lt $RANDOM_NUMBER ]]
        then
        echo -n "It's higher than that, guess again:"
      fi
    fi
  fi
GUESS=$(( $GUESS + 1 ))
done

echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
USER=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_G=$($PSQL "INSERT INTO games(number_guess, user_id) VALUES($GUESS, $USER)")
