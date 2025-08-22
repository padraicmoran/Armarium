# Armarium Digital Editions

Armarium is an Open Access, Open Source publishing platform for scholarly digital editions. It emphasises simple technical implementation, long-term preservation, citability, readability, and quality assurance.

**https://armarium.universityofgalway.ie/**

---
### Folders

* `data`: 
   * TEI XML files for each edition. 
* `docs`: 
   * Documentation for editial process and submissions.
*  `processing`: 
   * XSL transformation files. 
   * Each edition will have its own set of files, to allow for customisations. The `dicuil-epistula` transformation files may be used as a basic template. 
   * Transformations should be run locally using an XSLT processor like Saxon, etc. They are outputted first to a sub-folder for review. If acceptable, they can be moved to the relevant edition folder within `website/editions`. 
* `website`:
   * Website files. Each edition has its own folder within `editions`. 
   * Each edition has an index card for display on the home page. To include this on the home page, edit`pages/home.php`. (Work in progress can therefore be tested live, but not yet listed.)

---
Developed by [Pádraic Moran](http://www.pmoran.ie), University of Galway. 

