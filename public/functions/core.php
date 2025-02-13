<?php
/* 
Draws in all components
*/

$debug = true;
if ($debug) {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
}

require __DIR__ . '/utils.php';
require __DIR__ . '/../pages/includes/template.php';

?>
