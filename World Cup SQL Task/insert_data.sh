#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#Clear any existing Data
echo $($PSQL "TRUNCATE games, teams;")

#Reading the CSV and creating a while loop to iterate over the records.
PARSE_CSV(){
  tail -n +2 games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
  do
    # Insert the winning teams into the teams table (If they dont already exist).
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
      then
        echo "Inserted into the teams table: $WINNER"
      fi
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi

    # Insert the Opponent teams into the teams table (If they dont already exist there)
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
      then
        echo "Inserted Opponent team data: $OPPONENT"
      fi
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    fi

    # Insert game data using the new WINNER_ID and OPPONENT_ID vars.
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS);")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Successfully captured: $YEAR | $ROUND | $WINNER vs $OPPONENT"
    fi
  done
  TEAM_RESULTS=$($PSQL "SELECT COUNT(team_id) FROM teams;")
  echo $TEAM_RESULTS
  GAME_RESULTS=$($PSQL "SELECT COUNT(game_id) FROM games;")
  echo $GAME_RESULTS
}

PARSE_CSV