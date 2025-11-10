#!/bin/bash

# Default excluded directories
excluded_dirs=("vendor" "node_modules" "storage")

# Prompt the user for the directory to analyze
read -rp "Enter the directory name to analyze (relative path): " directory

# Check if the directory exists
if [[ ! -d "$directory" ]]; then
    echo "Error: The specified directory '$directory' does not exist."
    exit 1
fi

# Ask if user wants to add more excluded directories
echo "Default excluded directories: ${excluded_dirs[*]}"
read -rp "Do you want to add more directories to exclude? (y/n): " add_exclude

if [[ $add_exclude == "y" || $add_exclude == "Y" ]]; then
    echo "Enter additional directories to exclude (one per line, press Enter when done):"
    while true; do
        read -rp "Directory: " dir
        if [[ -z "$dir" ]]; then
            break
        fi
        excluded_dirs+=("$dir")
    done
fi

# Prompt the user for file extensions
extensions=()
echo -e "\nEnter the file extensions to analyze (one per line, press Enter when done):"

while true; do
    read -rp "Extension: " ext
    if [[ -z "$ext" ]]; then
        break
    fi
    extensions+=("$ext")
done

if [[ ${#extensions[@]} -eq 0 ]]; then
    echo "No extensions provided. Exiting."
    exit 1
fi

echo "Analyzing, please wait..."

# Build find exclude patterns for file scanning
find_excludes=()
for dir in "${excluded_dirs[@]}"; do
    find_excludes+=(-not -path "*/${dir}/*")
done

# Build find exclude patterns for directory listing
dir_excludes=()
for dir in "${excluded_dirs[@]}"; do
    dir_excludes+=(-name "$dir" -prune -o)
done

# Initialize counters
total_files=0
total_lines=0
file_counts=()
line_counts=()

for ext in "${extensions[@]}"; do
    file_counts+=("0")
    line_counts+=("0")
done

# Get list of directories that will be analyzed (CORRECTED VERSION)
analyzed_dirs=$(find "$directory" -type d \( "${dir_excludes[@]}" -type d -print \) | sort)

echo -e "\n📁 Directories that will be analyzed:"
if [[ -n "$analyzed_dirs" ]]; then
    echo "$analyzed_dirs"
else
    echo "No directories found (all may be excluded)"
fi

# Recursively scan the directory (CORRECTED - using the same excludes)
while IFS= read -r -d '' file; do
    ext="${file##*.}"
    for i in "${!extensions[@]}"; do
        if [[ "${extensions[i]}" == "$ext" ]]; then
            lines=$(grep -cve '^\s*$' "$file" 2>/dev/null || echo 0)
            file_counts[i]=$((file_counts[i] + 1))
            line_counts[i]=$((line_counts[i] + lines))
            total_files=$((total_files + 1))
            total_lines=$((total_lines + lines))
        fi
    done
done < <(find "$directory" -type f "${find_excludes[@]}" -print0)

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
echo -e "\n🚫 Excluded directories: ${excluded_dirs[*]}"