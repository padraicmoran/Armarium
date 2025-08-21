<?php
require 'functions/core.php';

$dir  = cleanInput('d');
$file = basename(cleanInput('f')); // strip path parts

// Validate input
if (!$dir || !$file) {
    http_response_code(400);
    exit('Invalid parameters.');
}

$allowedDirs = ['data', 'docs'];
if (!in_array($dir, $allowedDirs, true)) {
    http_response_code(400);
    exit('Invalid directory.');
}

$baseDir  = realpath(__DIR__ . '/../' . $dir);
$fullPath = realpath($baseDir . '/' . $file);

// Security checks
if (
    $fullPath === false ||
    strpos($fullPath, $baseDir) !== 0 ||
    !is_file($fullPath)
) {
    http_response_code(404);
    exit('File not found.');
}

// Restrict extensions
$ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
$allowedExts = ['xml', 'pdf'];

if (!in_array($ext, $allowedExts, true)) {
    http_response_code(403);
    exit('Only XML and PDF files are allowed.');
}

// MIME type headers
$mimeTypes = [
    'xml' => 'application/xml; charset=utf-8',
    'pdf' => 'application/pdf',
];

header('Content-Type: ' . $mimeTypes[$ext]);
header('Content-Disposition: inline; filename="' . basename($fullPath) . '"');
header('Content-Length: ' . filesize($fullPath));

readfile($fullPath);
?>