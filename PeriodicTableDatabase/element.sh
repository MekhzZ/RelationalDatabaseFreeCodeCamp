#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Determine search condition 
SEARCH_TERM=$1
SEARCH_CONDITION=""

# Atomic Number search (Integer)
if [[ $SEARCH_TERM =~ ^[0-9]+$ ]]
then
  SEARCH_CONDITION="e.atomic_number = $SEARCH_TERM"

# Symbol search (1 or 2 letters)
elif [[ $SEARCH_TERM =~ ^[A-Za-z]{1,2}$ ]]
then
  SEARCH_CONDITION="e.symbol = '$SEARCH_TERM'"

# Name search (Default)
else
  # Capitalize first letter of the name 
  CAPITALIZED_NAME=$(echo "$SEARCH_TERM" | sed -r 's/^(.)/\U\1/')
  SEARCH_CONDITION="e.name = '$CAPITALIZED_NAME'"
fi

# feat: Execute the query
ELEMENT_INFO=$($PSQL "
  SELECT
    e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
  FROM
    elements AS e
  INNER JOIN properties AS p ON e.atomic_number = p.atomic_number
  INNER JOIN types AS t ON p.type_id = t.type_id
  WHERE
    $SEARCH_CONDITION
")

# Process results
if [[ -z $ELEMENT_INFO ]]
then
  echo "I could not find that element in the database."
else
  # Read the result, trim whitespace, and format output
  echo "$ELEMENT_INFO" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
  do
    # Trim whitespace from each variable using xargs for clean output
    ATOMIC_NUMBER=$(echo "$ATOMIC_NUMBER" | xargs)
    NAME=$(echo "$NAME" | xargs)
    SYMBOL=$(echo "$SYMBOL" | xargs)
    TYPE=$(echo "$TYPE" | xargs)
    ATOMIC_MASS=$(echo "$ATOMIC_MASS" | xargs)
    MELTING_POINT=$(echo "$MELTING_POINT" | xargs)
    BOILING_POINT=$(echo "$BOILING_POINT" | xargs)

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi