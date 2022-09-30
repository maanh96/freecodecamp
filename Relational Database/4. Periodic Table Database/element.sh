#!/bin/bash
# accepts an argument in the form of an atomic number, symbol, or name of an element and outputs some information about the given element

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if input is not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    # find by symbol or name
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
    # if not found
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=-1
    fi
  else
    ATOMIC_NUMBER=$1
  fi
  
  # find all properties
  PROPERTIES=$($PSQL "SELECT p.atomic_number, e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type
                    FROM properties AS p
                    INNER JOIN elements AS e ON e.atomic_number = p.atomic_number
                    INNER JOIN types AS t ON t.type_id = p.type_id
                    WHERE p.atomic_number=$ATOMIC_NUMBER
                     ")
  
  # if not found
  if [[ -z $PROPERTIES ]]
  then
    echo "I could not find that element in the database."
  else
    echo $PROPERTIES | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi
