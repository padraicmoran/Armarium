
Method for finding all content files for an edition and creating a single PDF version.

1) Install weasyprint:
sudo apt install weasyprint

2) From edition directory (e.g. /website/editions/dicuil-epistula) run:
cat edition_header.htm content/*.htm > combined.htm | weasyprint combined.htm edition.pdf -s ../../../processing/create-pdf/print-styles.css 

Or for no header (e.g. for an anonymised version for peer review)
cat content/*.htm > combined.htm | weasyprint combined.htm edition.pdf -s ../../../processing/create-pdf/print-styles.css 

3) CSS styles can be edited in /processing/create-df print-styles.css

4) Rename edition.pdf as {directory-name}.pdf.

5) You may wish to delete combined.html on completion.
