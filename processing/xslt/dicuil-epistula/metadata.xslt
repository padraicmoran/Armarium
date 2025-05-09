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
      <meta name="description" lang="en">
         <xsl:attribute name="content"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract/tei:p"/></xsl:attribute>
      </meta>
      <meta name="DC.title" lang="en">
         <xsl:attribute name="content"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></xsl:attribute>
      </meta>
      <meta name="DC.description" lang="en">
         <xsl:attribute name="content"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract/tei:p"/></xsl:attribute>
      </meta>
      <meta name="DC.creator" content="">
         <xsl:attribute name="content"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/></xsl:attribute>
      </meta>
      <meta name="DC.publisher" content="Armarium"></meta>
      <meta name="DC.type" content="Text"></meta>
      <meta name="DC.format" content="text/html"></meta>
      <meta name="DC.coverage" content="Global"></meta>
      <meta name="DC.source" content="University of Galway"></meta>
      <meta name="DC.language" content="en_IE"></meta>

    </xsl:template>
</xsl:stylesheet>