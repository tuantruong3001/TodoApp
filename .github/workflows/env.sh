#!/bin/bash

function replace_values() {
  local file_url=$1
  # replace value

  sed -i "s|.*ANGULAR_APP_API_KEY=.*|ANGULAR_APP_API_KEY=$APIKEY,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_AUTH_DOMAIN=.*|ANGULAR_APP_AUTH_DOMAIN=$AUTHDOMAIN,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_DATABASE_URL=.*|ANGULAR_APP_DATABASE_URL=$DATABASEURL,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_PROJECT_ID=.*|ANGULAR_APP_PROJECT_ID=$PROJECTID,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_STORAGE_BUCKET=.*|ANGULAR_APP_STORAGE_BUCKET=$STORAGEBUCKET,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_MESSAGING_SENDER_ID=.*|ANGULAR_APP_MESSAGING_SENDER_ID=$MESSAGINGSENDERID,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_APP_ID=.*|ANGULAR_APP_APP_ID=$APPID,|g" "$file_url"
  sed -i "s|.*ANGULAR_APP_MEASUREMENT_ID=.*|ANGULAR_APP_MEASUREMENT_ID=$MEASUREMENTID,|g" "$file_url"

  cat "$file_url"
}

replace_values ./.env