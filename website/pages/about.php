<main>
	<section class="pt-5 px-4 container">
   	<div class="row py-lg-5">
      	<div class="col-lg-8 col-md-10 mx-auto">


<h1 class="fw-light mb-5">About Armarium</h1>

<p>In ancient and medieval times, book collections were often small. 
	They could be stored in an <i>armarium</i>, i.e. a cabinet standing upright against a wall, 
	or perhaps in a <i>theca</i> (or <i>bibliotheca</i>), typically a chest on the floor.
	The Latin word <i>armarium</i> must have originally applied to a store for weapons. 
	It was more commonly used, however, to describe a cabinet or cupboard in general 
	(cf. French <i>armoire</i>, etc.), including a book-case.
</p>

<p>The image below, from the <a href="https://www.ravennamosaici.it/en/mausoleum-of-galla-placidia/">mausoleum of Galla Placidia</a>
	in Ravenna (c. AD 425–450) depicts a Late Antique <i>armarium</i> on the left, with shelves and doors, 
	containing the four Gospels. It is similar to the famous depiction of the 
	<a href="https://commons.wikimedia.org/wiki/Category:Codex_Amiatinus#/media/File:CodxAmiatinusFolio5rEzra.jpg">scribe Ezra writing beside an <i>armarium</i></a> 
	in the eighth-century Codex Amiatinus.
</p>

<p>This <b>digital Armarium</b> is also a repository for texts. It aims to faciliate
	scholars who wish to publish scholarly digital editions, especially of short to medium length. 
	Its principles of simple technical implementation, 
	long-term preservation, citability, readability, and quality assurance are explained further 
	<a href="#principles">below</a>.
</p>

			</div>
		</div>
   	<div class="row">
      	<div class="col-lg-10 mx-auto">

				<figure class="figure align-center">
				<img class="figure-img img-fluid rounded" src="/pages/images/Galla-Placidia-armarium.jpg" 
					alt="Mosaic from the mauseoleum of Galla Placidia, showing an armarium">
				<figcaption class="figure-caption text-end">
					Image source: <a target="_blank" href="https://www.ravennamosaici.it/gallery/">www.ravennamosaici.it</a>

				</figcaption>
				</figure>

			</div>
		</div>
   	<div class="row">
      	<div class="col-lg-8 col-md-10 mx-auto">


<h2 id="principles" class="fw-light mt-5 mb-5">Principles</h2>

<h2 id="simple-implementation" class="h3 mt-4 fw-light">1. Simple technical implementation</h2>
<p>The primary goal of Armarium is to make it as simple as possible for researchers to publish their editions online.
To that end, the technical barrier is kept as low as possible.
</p>

<p>Content should be supplied in XML, a format that is <a target="_blank" href="http://www.pmoran.ie/posts/guide-to-xml/">very easy to learn</a>. 
	More specifically, the XML should conform to the recommendations of the <a target="_blank" href="https://tei-c.org/">Text Encoding Initiative</a> (TEI).
	You do <i>not</i> need to study the vast TEI guidelines, however. You can just 
	read the <a href="/docs/Armarium_documentation.pdf">short documentation</a> and follow the 
	<a href="https://github.com/padraicmoran/Armarium/tree/master/data">XML templates</a>.
</p>

<p>The same principle of simplicity also supports <a href="#long-term-preservation">long-term preservation</a> and 
	<a href="#readability">readability</a> (see below).
</p>
	
<p>Simplicity does not need to be a limitation. The data behind all of editions will be freely 
	available to be processed and analysed in more complex applications.
</p>

<h2 id="long-term-preservation" class="h3 mt-5 fw-light">2. Long-term preservation</h2>
<p>The core of this resource is the XML data underlying each edition. XML is an excellent format
	for long-term archiving.</p>
<p>Both XML data and the website presentation are deposited and made publicly accessible in long-term data repositories 
	(<a href="https://github.com/padraicmoran/Armarium" target="_blank">GitHub</a>
	and <a href="https://doi.org/10.5281/zenodo.16605326" target="_blank">Zenodo</a>) to ensure access for future generations.
</p>
<p>A PDF version is also generated for each edition, to offer another archiving format.
</p>
<p>The technology behind the website (HTML, CSS and some 
	very light PHP scripts) is kept as simple as possible, 
	in order to minimise requirements for updating and maintenance.
	This will support the long-term stability of the web presentation.	
</p>

<p>Data meets the <a target="_blank" href="https://www.go-fair.org/fair-principles/">FAIR principles</a> as far as possible. These involve ensuring that editions are:
	</p>
<ul>
<li>Findable, with unique and persistent identifiers (DOI and web URL), rich metadata containing also the identifiers, and available in other searchable resources (e.g. GitHub, Zenodo).</li>
<li>Accessible, via a secure internet protocol (https), freely.</li>
<li>Interoperable, using TEI XML, a widely recognised semantic mark-up.</li>
<li>Reusable, under an explicit licence (usually the <a target="_blank" href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0</a> International License).</li>
</ul>

<h2 id="citability" class="h3 mt-5 fw-light">3. Citability</h2>
<p>Editors deserve full and clear recognition for their work. 
	Each edition is presented with a recommended citation formula at the head of every page.
	This will include a unique DOI as well as
	a simple, human-readable URL (web address). 
</p>

<h2 id="readability" class="h3 mt-5 fw-light">4. Readability</h2>
<p>The primary function of any edition is to be read. 
	Armarium aims to present text in a simple, uncluttered and accessible format, with
	attention to typographical detail (on both desktop and mobile screens).
	Graphical content, user-interface elements and colours are kept minimal, to support
	restful reading and concentration.
</p>

<h2 id="quality-assurance" class="h3 mt-5 fw-light">5. Quality assurance</h2>
<p>Armarium has an <a href="/editorial">Editorial Board<a> to review submissions and ensure the overall quality of the collection.
	Editors may also choose to avail of a more formal anonymous peer-review process (and claim peer-review status accordingly).
</p>

<h2 id="technical" class="fw-light pt-5 mt-5 mb-5">Credits</h2>

<p>Armarium is developed and managed by <a href="https://www.pmoran.ie/" target="_blank">Pádraic Moran</a>, University of Galway.
</p>



				 
			</div>
		</div>
	</section>
</main>