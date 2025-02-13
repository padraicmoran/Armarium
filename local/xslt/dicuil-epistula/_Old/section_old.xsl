<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="tei">

    <xsl:param name="sectionNumber" select="1 " />
    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <!-- main selector -->

    <xsl:template match="/">
        <!-- main layout -->
        <div class="row gx-5">
            <div class="col-1"></div>
            <div class="col-md-6 position-relative">
                <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section'][$sectionNumber]" />
            </div>
            <div class="col-md-6">
                <!-- translation -->
            </div>
        </div>

        <!-- apparatus in full -->
        <div id="apparatus">
            <xsl:if test="count(tei:TEI/tei:text/tei:body//tei:div[@type='edition']/tei:div[@type='section'][$sectionNumber]//tei:app) > 0">
                <h3 class="pt-5 pb-2">Apparatus</h3>
                <ul class="list-unstyled">
                    <xsl:apply-templates select="tei:TEI/tei:text/tei:body//tei:div[@type='edition']/tei:div[@type='section'][$sectionNumber]//tei:app" mode="collect-apparatus"/>
                </ul>
            </xsl:if>
        </div>
  
        <!-- notes -->
        <div id="notes">
            <xsl:if test="count(tei:TEI/tei:text/tei:body//tei:div[@type='edition']/tei:div[@type='section'][$sectionNumber]//tei:note) > 0">
                <h3 class="pt-5 pb-2">Notes</h3>
                <ol class="small">
                <xsl:apply-templates select="tei:TEI/tei:text/tei:body//tei:div[@type='edition']/tei:div[@type='section'][$sectionNumber]//tei:note" mode="collect-notes"/>
                </ol>
            </xsl:if>
        </div>

    </xsl:template>

    <!-- structural elements -->

    <xsl:template match="tei:ab|tei:l">
        <span class="text-medium-light fw-light outside-margin float-start"><xsl:value-of select="@n"/></span>
        <span>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span><br/>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:apply-templates/><br/>
        <span class="text-secondary float-end"><xsl:value-of select="@n"/></span>
    </xsl:template>

    <!-- headings -->

    <xsl:template match="tei:body/tei:div/tei:div/tei:div/tei:head">
        <xsl:if test="@n">
            <h4 id="{concat('#intro-', @n)}" 
                class="pt-5 pb-2"><xsl:value-of select="concat(@n, ' ', .)"/></h4>
        </xsl:if>
        <xsl:if test="not(@n)">
            <h4><xsl:value-of select="."/></h4>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:body/tei:div/tei:div/tei:head">
        <xsl:if test="@n">
            <h3 id="{concat('#intro-', @n)}" 
                class="pt-5 pb-2"><xsl:value-of select="concat(@n, ' ', .)"/></h3>
        </xsl:if>
        <xsl:if test="not(@n)">
            <h3><xsl:value-of select="."/></h3>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:body/tei:div/tei:head">
        <h2><xsl:value-of select="."/></h2>
    </xsl:template>

    <!-- inline elements -->

    <xsl:template match="tei:milestone|tei:gb|tei:pb|tei:lb|tei:cb">
        <span class="text-secondary fw-light">|</span>
        <span class="text-secondary fw-light small float-end">
            <xsl:value-of select="@unit"/> 
            <xsl:text> </xsl:text>
            <xsl:value-of select="@n"/>
        </span>
    </xsl:template>

    <xsl:template match="tei:ref">
        <a><xsl:attribute name="href"><xsl:value-of select="@target"></xsl:value-of></xsl:attribute><xsl:apply-templates/></a>
    </xsl:template>

    <xsl:template match="tei:title">
        <i><xsl:apply-templates/></i>
    </xsl:template>

    <!-- notes -->
    <!-- note anchor -->
    <xsl:template match="tei:note">
        <sup class="text-secondary small">
            <a class="text-reset" title="Go to note" data-bs-toggle="tooltip"
            id="note-anchor-{generate-id()}" 
            href="#note-{generate-id()}">[<xsl:number count="tei:note" from="/tei:TEI/tei:text/tei:body/tei:div" level="any" />]</a>
        </sup>
    </xsl:template>

    <!-- note text (for end of document) -->
    <xsl:template match="tei:note" mode="collect-notes">
        <li class="mb-3" id="note-{generate-id()}">
            <a class="text-reset" title="Return to main text" data-bs-toggle="tooltip"
            href="#note-anchor-{generate-id()}">^ </a>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <!-- apparatus -->
    <!-- mouse-over information -->
    <xsl:template match="tei:app">
        <a href="#" class="text-secondary text-decoration-none" data-bs-toggle="tooltip"
            id="app-{generate-id()}">
            <xsl:attribute name="title">Manuscript reading: <xsl:value-of select="tei:rdg"/></xsl:attribute>
            <xsl:apply-templates select="tei:lem"/>
        </a>
    </xsl:template>

    <xsl:template match="tei:lem">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- apparatus in full -->
    <xsl:template match="tei:app" mode="collect-apparatus">
        <li>
            <xsl:value-of select="ancestor::tei:ab[1]/@n"/>
            <xsl:text> </xsl:text>
            <a href="#app-{generate-id()}">
                <xsl:value-of select="tei:lem"/>
            </a>] 
            <xsl:apply-templates select="tei:rdg"/> MS
        </li>
    </xsl:template>

    <!-- MS transcription -->
    <xsl:template match="tei:add"><sup><ins href="#" class="text-reset text-decoration-none" data-bs-toggle="tooltip" title="Secondary addition in MS"><xsl:apply-templates/></ins></sup></xsl:template>
    <xsl:template match="tei:corr"><span class="text-secondary small">(= <a href="#" class="text-reset text-decoration-none" title="Editorial correction" data-bs-toggle="tooltip"><xsl:apply-templates/></a>)</span></xsl:template>
    <xsl:template match="tei:del"><del href="#" class="text-reset text-decoration-line-through"  title="Deleted text" data-bs-toggle="tooltip"><xsl:apply-templates/></del></xsl:template>
    <xsl:template match="tei:ex"><a href="#" class="text-reset text-decoration-none" title="Editorial expansion" data-bs-toggle="tooltip"><i><xsl:apply-templates/></i></a></xsl:template>
    <xsl:template match="tei:expan"><a href="#" class="text-reset text-decoration-none" title="Editorial expansion" data-bs-toggle="tooltip"><i><xsl:apply-templates/></i></a></xsl:template>
    <xsl:template match="tei:g"><span class="border p-1 small text-secondary"><xsl:apply-templates/></span></xsl:template>  
    <xsl:template match="tei:gap"><span class="text-secondary">[<a href="#" class="text-reset text-decoration-none" data-bs-toggle="tooltip"><xsl:attribute name="title">Gap in transcription: <xsl:value-of select="@extent"/> <xsl:value-of select="@reason"/></xsl:attribute>...</a>]</span></xsl:template>
    <xsl:template match="tei:lb"><span class="text-secondary small">|</span></xsl:template>
    <xsl:template match="tei:sic"><xsl:apply-templates/><span class="text-secondary small"> (<i>sic</i>)</span></xsl:template>
    <xsl:template match="tei:space"><span class="text-secondary">[<a href="#" class="text-reset text-decoration-none" data-bs-toggle="tooltip"><xsl:attribute name="title">Space left in MS: <xsl:value-of select="@extent"/></xsl:attribute>_</a>]</span> </xsl:template>
    <xsl:template match="tei:supplied"><span class="text-secondary">&lt;<a href="#" class="text-reset text-decoration-none" title="Text supplied by editor" data-bs-toggle="tooltip"><xsl:apply-templates/></a>&gt;</span></xsl:template>
    <xsl:template match="tei:surplus"><span class="text-secondary small">(</span><a href="#" class="text-reset text-decoration-none" title="Text marked as redundant by editor" data-bs-toggle="tooltip"><xsl:apply-templates/></a><span class="text-secondary">)</span></xsl:template>
    <xsl:template match="tei:unclear"><span class="text-secondary small">[</span><a href="#" class="text-reset text-decoration-none" title="Reading unclear" data-bs-toggle="tooltip"><xsl:apply-templates/><span class="text-secondary"><sup>?</sup></span></a><span class="text-secondary small">]</span></xsl:template>
   
</xsl:stylesheet>
<!-- 
To do:
Notes
Cross-references

-->