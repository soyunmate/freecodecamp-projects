#!/bin/bash

echo 'Enter your username:'; read USERNAME;

if [[ -z $USERNAME ]]
then
exit 0
fi;

if [[ $1 ]]
then
exit 0
else
MAIN_APP () {

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c";
# Generate random number
NUMBER=$((RANDOM % 1000 + 1));
SCORE=1;



GUESS_GAME () {

if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
echo -e "\nThat is not an integer, guess again:"; read GUESS
SCORE=$((SCORE + 1))
TRY_AGAIN
elif [[ $GUESS -gt $NUMBER ]]; then 
echo -e "\nIt's lower than that, guess again:"; read GUESS
SCORE=$((SCORE + 1))
TRY_AGAIN
elif [[ $GUESS -lt $NUMBER ]]; then 
echo -e "\nIt's higher than that, guess again:"; read GUESS
SCORE=$((SCORE + 1))
TRY_AGAIN
else
EXIT_FUNCTION
fi;
}

TRY_AGAIN () {
GUESS_GAME;
}

EXIT_FUNCTION () {
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'");
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'");

if [[ -z $BEST_GAME ]] 
then
UPDATE_RESULT=$($PSQL "UPDATE users SET best_game = $SCORE WHERE username = '$USERNAME'");
fi;

#update best score
if [[ $FIX_BEST_GAME -gt $SCORE ]]
then
UPDATE_RESULT=$($PSQL "UPDATE users SET best_game = $SCORE WHERE username = '$USERNAME'");
fi;

#update games played
NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1));
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username = '$USERNAME'");

echo "You guessed it in $SCORE tries. The secret number was $NUMBER. Nice job!";
}
CHECK_USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'");
if  [[ $CHECK_USERNAME_RESULT ]]
then
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'");
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'");
#generate welcome string
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.";
echo "Guess the secret number between 1 and 1000:"; read GUESS;
GUESS_GAME;
else
#insert new user
INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')");
echo "Welcome, $USERNAME! It looks like this is your first time here.";
echo "Guess the secret number between 1 and 1000:"; read GUESS;
GUESS_GAME;
fi;
};

MAIN_APP;
fi;
