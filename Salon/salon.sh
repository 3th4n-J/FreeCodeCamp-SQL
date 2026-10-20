#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  # Print an error message if one was passed into the function
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "Welcome to my salon, how can I help you?\n"

  # Fetch and display services dynamically from the database
  SERVICES=$($PSQL "SELECT CONCAT(service_id, ') ', name) FROM services ORDER BY service_id;")
  echo "$SERVICES"
  
  # MUST use SERVICE_ID_SELECTED to pass the FreeCodeCamp test
  read SERVICE_ID_SELECTED

  # Check if the service_id exists in the database
  CHECK_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED';" | xargs)

  # If it doesn't exist, loop back to the main menu with the required error message
  if [[ -z $CHECK_SERVICE_ID ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # Valid service selected - proceed to get customer phone number
    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs)

    # If no result for customer name, add them to the database
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    fi

    # Retrieve customer_id for the foreign key relationship
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs)

    # Retrieve clean service name for prompts and final message
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';" | xargs)

    # Prompt for appointment time
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insert the appointment record linking customer and service
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

    # Output final confirmation message matching test expectations
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU