#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Print each command before executing it (useful for debugging)
set -x

# Function to display an error message and exit
function error_exit {
  echo "$1" 1>&2
  exit 1
}

echo "Creating virtual environment..."
python3 -m venv venv || error_exit "Failed to create virtual environment."

echo "Activating virtual environment..."
source venv/bin/activate || error_exit "Failed to activate virtual environment."

echo "Installing dependencies..."
pip install --upgrade pip || error_exit "Failed to upgrade pip."
pip install -r requirements.txt || error_exit "Failed to install dependencies."

echo "Running main Python script..."
python src/main.py || error_exit "Failed to run main Python script."

jupyter nbconvert --to notebook --execute eda.ipynb --output eda_output.ipynb || error_exit "Failed to run Jupyter Notebook."

echo "Deactivating virtual environment..."
deactivate

echo "Script completed successfully!"