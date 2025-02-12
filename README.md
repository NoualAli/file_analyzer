# File and Code Line Analyzer

## Description  
This PHP script analyzes a given directory by counting the number of files and lines of code for specific extensions. It is useful for getting project statistics and understanding its structure better.  

## Features  
- Prompts the user for the directory to analyze  
- Asks for the file extensions to include in the analysis  
- Recursively scans all files in the directory  
- Counts the number of files and total lines of code (excluding empty lines)  
- Displays formatted results with an overall total  

## Prerequisites  
- PHP >= 8.3.12 installed on your system  
- Command-line access (Terminal, CMD, or PowerShell)  

## Installation  
1. Clone this repository:  
   ```sh  
   git clone https://github.com/NoualAli/file_analyzer.git  
   ```  
2. Navigate to the project folder:  
   ```sh  
   cd repository-name  
   ```  
3. Ensure PHP is installed (Tested with php 8.3.12):  
   ```sh  
   php -v  
   ```  

## Usage  
1. Run the script in a terminal:  
   ```sh  
   php file_analyzer.php  
   ```  
2. Enter the path of the directory to analyze when prompted.  
3. Enter the file extensions to analyze one by one (e.g., `php`, `js`, `html`).  
4. When you have finished entering extensions, just tape enter. 
5. Wait for the analysis to complete.  
6. The results will be displayed in the following format:  

   ```sh  
   📊 Analysis Results:  
   🔹 Extension .php → Files: 25, Lines: 10,234  
   🔹 Extension .js → Files: 12, Lines: 3,450  

   📌 Overall Total:  
   📂 Total number of analyzed files: 37  
   📄 Total number of code lines: 13,684  
   ```  

## Example Usage  
If you want to analyze a project located in `/Users/macbook/Documents/project`, with `.php` and `.js` files:  
```
Enter the directory path to analyze: /Users/macbook/Documents/project  
Enter the file extensions to analyze (one by one, tape enter to finish):  
Extension: php  
Extension: js  
Extension:  
```

## Contributions  
Contributions are welcome! Feel free to submit improvements via pull requests.  

## License  
This project is licensed under the MIT License. You are free to use and modify it as needed.

