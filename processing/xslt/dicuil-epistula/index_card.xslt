<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="tei">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:param name="edition_dir">
        <xsl:value-of select="tei:TEI/@xml:id"/>
    </xsl:param>
   <xsl:param name="first_secID">
        <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section'][1]/@xml:id"/>
    </xsl:param>
    <xsl:param name="doi">
        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='DOI']"/>
    </xsl:param>

    <!-- Main selector -->
    <xsl:template match="/">

        <!-- Layout -->
        <!-- Start card -->
        <div class="card">
            <a href="/editions/{ $edition_dir }/">
                <img src="/editions/{ $edition_dir }/thumbnail.png" class="card-img-top" alt="Image for Dicuil, Epistula"/>
            </a>
            <div class="card-body">
                <h5 class="card-title mb-0">
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>,
                    <i><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></i>
                
                </h5>
                <p class="card-text">ed. 
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/> 
                    (<xsl:value-of select="substring(tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/@when, 1, 4)"/>)
                </p>
                <p class="card-text">
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract/tei:p"/>
                </p>
                <p>
                    <a href="/editions/{ $edition_dir }/" class="btn btn-secondary my-2">Introduction</a>
                    <xsl:text> </xsl:text>
                    <a href="/editions/{ $edition_dir }/?sec={ $first_secID }" class="btn btn-secondary my-2">
                        <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section'][1]/@n"/>
                    </a>
                </p>
                <p class="card-text fw-light text-secondary">
                    <a href="https://doi.org/{ $doi }" class="text-secondary">https://doi.org/<xsl:value-of select="$doi"/></a>
                </p>
            </div>
        </div>
        <!-- End card -->
    </xsl:template>

    <xsl:template match="tei:title">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
</xsl:stylesheet>