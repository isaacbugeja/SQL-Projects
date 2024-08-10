#! /bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "1) Cut"
  echo "2) Color"
  echo "3) Perm"
  echo "4) Style"
  echo "5) Trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1)  CUT_MENU ;;
    2)  COLOR_MENU ;;
    3)  PERM_MENU ;;
    4)  STYLE_MENU ;;
    5)  TRIM_MENU ;;
    *)  MAIN_MENU "I could not find that service, what would you like today?" ;;
  esac
}

CUT_MENU() {
  #ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #find customer using phone number
  GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if does not exist
  if [[ -z $GET_CUSTOMER_ID ]]
  then
    #insert name into customer TABLE
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #Insert customer info
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
      read SERVICE_TIME
      #get new customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1, '$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  else
    #get customer name and ask for service time
    echo -e "\nWhat time would you like your cut, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME
    #insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, 1, '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a cut at $SERVICE_TIME, $GET_CUSTOMER_NAME."
    fi
  fi
}

COLOR_MENU(){
  #ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #find customer using phone number
  GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if does not exist
  if [[ -z $GET_CUSTOMER_ID ]]
  then
    #insert name into customer TABLE
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #Insert customer info
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
      read SERVICE_TIME
      #get new customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2, '$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  else
    #get customer name and ask for service time
    echo -e "\nWhat time would you like your color, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME
    #insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, 2, '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a color at $SERVICE_TIME, $GET_CUSTOMER_NAME."
    fi
  fi
}

PERM_MENU(){
  #ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #find customer using phone number
  GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if does not exist
  if [[ -z $GET_CUSTOMER_ID ]]
  then
    #insert name into customer TABLE
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #Insert customer info
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
      read SERVICE_TIME
      #get new customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 3, '$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  else
    #get customer name and ask for service time
    echo -e "\nWhat time would you like your perm, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME
    #insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, 3, '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a perm at $SERVICE_TIME, $GET_CUSTOMER_NAME."
    fi
  fi
}

STYLE_MENU(){
  #ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #find customer using phone number
  GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if does not exist
  if [[ -z $GET_CUSTOMER_ID ]]
  then
    #insert name into customer TABLE
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #Insert customer info
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nWhat time would you like your styling, $CUSTOMER_NAME?"
      read SERVICE_TIME
      #get new customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 4, '$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a styling at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  else
    #get customer name and ask for service time
    echo -e "\nWhat time would you like your styling, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME
    #insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, 4, '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a styling at $SERVICE_TIME, $GET_CUSTOMER_NAME."
    fi
  fi
}

TRIM_MENU(){
  #ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #find customer using phone number
  GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if does not exist
  if [[ -z $GET_CUSTOMER_ID ]]
  then
    #insert name into customer TABLE
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #Insert customer info
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
      read SERVICE_TIME
      #get new customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 5, '$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  else
    #get customer name and ask for service time
    echo -e "\nWhat time would you like your trim, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME
    #insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, 5, '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a trim at $SERVICE_TIME, $GET_CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU
