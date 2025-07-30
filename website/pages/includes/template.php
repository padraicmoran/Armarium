<?php
// Page templates

// Top
function template01() {
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<?php
}

// After meta data, down to nav
function template02($nav, $page) {
?>
	<!-- Libraries -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://unpkg.com/@popperjs/core@2"></script>

	<!-- Site styles -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
	<link rel="stylesheet" href="/pages/includes/armarium.css">

	<!-- Favicons -->
	<link rel="apple-touch-icon" href="/glosscorpus/images/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" type="image/x-icon" href="/pages/images/favicon/favicon-32x32.ico" sizes="32x32" type="image/png">
	<link rel="icon" type="image/x-icon" href="/pages/images/favicon/favicon-16x16.ico" sizes="16x16" type="image/png">
	<link rel="icon" type="image/x-icon" href="/pages/images/favicon/favicon.ico">

</head>
<body class="bg-light">

<header>
	<div class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
		<div class="container">
			<!-- brand and title -->
			<a href="/" class="navbar-brand d-flex align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-bookshelf me-2" viewBox="0 0 16 16">
				<path d="M2.5 0a.5.5 0 0 1 .5.5V2h10V.5a.5.5 0 0 1 1 0v15a.5.5 0 0 1-1 0V15H3v.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5M3 14h10v-3H3zm0-4h10V7H3zm0-4h10V3H3z"/>
				</svg>
				<strong>Armarium Digital Editions</strong>
			</a>

			<!-- mobile button -->
			<button class="navbar-toggler d-print-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- menu options -->
			<div class="collapse navbar-collapse d-print-none" id="navbarNav">
				<ul class="navbar-nav ms-auto me-5 px-5">
<?php
  foreach ($nav as $item) {
    if ($item[0] == $page) {
      echo '<li class="nav-item"><a class="nav-link me-2 active" aria-current="page" href="' . $item[2] . '">' . $item[1] . '</a></li>';
    } 
    else {
      echo '<li class="nav-item"><a class="nav-link me-2" href="' . $item[2] . '">' . $item[1] . '</a></li>';
    }
  }
?>
				</ul>
			</div>
		</div>
	</div>
</header>

<?php
}

// Page footer
function template03() {
?>

<footer class="bg-secondary mt-5 py-5 text-light d-print-none">
  <div class="container">
		<div class="row">
			<div class="col-md-6 mb-3 fw-light">

<b>Armarium Digital Editions</b>, <a class="text-reset" href="http://armarium.universityofgalway.ie">http://armarium.universityofgalway.ie</a><br>
Developed by <a class="text-reset" href="https://www.pmoran.ie/" target="_blank">Pádraic Moran</a>, University of Galway<br>
Archived on <a class="text-reset" href="https://github.com/padraicmoran/Armarium" target="_blank">GitHub</a>


			</div>
			<div class="col-md-6 text-end fw-light d-print-none">
				<a href="#" class="text-reset">Back to top</a>
			</div>
		</div>
	</div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<!-- Script for tooltips -->
<script>

var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

</script>

<!-- Default Statcounter code for Armarium
https://armarium.universityofgalway.ie/ -->
<script type="text/javascript">
var sc_project=13154911; 
var sc_invisible=1; 
var sc_security="8d89774a"; 
</script>
<script type="text/javascript"
src="https://www.statcounter.com/counter/counter.js"
async></script>
<noscript><div class="statcounter"><a title="Web Analytics"
href="https://statcounter.com/" target="_blank"><img
class="statcounter"
src="https://c.statcounter.com/13154911/0/8d89774a/1/"
alt="Web Analytics"
referrerPolicy="no-referrer-when-downgrade"></a></div></noscript>
<!-- End of Statcounter Code -->

</body>
</html>

<?php
}