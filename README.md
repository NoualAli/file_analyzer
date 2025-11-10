# File and Code Line Analyzer

## Description

A powerful Bash script that analyzes directories to count files and lines of code for specific file extensions. Perfect for getting project statistics, codebase metrics, and understanding project structure.

## Features

- **Smart Directory Analysis**: Recursively scans directories while excluding common unnecessary folders (`vendor`, `node_modules`, `storage`)
- **Flexible Extension Support**: Analyze any file extensions you need
- **Empty Line Filtering**: Counts only non-empty lines of actual code
- **Formatted Output**: Clean, readable results with thousands separators
- **Interactive Prompts**: User-friendly command-line interface
- **Relative Path Support**: Use simple directory names instead of full paths
- **Configurable Exclusions**: Add custom directories to exclude from analysis

## Prerequisites

- Bash 3.x or higher
- Command-line access (Terminal on macOS/Linux, Git Bash/WSL on Windows)

## Installation

1. Clone this repository:

   ```sh
   git clone https://github.com/NoualAli/file_analyzer.git && cd file_analyzer
   ```

2. Make the script executable:
   ```sh
   chmod +x file_analyzer.sh
   ```

## Usage

### Basic Usage

1. Run the script:

   ```sh
   ./file_analyzer.sh
   ```

1. Follow the interactive prompts:

- Enter the directory name (relative path) to analyze
- Choose whether to add additional excluded directories
- Enter file extensions to analyze (one per line)
- Press Enter when done entering extensions

### Example Session

```sh
$ ./file_analyzer.sh
Enter the directory name to analyze (relative path): my-project
Default excluded directories: vendor node_modules storage
Do you want to add more directories to exclude? (y/n): n

Enter the file extensions to analyze (one per line, press Enter when done):
Extension: php
Extension: js
Extension: css
Extension:

Analyzing, please wait...

📁 Directories that will be analyzed:
my-project
my-project/app
my-project/config
my-project/public
my-project/resources

📊 Analysis Results:
🔹 Extension .php → Files: 45, Lines: 12,345
🔹 Extension .js → Files: 23, Lines: 5,678
🔹 Extension .css → Files: 8, Lines: 1,234

📌 Overall Total:
📂 Total number of analyzed files: 76
📄 Total number of code lines: 19,257

🚫 Excluded directories: vendor node_modules storage
```

### Advanced Usage

You can also use relative paths:

```sh
# Analyze parent directory
Enter the directory name to analyze (relative path): ..

# Analyze sibling directory
Enter the directory name to analyze (relative path): ../sibling-project

# Analyze subdirectory
Enter the directory name to analyze (relative path): src/components
```

## Default Exclusions

**The script automatically excludes these directories:**

- <code>vendor</code> **(Composer dependencies (PHP))**
- <code>node_modules</code> **(NPM packages (JavaScript))**
- <code>storage</code> **(Laravel storage directory)**

**You can add more exclusions during script execution.**

## Output Explanation

- 📁 Directories that will be analyzed: Shows all directories that will be processed
- 📊 Analysis Results: Breakdown by file extension with file counts and line counts
- 📌 Overall Total: Combined statistics across all extensions
- 🚫 Excluded directories: Summary of directories excluded from analysis

## Versions

### v2.0 (Current)

- Automatic exclusion of vendor, node_modules, and storage directories
- Relative path support for easier usage
- Improved user interface with better prompts
- Enhanced directory listing display

### v1.0

- Initial file analyzer version
- Basic file and line counting functionality
- Multiple extension support
- Simple interactive interface

## Use Cases

- **Project Metrics:** Get quick statistics about your codebase
- **Code Review:** Understand the scope of changes
- **Documentation:** Generate code statistics for reports
- **Cleanup:** Identify large or complex areas of your codebase

## Troubleshooting

**Script won't run:**

- Ensure Bash is installed: <code>bash --version</code>
- Make script executable: <code>chmod +x file_analyzer.sh</code>

**Directory not found:**

- Use relative paths from your current location
- Check spelling and case sensitivity

**No results:**

- Verify file extensions are correct (without the dot)
- Check if all directories are being excluded

**Permission denied:**

- On Windows, use Git Bash instead of Command Prompt
- Ensure you have read permissions for the directories

## Contributing

Contributions are welcome! Feel free to submit improvements via pull requests.

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

## License

This project is licensed under the MIT License. See LICENSE file for details.

## Author

Developed by <a href="https://www.linkedin.com/in/ali-noual">NoualAli</a>

**_NB: This script is designed for Unix-like systems (Linux, macOS) and requires Bash. Windows users should use Git Bash or WSL for optimal compatibility._**
