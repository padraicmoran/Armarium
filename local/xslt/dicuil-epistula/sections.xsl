<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="tei">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <!-- Main selector -->

    <xsl:template match="/">
        <!-- Iterate through each section -->
        <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@type='section']">
            <!-- Separate file for each section -->
            <xsl:result-document href="output/content/{@xml:id}.htm">
                <!-- Main layout -->
                <div class="row gx-5">
                    <div class="col-1"></div>
                    <div class="col-md-8 position-relative">
                        <xsl:apply-templates select="*"/>
                    </div>
                    <div class="col-md-4">
                        <!-- Translation -->
                    </div>
                </div>

                <!-- Apparatus in full -->
                <div id="apparatus">
                    <xsl:if test="count(.//tei:app) > 0">
                        <h3 class="h4 pt-5 pb-2">Apparatus</h3>
                        <ul class="list-unstyled small">
                            <xsl:apply-templates select=".//tei:app" mode="collect-apparatus"/>
                        </ul>
                    </xsl:if>
                </div>
        
                <!-- Notes -->
                <div id="notes">
                    <xsl:if test="count(.//tei:note) > 0">
                        <h3 class="h4 pt-5 pb-2">Notes</h3>
                        <ol class="small">
                            <xsl:apply-templates select=".//tei:note" mode="collect-notes"/>
                        </ol>
                    </xsl:if>
                </div>

                <!-- Links-->
                <div class="mt-5 pt-3 border-top d-print-none">
                    <!-- If in first section, link back to intro -->
                    <xsl:if test="position() = 1">
                        <a href="./" class="btn btn-secondary my-2">
                            ← Introduction
                        </a>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <!-- If after first section, link to previous section -->
                    <xsl:if test="position() > 1">
                        <a class="btn btn-secondary my-2">
                            <xsl:attribute name="href">?sec=<xsl:value-of select="preceding-sibling::tei:div[@type='section'][1]/@xml:id"></xsl:value-of></xsl:attribute>
                            ← <xsl:value-of select="preceding-sibling::tei:div[@type='section'][1]/@n"/>
                        </a>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <!-- If not at end, link to next section-->
                    <xsl:if test="position() != last()">
                        <a class="btn btn-secondary my-2">
                            <xsl:attribute name="href">?sec=<xsl:value-of select="following-sibling::tei:div[@type='section'][1]/@xml:id"></xsl:value-of></xsl:attribute>
                            <xsl:value-of select="following-sibling::tei:div[@type='section'][1]/@n"/> →
                        </a>
                    </xsl:if>

                </div>

            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <!-- Structural elements -->

    <xsl:template match="tei:ab|tei:l">
        <span class="text-medium-light fw-light outside-margin float-start"><xsl:value-of select="@n"/></span>
        <span>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span><br/>
    </xsl:template>

    <xsl:template match="tei:lg">
        <p>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <span class="text-medium-light fw-light outside-margin float-start"><xsl:value-of select="@n"/></span>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Headings -->
    <!-- h4: content subsection (presumably intro only) -->
    <xsl:template match="tei:body/tei:div/tei:div/tei:div/tei:head">
        <xsl:if test="@n">
            <h4 id="{concat('#intro-', @n)}" 
                class="pt-5 pb-2"><xsl:value-of select="concat(@n, ' ', .)"/></h4>
        </xsl:if>
        <xsl:if test="not(@n)">
            <h4><xsl:value-of select="."/></h4>
        </xsl:if>
    </xsl:template>

    <!-- h3: content section (intro or edition) -->
    <xsl:template match="tei:body/tei:div/tei:div/tei:head">
        <xsl:if test="@n"><!-- presumably intro if numbered -->
            <h3 id="{concat('#intro-', @n)}" 
                class="pt-5 pb-2"><xsl:value-of select="concat(@n, ' ', .)"/></h3>
        </xsl:if>
        <xsl:if test="not(@n)"><!-- intro or edition; allow apply-templates for MS mark-up -->
            <h3><xsl:apply-templates/></h3>
        </xsl:if>
    </xsl:template>

    <!-- h2: introduction heading -->
    <xsl:template match="tei:body/tei:div/tei:head">
        <h2><xsl:value-of select="."/></h2>
    </xsl:template>

    <!-- Inline elements -->

    <xsl:template match="tei:milestone|tei:gb|tei:pb|tei:lb|tei:cb">
        <!-- Get siglum for any MS witness referenced -->
        <xsl:param name="msID" select="substring-after(@source, '#')"/>
         
        <span class="text-secondary fw-light">|</span>
        <!-- Add link if provided -->
        <span class="text-secondary fw-light small float-end">
            <a data-bs-toggle="tooltip">
                <!-- tooltip with MS details-->
                <xsl:if test="$msID != ''">
                    <xsl:attribute name="title">
                        <xsl:value-of select="//tei:msDesc[@xml:id=$msID]/tei:msIdentifier/tei:settlement"/>,
                        <xsl:value-of select="//tei:msDesc[@xml:id=$msID]/tei:msIdentifier/tei:institution"/>,
                        <xsl:value-of select="//tei:msDesc[@xml:id=$msID]/tei:msIdentifier/tei:idno"/>
                    </xsl:attribute>
                </xsl:if>
                <!-- link to image where provided -->
                <xsl:if test="@facs">
                    <xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                </xsl:if>
                <xsl:if test="not(@facs)">
                    <xsl:attribute name="href">javascript:void</xsl:attribute>
                    <xsl:attribute name="class">text-reset text-decoration-none</xsl:attribute>
                </xsl:if>
                <!-- text -->
                <xsl:value-of select="@unit"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:if test="$msID != ''">
                    <xsl:text> </xsl:text>
                    (<xsl:value-of select="//tei:msDesc[@xml:id=$msID]/@n"/>)
                </xsl:if>
            </a>
        </span>
    </xsl:template>

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

    <!-- Notes -->
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
            <xsl:attribute name="value"><xsl:number count="tei:note" from="/tei:TEI/tei:text/tei:body/tei:div" level="any" /></xsl:attribute>
            <a class="text-reset" title="Return to main text" data-bs-toggle="tooltip"
            href="#note-anchor-{generate-id()}">^ </a>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <!-- Apparatus -->
    <!-- mouse-over information -->
    <xsl:template match="tei:app">
        <a href="javascript:void(0);" class="text-secondary text-decoration-none" data-bs-toggle="tooltip"
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
    <xsl:template match="tei:add"><sup><ins href="javascript:void(0);" class="text-reset text-decoration-none" data-bs-toggle="tooltip" title="Secondary addition in MS"><xsl:apply-templates/></ins></sup></xsl:template>
    <xsl:template match="tei:corr"><span class="text-secondary small">(= <a href="javascript:void(0);" class="text-reset text-decoration-none" title="Editorial correction" data-bs-toggle="tooltip"><xsl:apply-templates/></a>)</span></xsl:template>
    <xsl:template match="tei:del"><del href="javascript:void(0);" class="text-reset text-decoration-line-through"  title="Text cancelled in manuscript" data-bs-toggle="tooltip"><xsl:apply-templates/></del></xsl:template>
    <xsl:template match="tei:ex|tei:expan"><a href="javascript:void(0);" class="text-reset text-decoration-none" title="Editorial expansion" data-bs-toggle="tooltip"><i><xsl:apply-templates/></i></a></xsl:template>
    <xsl:template match="tei:g"><span class="border p-1 small text-secondary"><xsl:apply-templates/></span></xsl:template>  
    <xsl:template match="tei:gap"><span class="text-secondary">[<a href="javascript:void(0);" class="text-reset text-decoration-none" data-bs-toggle="tooltip"><xsl:attribute name="title">Gap in editorial transcription: <xsl:value-of select="@extent"/> <xsl:value-of select="@reason"/></xsl:attribute>...</a>]</span></xsl:template>
    <xsl:template match="tei:lb"><span class="text-secondary small">|</span></xsl:template>
    <xsl:template match="tei:sic"><xsl:apply-templates/><span class="text-secondary small"> (<i>sic</i>)</span></xsl:template>
    <xsl:template match="tei:space"><span class="text-secondary">[<a href="javascript:void(0);" class="text-reset text-decoration-none" data-bs-toggle="tooltip"><xsl:attribute name="title">Space left in MS: <xsl:value-of select="@extent"/></xsl:attribute>_</a>]</span> </xsl:template>
    <xsl:template match="tei:supplied"><span class="text-secondary">&lt;<a href="javascript:void(0);" class="text-reset text-decoration-none" title="Text supplied by editor" data-bs-toggle="tooltip"><xsl:apply-templates/></a>&gt;</span></xsl:template>
    <xsl:template match="tei:surplus"><span class="text-secondary small">(</span><a href="javascript:void(0);" class="text-reset text-decoration-none" title="Text marked as redundant by editor" data-bs-toggle="tooltip"><xsl:apply-templates/></a><span class="text-secondary">)</span></xsl:template>
    <xsl:template match="tei:unclear"><span class="text-secondary small">[</span><a href="javascript:void(0);" class="text-reset text-decoration-none" title="Reading unclear" data-bs-toggle="tooltip"><xsl:apply-templates/><span class="text-secondary"><sup>?</sup></span></a><span class="text-secondary small">]</span></xsl:template>
   
</xsl:stylesheet>