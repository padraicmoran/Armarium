# Armarium Digital Editions

Armarium is an Open Access, Open Source publishing platform for scholarly digital editions. It emphasises simple technical implementation, long-term preservation, citability, readability, and quality assurance.

**https://armarium.universityofgalway.ie/**

---
### Folders

* `data`: 
   * TEI XML files for each edition. 
*  `processing`: 
   * XSL transformation files. 
   * Each edition will its own set of files, to allow for customisations. The `dicuil-epistula` transformation files may be used as a basic template. 
   * Transformations should be run locally using an XSLT processor like Saxon, etc. They are outputted first to a sub-folder for review. If acceptable, they can be moved to the relevant folder within `website`. 
* `website`:
   * Website files. Each edition has its own folder within `editions`. 
   * The index card for each edition can be included on `pages/home.php`.

