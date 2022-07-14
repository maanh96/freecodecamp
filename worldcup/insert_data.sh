#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WNN OPP WGOAL OGOAL
do
  if [[ $YEAR != 'year' ]]
  then
    # insert team
    # get winner_id
    WNN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WNN'")
    # if not found
    if [[ -z $WNN_ID ]]
    then
      # insert winner
      INSERT_WNN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$WNN')")
      echo $INSERT_WNN_RESULT
      if [[ $INSERT_WNN_RESULT == 'INSERT 0 1' ]]
      then
        echo "Inserted into teams, $WNN"
      fi
      # get new winner_id
      WNN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WNN'")
    fi

    # get opponent_id
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    # if not found
    if [[ -z $OPP_ID ]]
    then
      # insert opponent
      INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPP')")
      echo $INSERT_OPP_RESULT
      if [[ $INSERT_OPP_RESULT == 'INSERT 0 1' ]]
      then
        echo "Inserted into teams, $OPP"
      fi
      # get new opponent_id
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    fi

    # insert games
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WNN_ID, $OPP_ID, $WGOAL, $OGOAL)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into games, $WNN $OPP"
    fi

  fi
done