<?php

/*
General functions not specific to this website
*/

function cleanInput($key) {
	if (isset($_GET[$key])) return htmlspecialchars($_GET[$key], ENT_QUOTES, 'UTF-8');
}

?>