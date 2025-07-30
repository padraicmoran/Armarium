<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="tei">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <!-- Main selector -->
    <xsl:template match="/">

      <!-- Title -->
      <title>
         <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>,
         <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/> 
         (Armarium Digital Editions)
      </title>

      <!-- Metadata -->
      <xsl:text>
      </xsl:text><!-- line break -->
      <xsl:comment>Title and creator</xsl:comment>
      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.title" lang="en" content="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author}, {tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.creator" content="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.creator" content="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor/@ref}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <xsl:comment>Subject, description, publisher</xsl:comment>
      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.subject" lang="en" content="Digital editions of medieval texts"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.description" lang="en" content="{tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract/tei:p}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="description" lang="en" content="{tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract/tei:p}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.publisher" content="Armarium Digital Editions"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <xsl:comment>Other</xsl:comment>
      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.identifier" content="https://doi.org/{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='DOI']}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.identifier" content="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='URL']}"></meta>
      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.rights" content="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability//tei:ref/@target}"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.type" content="Text"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.format" content="text/html"></meta>

      <xsl:text>
      </xsl:text><!-- line break -->
      <meta name="DC.language" content="en_IE"></meta>

    </xsl:template>
</xsl:stylesheet>