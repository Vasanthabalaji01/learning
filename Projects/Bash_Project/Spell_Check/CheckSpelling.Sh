#!/bin/bash

# Prompt user for folder path
read -p "Enter the folder path: " folder_path

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
  echo "Folder not found."
  exit 1
fi

# Loop through files in the folder
for file in "$folder_path"/*; do
  # Check if the file is a regular file
  if [ -f "$file" ]; then
    echo "Spell-checking file: $file"
    
    # Perform spell-checking using aspell
    aspell --lang=en --check "$file"
    
    echo "----------------------"
  fi
done