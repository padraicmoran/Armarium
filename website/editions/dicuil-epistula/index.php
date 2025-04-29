<?php
require '../../functions/core.php';
template01();
require 'metadata.htm';
template02();

// get page choice
$section = cleanInput('sec') ?? '';
?>

<main class="pb-5">

	<!-- Edition header -->
	<section style="background-color: #d9d3b3;">
<?php
require 'edition_header.htm';
?>
		<script>

// Set TOC form to default to current page
$(document).ready(function() {
	var secValue = new URLSearchParams(window.location.search).get('sec');
	if (secValue) {
		$('#selectTOC').val(secValue);
	}
});		

// Detect when the select value changes and submit the form 
$('#selectTOC').change(function() {
		$('#formTOC').submit();
});

		</script>
	</section>

	<!-- Main content holder -->
	<section class="container ps-3 pe-3">
<?php

// Page routing
$contentFile = '';
// If a section was passed in, check to see whether a file of that name exists
if ($section <> '') {
	if (file_exists('content/' . $section . '.htm')) {
		$contentFile = $section . '.htm';
	}
}
// If not yet assigned, see target to introduction
if ($contentFile == '') {
	$contentFile = 'introduction.htm';
}
// Load content file
require('content/' . $contentFile);

?>
	</section>
</main>

<?php
template03();
?>