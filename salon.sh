#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

  echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "Welcome to My Salon, how can I help you?\n"


MAIN_MENU(){

    if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  
  echo "$SERVICES" | while read SERVICE_ID BAR S_NAME
  do
    echo "$SERVICE_ID) $S_NAME"
  done

  read SERVICE_ID_SELECTED
  
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
       MAIN_MENU "I could not find that service. What would you like today?"
  fi

  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id =$SERVICE_ID_SELECTED;")
    if [[ -z $SERVICE_ID ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
  S_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")

 
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
  

 
  if [[ -z $CUSTOMER_NAME ]]
  then
    
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
  
    CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")

  
  echo -e "\nWhat time would you like your $(echo $S_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME

 
  if [[ -z $SERVICE_TIME ]]
  then
    MAIN_MENU "You have to input the time, please try again"
  fi

 
  APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
  if [[ $APPOINTMENT_RESULT=='INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $(echo $S_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    exit
  else
    MAIN_MENU "Unexpected error occur, please try again."
  fi
}
MAIN_MENU
