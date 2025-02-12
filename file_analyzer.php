<?php

/**
 * Author: NLDev / NoualAli
 * Email: noualdev@gmail.com
 * Counts the number of files and lines of code in a given directory based on specified extensions.
 *
 * @param string $directory The directory to analyze.
 * @param array $extensions The list of file extensions to include in the analysis.
 * @return array An array containing file and line counts per extension, as well as overall totals.
 */
function countFilesAndLines(string $directory, array $extensions): array
{
    // Check if the directory exists
    if (!is_dir($directory)) {
        die("Error: The specified directory does not exist.\n");
    }

    // Initialize recursive directory iterator
    $rii = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($directory));
    $results = [];
    $totalFiles = 0;
    $totalLines = 0;

    // Initialize results array for each specified extension
    foreach ($extensions as $ext) {
        $results[$ext] = ['file_count' => 0, 'total_lines' => 0];
    }

    // Iterate through all files in the directory
    foreach ($rii as $file) {
        if ($file->isFile()) {
            $ext = $file->getExtension();
            if (in_array($ext, $extensions)) {
                // Count lines of code excluding empty lines
                $lines = count(file($file->getPathname(), FILE_SKIP_EMPTY_LINES));
                $results[$ext]['file_count']++;
                $results[$ext]['total_lines'] += $lines;
                $totalFiles++;
                $totalLines += $lines;
            }
        }
    }

    return [$results, $totalFiles, $totalLines];
}

// Prompt user for the directory to analyze
echo "Enter the directory path to analyze: ";
$directory = trim(fgets(STDIN)); // Read user input

// Prompt user for file extensions to analyze
$extensions = [];
echo "Enter the file extensions to analyze (one at a time, just tape enter to finish):\n";
while (true) {
    echo "Extension: ";
    $ext = trim(fgets(STDIN));
    if (empty($ext)) {
        break;
    }
    if (!empty($ext)) {
        $extensions[] = ltrim($ext, '.'); // Remove the dot if the user adds it
    }
}

echo "Analysis in progress, please wait...\n";

// Check if at least one extension is specified
if (empty($extensions)) {
    die("No extension specified, exiting script.\n");
}

// Execute the file and line count
list($results, $totalFiles, $totalLines) = countFilesAndLines($directory, $extensions);

// Display the results
echo "\n📊 Analysis Results:\n";
foreach ($results as $ext => $data) {
    echo "🔹 Extension .$ext → Files: " . number_format($data['file_count'], 0, ',', ' ') .
        ", Lines: " . number_format($data['total_lines'], 0, ',', ' ') . "\n";
}

echo "\n📌 Overall Total:\n";
echo "📂 Total number of analyzed files: " . number_format($totalFiles, 0, ',', ' ') . "\n";
echo "📄 Total number of lines of code: " . number_format($totalLines, 0, ',', ' ') . "\n";
