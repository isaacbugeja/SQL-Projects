#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  USER_INPUT=$1
  case $USER_INPUT in
    1 | H | Hydrogen)
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 1")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 1")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 1")
      ELEMENT_TYPE=$($PSQL "SELECT type from types INNER JOIN properties ON types.type_id=properties.type_id WHERE properties.atomic_number = 1;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 1;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 1;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 1;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
      ;;
    2 | He | Helium)
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 2")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 2")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 2")
      ELEMENT_TYPE=$($PSQL "SELECT type from types INNER JOIN properties ON types.type_id=properties.type_id WHERE properties.atomic_number = 2;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 2;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 2;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 2;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
      ;;
    3 | Li | Lithium)
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 3")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 3")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 3")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 3;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 3;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 3;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 3;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    4 | Be | Beryllium)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 4")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 4")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 4")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 4;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 4;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 4;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 4;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    5 | B | Boron)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 5")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 5")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 5")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 5;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 5;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 5;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 5;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    6 | C | Carbon)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 6")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 6")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 6")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 6;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 6;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 6;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 6;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    7 | N | Nitrogen)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 7")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 7")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 7")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 7;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 7;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 7;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 7;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    8 | O | Oxygen)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 8")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 8")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 8")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 8;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 8;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 8;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 8;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    9 | F | Fluorine)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 9")
          ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 9")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 9")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 9;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 9;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 9;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 9;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    10 | Ne | Neon)
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = 10")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = 10")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = 10")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties ON types.type_id = properties.type_id WHERE properties.atomic_number = 10;")
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = 10;")
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = 10;")
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = 10;")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
    ;;
    *) echo "I could not find that element in the database." ;;
  esac
fi