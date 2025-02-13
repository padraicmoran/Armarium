<?php
require 'functions/core.php';
template01();
require 'pages/includes/metadata_general.htm';
template02();

$page = cleanInput('page') ?? '';

// Page routing
switch($page) {
	case 'about':
		require('pages/about.php');
		break;

	default:
		// default to home page
		require('pages/home.php');
		break;
}

template03();
?>