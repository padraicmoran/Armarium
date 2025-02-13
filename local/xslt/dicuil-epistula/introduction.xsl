<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="tei">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <!-- Main selector -->
    <xsl:template match="/">
        <!-- Layout -->
		<div class="row gx-3">
            <div class="col-lg-8 pb-5">

                <!-- Main header -->
                <h2 class="mb-5"><xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='introduction']//tei:head"/></h2>

                <!-- TOC -->
                <div class="toc">
                    <ul class="list-unstyled">
                        <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='introduction']//tei:div/tei:head" mode="toc"/>
                    </ul>
                </div>

                <!-- Main content-->
                <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='introduction']" />

                <!-- Notes -->
                <xsl:if test="count(tei:TEI/tei:text/tei:body//tei:div[@type='introduction']//tei:note) > 0">
                    <h3 class="pt-5 pb-2">Notes</h3>
                    <ol class="small">
                    <xsl:apply-templates select="tei:TEI/tei:text/tei:body//tei:div[@type='introduction']//tei:note" mode="collect-notes"/>
                    </ol>
                </xsl:if>

                <!-- Link -->
                <div class="mt-5 pt-3 border-top d-print-none">
                    <a class="btn btn-secondary my-2">
                        <xsl:attribute name="href">?sec=<xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section'][1]/@xml:id"></xsl:value-of></xsl:attribute>
                        <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section'][1]/@n"/> →
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>

    <!-- Main structural elements -->
    <xsl:template match="tei:p">
        <p>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <p class="hanging-indent">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Headings -->
    <xsl:template match="tei:body/tei:div/tei:div/tei:div/tei:head">
        <xsl:if test="@n">
            <h4 id="{concat('intro-', @n)}"
                class="pt-5 pb-2"><xsl:value-of select="concat(@n, ' ', .)"/></h4>
        </xsl:if>
        <xsl:if test="not(@n)">
            <h4><xsl:value-of select="."/></h4>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:body/tei:div/tei:div/tei:head">
        <xsl:if test="@n">
            <h3 id="{concat('intro-', @n)}"
                class="pt-5 pb-2"><xsl:value-of select="concat(@n, ' ', .)"/></h3>
        </xsl:if>
        <xsl:if test="not(@n)">
            <h3><xsl:value-of select="."/></h3>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:body/tei:div/tei:head">
        
    </xsl:template>

    <!-- Inline elements -->
    <xsl:template match="tei:ref">
        <xsl:param name="targetID" select="substring-after(@target, '#')"/>
        <a data-bs-toggle="tooltip">
            <xsl:choose>
                <!-- external URL -->
                <xsl:when test="starts-with(@target, 'http://') or starts-with(@target, 'https://')">
                    <xsl:attribute name="title">External link</xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                </xsl:when>
                <!-- internal cross-reference -->
                <xsl:otherwise>
                    <xsl:attribute name="href">?sec=<xsl:value-of select="//.[@xml:id=$targetID]/ancestor::tei:div/@xml:id"/><xsl:value-of select="@target"/></xsl:attribute>
                    <!-- the section ID locator above will return empty when the target is in the introduction, but the link will still work fine -->

                    <!-- Special mouseover for bibliographical refs -->
                    <xsl:if test="//tei:bibl[@xml:id=$targetID]">
                        <xsl:attribute name="title">
                            <xsl:value-of select="//tei:bibl[@xml:id=$targetID]"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <!-- process rest of text within link -->
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="tei:foreign|tei:title">
        <i><xsl:apply-templates/></i>
    </xsl:template>

    <!-- TOC item template -->
    <xsl:template match="tei:head" mode="toc">
        <li>
            <xsl:choose>
                <xsl:when test="@n">
                    <a href="{concat('#intro-', @n)}"><xsl:value-of select="concat(@n, ' ', .)"/></a>
                </xsl:when>
                <xsl:otherwise>
                    <a href="{concat('#', generate-id())}"><xsl:value-of select="."/></a>
                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

    <!-- Notes -->
    <!-- Note anchor -->
    <xsl:template match="tei:note">
        <sup class="text-secondary small">
            <a class="text-reset" title="Go to note" data-bs-toggle="tooltip"
            id="note-anchor-{generate-id()}" 
            href="#note-{generate-id()}">[<xsl:number count="tei:note" from="/tei:TEI/tei:text/tei:body/tei:div" level="any" />]</a>
        </sup>
    </xsl:template>

    <!-- Note text (for end of document) -->
    <xsl:template match="tei:note" mode="collect-notes">
        <li class="mb-3" id="note-{generate-id()}">
            <a class="text-reset" title="Return to main text" data-bs-toggle="tooltip"
            href="#note-anchor-{generate-id()}">^ </a>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>