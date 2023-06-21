#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

ELEMENT=$1
if [[ -z $ELEMENT ]]; then
    echo "Please provide an element as an argument."
fi

if [[ $ELEMENT ]]; then

    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$ELEMENT'")
    if [[ -z $ELEMENT_ID ]]; then
        ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$ELEMENT'")
        if [[ -z $ELEMENT_ID ]]; then
            ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $ELEMENT")
        fi
    fi

    if [[ $ELEMENT_ID ]]; then
        ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID;")
        echo "$ELEMENT_INFO" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT; do
            echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    else
        echo "I could not find that element in the database."
    fi
fi
