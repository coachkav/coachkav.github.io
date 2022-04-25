#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

NO_ELEMENT() {
  echo "I could not find that element in the database."
}
ATOM_DETAIL(){
  echo $($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING(type_ID) WHERE $1='$2';") 
}

PRINT_RESULT(){
  if [[ ! -z $1 ]]
  then
    echo "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
  else
    NO_ELEMENT
  fi
}

if [[ ! $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

if [[ $1 =~ ^[0-9]+$ ]]
then
  #argument is number, find element by atomic_number
  ATOM_RESULT=$(ATOM_DETAIL atomic_number $1)
elif [[ $1 =~ ^[a-zA-Z]+$ ]]
then
  if [[ ${#1} -le 2 ]]
  then
    ATOM_RESULT=$(ATOM_DETAIL symbol $1)
  else
    ATOM_RESULT=$(ATOM_DETAIL name $1)
  fi
fi

# print the result
echo $ATOM_RESULT | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING BAR BOILING
do
  PRINT_RESULT $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING $BOILING
done
