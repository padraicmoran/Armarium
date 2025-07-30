<?php
require 'functions/core.php';

template01();
require 'pages/includes/metadata_general.htm';

$page = cleanInput('page') ?? 'home';
template02($nav, $page);

// Page routing
switch($page) {
	case 'about':
		require('pages/about.php');
		break;

	case 'editorial':
		require('pages/editorial.php');
		break;

		default:
		// default to home page
		require('pages/home.php');
		break;
}

template03();
?>