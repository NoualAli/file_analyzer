#!/bin/bash

# Prompt the user for the directory to analyze
read -rp "Enter the directory path to analyze: " directory

# Check if the directory exists
if [[ ! -d "$directory" ]]; then
    echo "Error: The specified directory does not exist."
    exit 1
fi

# Prompt the user for file extensions
extensions=()
echo "Enter the file extensions to analyze (one per line, press Enter when done):"

while true; do
    read -rp "Extension: " ext
    if [[ -z "$ext" ]]; then
        break  # Stop input when the user presses Enter
    fi
    extensions+=("$ext")
done

# Ensure at least one extension is provided
if [[ ${#extensions[@]} -eq 0 ]]; then
    echo "No extensions provided. Exiting."
    exit 1
fi

echo "Analyzing, please wait..."

# Initialize counters
total_files=0
total_lines=0
file_counts=()
line_counts=()

# Initialize arrays for each extension
for ext in "${extensions[@]}"; do
    file_counts+=("0")
    line_counts+=("0")
done

# Recursively scan the directory and count files/lines
while IFS= read -r -d '' file; do
    ext="${file##*.}"
    for i in "${!extensions[@]}"; do
        if [[ "${extensions[i]}" == "$ext" ]]; then
            lines=$(grep -cve '^\s*$' "$file") # Count non-empty lines
            file_counts[i]=$((file_counts[i] + 1))
            line_counts[i]=$((line_counts[i] + lines))
            total_files=$((total_files + 1))
            total_lines=$((total_lines + lines))
        fi
    done
done < <(find "$directory" -type f -print0)

# Function to format numbers with thousands separator
format_number() {
    echo "$1" | awk '{printf "%'\''d\n", $1}'
}

# Display results
echo -e "\n📊 Analysis Results:"
for i in "${!extensions[@]}"; do
    echo "🔹 Extension .${extensions[i]} → Files: $(format_number "${file_counts[i]}"), Lines: $(format_number "${line_counts[i]}")"
done

echo -e "\n📌 Overall Total:"
echo "📂 Total number of analyzed files: $(format_number "$total_files")"
echo "📄 Total number of code lines: $(format_number "$total_lines")"
