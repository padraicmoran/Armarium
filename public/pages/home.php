<main>

	<!-- Introduction to site -->
	<section class="text-center container-fluid border-bottom shadow-sm">
   	<div class="row">
			<div class="col-lg-6 col-md-7 p-5" style="background-color: #d9d3b3;">
					<h1 class="mt-4 mb-4 display-6">Simple, high-quality digital editions</h1>
					<p class="text-muted px-4">
						Armarium is an Open Access, Open Source publishing platform for scholarly digital editions.
						It emphasises
						simple technical implementation,
						long-term preservation,
						citability,
						readability, 
						and quality assurance.
					</p>

					<p class="mb-4"><a class="btn btn-primary my-2" href="?page=about">More about Armarium</a></p>

			</div>
			<div class="col-lg-6 col-md-5 bg-secondary" style="background-image: url('/pages/images/Galla-Placidia-armarium.jpg'); background-position: left bottom; background-size: 170%; ">
			</div>
		</div>
	</section>

	<!-- List of available editions -->
	<div class="text-center container">
	<h1 class="mt-5 py-5 fw-light">Editions</h1>

		<div class="row row-cols-lg-3 g-4">
			<div class="col mx-auto">
<?php 
require 'editions/dicuil-epistula/index_card.htm';
?>

			</div>
		</div>
	</div>
</main>
