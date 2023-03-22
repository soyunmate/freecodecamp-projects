#!/bin/bash
echo -e "\n~~~ Welcome to pudu's Salon & barbershop ~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU() {
if [[ $1 ]]
then
echo -e "\n$1"
fi

echo "Wold you like to make an appointment? Here are our services!"
echo -e "\n1) cut\n2) dye\n3) shave\n4) Exit\n"
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
1) APPOINT_MENU ;;
2) APPOINT_MENU ;;
3) APPOINT_MENU ;;
4) EXIT ;;
*) MAIN_MENU "I could not find that service" ;;
esac

}

APPOINT_MENU () {
#get service name and id
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

#get and check customer phone
echo "What's is your phone number?"
read CUSTOMER_PHONE
#check customer phone
CHECK_CUSTOMER_PHONE=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CHECK_CUSTOMER_PHONE ]]
then
echo "I could not dinf that phone number. What's is your name?"
read CUSTOMER_NAME
INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
fi

#get info to insert
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
echo "Enter the appointment time:"
read SERVICE_TIME
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")


#insert appointment
APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
if [[  -z APPOINTMENT_RESULT ]]
then
MAIN_MENU "An error ocurred when entering the data" 
else
echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
fi

}

EXIT(){
 echo "Thank you for your visit"
}

MAIN_MENU
