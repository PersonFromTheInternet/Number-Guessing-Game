#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess_info -t --no-align --tuples-only -c"

#get username
#echo "Enter your username:"
#read -n 22 USERNAME

#get username length
#CHAR_NUM=$(echo $USERNAME | wc -m)
#let CHAR_NUM-=1

#check if username is within allowed length

#function that takes guess and checks 
#if they are valid
#if the number is correct

GUESSER () {

#Ssave the inputed value
GUESS=$1
#echo $NUM_TO_GUESS
#NUM_OF_GUESSES=1

#check if guess is valid
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
  echo "That is not an integer, guess again:"
  read GUESS
  GUESSER $GUESS

  else
#start count of the number of guesses
  #NUM_OF_GUESSES=1

    if [[ $GUESS -gt $NUM_TO_GUESS ]]
    then
    ((NUM_OF_GUESSES+=1))
    echo "It's lower than that, guess again:"
    read GUESS
    GUESSER $GUESS

    elif [[ $GUESS -lt $NUM_TO_GUESS ]]
    then
    ((NUM_OF_GUESSES+=1))
    echo "It's higher than that, guess again:"
    read GUESS
    GUESSER $GUESS

    else
    INSERT_GAME=$($PSQL "INSERT INTO games(username, num_guesses) VALUES('$USERNAME', $NUM_OF_GUESSES)")
    BEST=$($PSQL "SELECT best_score FROM info WHERE username = '$USERNAME'")
    
      if [[ $BEST -gt $NUM_OF_GUESSES || $BEST -eq 0 ]]
      then
      INSERT_INFO=$($PSQL "UPDATE info SET best_score = $NUM_OF_GUESSES WHERE username = '$USERNAME'")
      fi

    echo "You guessed it in $NUM_OF_GUESSES tries. The secret number was $NUM_TO_GUESS. Nice job!"
    exit
    fi
  
fi
}

echo "Enter your username:"
read -n 22 USERNAME

#check if username exists in system
NAME_EXI=$($PSQL "SELECT username FROM info WHERE username = '$USERNAME'")

if [[ -z $NAME_EXI ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSER_USERNAME=$($PSQL "INSERT INTO info(username) VALUES('$USERNAME')")
else
NUM_GAMES=$($PSQL "SELECT COUNT(game_id) FROM games WHERE username = '$USERNAME'")
BEST_SCORE=$($PSQL "SELECT best_score FROM info WHERE username = '$USERNAME'")
echo $BEST_SCORE
echo "Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $BEST_SCORE guesses."
fi

NUM_TO_GUESS=$((1 + $RANDOM % 1000))
#############################
echo $NUM_TO_GUESS
#############################

NUM_OF_GUESSES=1

echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESSER $GUESS






####TABLE INFO

#info
#username VARCHAR(22) PRIMARY KEY
#best_score INT

#games
#game_id SERIAL PRIMARY KEY
#username VARCHAR(22) FOREIGN KEY
#num of guesses

