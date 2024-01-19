#!/bin/bash

# Define an error handler
handle_error() {
    echo "Error getting environment variables: $1"
}

# Trap errors
trap 'handle_error "$_"' ERR

# Get all environment variables
ENV_VARS=$(azd env get-values --no-prompt 2>&1)

# Extract the value for SERVICE_WEB_URI
SERVICE_WEB_URI=$(echo "$ENV_VARS" | grep -oP '^SERVICE_WEB_URI=\K.*')

# Check if the value is empty
if [ -z "$SERVICE_WEB_URI" ]; then
    # Set a default value
    SERVICE_WEB_URI="http://localhost:4280"
fi

# Write the value to .env.local
echo "SERVICE_WEB_URI=$SERVICE_WEB_URI" > .env.local
