<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="tei">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <!-- Main selector -->
    <xsl:template match="/">
        <!-- Layout -->
        <div class="container py-5 px-3 mb-5">
            <!-- Page title -->
            <h1 class="h2 fw-light">
                <a href="./" class="text-reset text-decoration-none">
                <strong>
                    <!-- text autor -->
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>, 
                    <!-- text title-->
                    <i><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></i>
                </strong>
                
                </a>
            </h1>
            <!-- Citation -->
            <div>
                <!-- text editor -->
                <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/> (ed.), 
                <!-- text author-->
                <i><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>: 
                <!-- text title -->
                <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></i>, 
                in <i>Armarium Digital Editions</i> 
                <!-- publication year -->
                (<xsl:value-of select="substring(tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/@when, 1, 4)"/>),
                <!-- DOI -->
                DOI: 
                <a>
                    <xsl:attribute name="href">https://doi.org/<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='DOI']"/></xsl:attribute>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='DOI']"/>
                </a>
            </div>
            <!-- Info and links -->
            <ul class="mt-2 d-flex flex-column flex-lg-row gap-lg-4 small link-list">
                <li>Published <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/></li>
                <li class="d-print-none"><a href="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='URL']}">Persistent URL</a></li>
                <li class="d-print-none"><a href="https://doi.org/{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='DOI']}">DOI</a></li>
                <li class="d-print-none"><a href="/data/{tei:TEI/@xml:id}.xml">Download TEI XML</a></li>
                <li class="d-print-none"><a href="{tei:TEI/@xml:id}.pdf">Download PDF</a></li>
                <li class="d-print-none"><a target="_blank" href="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability//tei:ref/@target}">Licence</a></li>
            </ul>

            <form method="get" id="formTOC" class="mt-3 col-lg-6 d-print-none">
                <div class="form-floating">
                    <select name="sec" id="selectTOC" class="form-select form-select-lg" aria-label="Select section">
                        <option>Introduction</option>
                        <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section']">
                            <option>
                                <xsl:attribute name="value"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                <xsl:value-of select="@n"/>
                            </option>
                        </xsl:for-each>
                    </select>
                    <label for="selectTOC" class="small">Current section</label>
                </div>
            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>