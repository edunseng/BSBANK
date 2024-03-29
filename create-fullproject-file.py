#!/bin/bash

# Redirect output to a file named fullproject.txt
exec > fullproject.txt

# Find all .ipynb files and convert them to .py scripts
if find . -type f -name "*.ipynb" | grep -q '.'; then
  find . -type f -name "*.ipynb" -exec jupyter nbconvert --to script '{}' \;
fi

# Print the list of project files excluding certain file types, directories, .ipynb files, .gitignore, .bak, and .gif files
echo "Project files:"
find . -type f \( ! -name "*.png" ! -name "*.jpg" ! -name "*.jpeg" \
! -name "*.csv" ! -name "*.xlsx" ! -name "*.xls" ! -name "*.pkl" ! -name "*.pyc" \
! -name "*.ipynb" ! -name "*.pdf" ! -name "*.html" ! -name "*.gif" \
! -name "*.bak" ! -name ".gitignore" ! -path "*/.git/*" \
! -path "./input/*" ! -path "./output/*" ! -path "./__pycache__/*" \) | sort | awk '{printf "\"%s\", ", $0}' | sed 's/, $//'
echo ""

# Sort and print the contents of the remaining files, excluding .ipynb files, .gitignore, .bak, and .gif files
find . -type f \( ! -name "*.png" ! -name "*.jpg" ! -name "*.jpeg" \
! -name "*.csv" ! -name "*.xlsx" ! -name "*.xls" ! -name "*.pkl" ! -name "*.pyc" \
! -name "*.ipynb" ! -name "*.pdf" ! -name "*.html" ! -name "*.gif" \
! -name "*.bak" ! -name ".gitignore" ! -path "*/.git/*" \
! -path "./input/*" ! -path "./output/*" ! -path "./__pycache__/*" \) | sort | while read file; do 
  echo "==> $file <=="
  cat "$file"
done