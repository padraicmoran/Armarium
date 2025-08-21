<?php
require 'functions/core.php';

// get request
$dir  = cleanInput('d');
$file = basename(cleanInput('f')); // strip path parts
$path = $dir . '/' . $file;

// check whether path is allowed
$allowedPaths = [
    'data/dicuil-epistula.xml', 
    'docs/Armarium_documentation.pdf'
];
if (!in_array($path, $allowedPaths, true)) {
    http_response_code(404);
    exit('File not found.');
}

// construct full path
$fullPath  = realpath(__DIR__ . '/../' . $path);
if ($fullPath === false || !is_file($fullPath)) {
    http_response_code(404);
    exit('File not found.');
}
// MIME type headers
$ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
$mimeTypes = [
    'xml' => 'application/xml; charset=utf-8',
    'pdf' => 'application/pdf',
];

header('Content-Type: ' . $mimeTypes[$ext]);
header('Content-Disposition: inline; filename="' . basename($fullPath) . '"');
header('Content-Length: ' . filesize($fullPath));

readfile($fullPath);
?>