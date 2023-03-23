#/bin/bash
INPUT=$1
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN () {
if [[ -z $INPUT ]]
then
echo "Please provide an element as an argument."
else

# querie the input
if [[ ! $INPUT =~ ^[0-9]+$ ]]
then
GET_ELEMENT_RESULT=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol = '$INPUT' OR name='$INPUT'")
else
GET_ELEMENT_RESULT=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number =$INPUT")
fi

#if exist set the variables
if [[ -z $GET_ELEMENT_RESULT ]]
then
#if not found
echo "I could not find that element in the database." 
else
 echo "$GET_ELEMENT_RESULT" | while IFS='|' read NUMBER NAME SYMBOL MASS MELTING BOILING TYPE 
 do
# get the response string
echo -e "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
 done
fi
fi

}

MAIN
