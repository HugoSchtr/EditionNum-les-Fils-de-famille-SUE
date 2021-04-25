<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">


    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'SUE_les_fils_de_famille.xml', '')"/>
        </xsl:variable>

        <xsl:variable name="path_homepage">
            <xsl:value-of select="concat($witfile, 'html/homepage', '.html')"/>
        </xsl:variable>

        <xsl:variable name="path_pers_index">
            <xsl:value-of select="concat($witfile, 'html/pers_index', '.html')"/>
        </xsl:variable>

        <xsl:variable name="path_place_index">
            <xsl:value-of select="concat($witfile, 'html/place_index', '.html')"/>
        </xsl:variable>

        <xsl:variable name="path_relationships">
            <xsl:value-of select="concat($witfile, 'html/relationships', '.html')"/>
        </xsl:variable>

        <xsl:variable name="path_transcription">
            <xsl:value-of select="concat($witfile, 'html/transcription', '.html')"/>
        </xsl:variable>

        <xsl:variable name="path_original_edition">
            <xsl:value-of select="concat($witfile, 'html/original_edition', '.html')"/>
        </xsl:variable>

        <xsl:variable name="path_about">
            <xsl:value-of select="concat($witfile, 'html/about', '.html')"/>
        </xsl:variable>

        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="description"
                    content="Projet d'édition numérique du roman-feuilleton les Fils de famille d'Eugène Sue (1856)"/>
                <meta name="keywords" content="edition, tei, xslt, roman-feuilleton"/>
                <meta name="author" content="Hugo Scheithauer"/>
                <title>
                    <xsl:value-of
                        select="concat(//sourceDesc//titleStmt/title, ', ', //sourceDesc//forename, ' ', //sourceDesc//surname)"
                    />
                </title>
                <link
                    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                    crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"/>
            </head>
        </xsl:variable>

        <xsl:variable name="nav_bar">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between">
                <a class="navbar-brand" style="padding-left: 5px" href="{$path_homepage}">
                    <xsl:value-of
                        select="concat(//sourceDesc//titleStmt/title, ', ', //sourceDesc//forename, ' ', //sourceDesc//surname)"
                    />
                </a>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_original_edition}">Edition d'origine</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_transcription}">Transcription</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_pers_index}">Index des personnages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_place_index}">Index des noms de lieux</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_relationships}">Relations entre les
                            personnages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_about}">A propos</a>
                    </li>
                </ul>
            </nav>
        </xsl:variable>

        <xsl:variable name="footer">
            <footer class="text-center text-white" style="background-color: #f1f1f1;">
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    <p>Hugo Scheithauer - 2021</p>
                </div>
            </footer>
        </xsl:variable>

        <xsl:result-document href="{$path_homepage}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div style="padding: 20px;">
                        <img class="rounded mx-auto d-block"
                            src="../image/illustration_fils_de_famille_p1.png"
                            style="width: 38rem; height: auto"/>
                    </div>
                    <div class="container">
                        <div style="text-align: center; padding-top: 20px;">
                            <p>Bienvenue dans ce projet d'édition numérique du roman-feuilleton
                                    <i>Les Fils de famille</i> d'Eugène SUE (1856).</p>
                            <p>
                                <xsl:value-of select="//encodingDesc"/>
                            </p>
                            <p>Ce projet présente les pages 2 à 5 du roman. La numérisation est
                                disponible sur <a
                                    href="https://gallica.bnf.fr/accueil/en/content/accueil-en?mode=desktop"
                                    >Gallica</a> à cette <a
                                    href="{//sourceDesc//publicationStmt/distributor/@facs}"
                                    >adresse</a>.</p>
                            <p>Cette édition propose d'enrichir la lecture de l'oeuvre originale en
                                donnant des informations sur les personnages et leurs relations.</p>
                            <p>Vous pouvez naviguer à travers le projet grâce à la barre de
                                navigation en haut de cette page. Bonne visite !</p>
                        </div>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

        <xsl:result-document href="{$path_pers_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>

                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

        <xsl:result-document href="{$path_place_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <ul>
                        <xsl:call-template name="place_index"/>
                    </ul>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

        <xsl:result-document href="{$path_original_edition}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <ul>
                        <li>Titre : <xsl:value-of select="//biblFull/titleStmt/title"/></li>
                        <li>Auteur : <xsl:value-of
                                select="concat(//biblFull/titleStmt//forename, ' ', //biblFull/titleStmt//surname)"
                            /></li>
                        <li>Maison d'édition : <xsl:value-of
                                select="concat(//biblFull/publicationStmt/publisher, ' (', //biblFull//settlement, ', ', //biblFull//postCode, ', ', //biblFull//street, ')')"
                            /></li>
                        <li>Date d'édition : <xsl:value-of select="//biblFull//date"/></li>
                        <li>Mise à disposition par : <a href="{//biblFull//distributor/@facs}"
                                    ><xsl:value-of select="//biblFull//distributor"/></a></li>
                    </ul>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

    </xsl:template>

    <xsl:template name="pers_index">
        <xsl:for-each select="//listPerson/person">
            <li>
                <xsl:value-of select="concat(persName, ' : ', note)"/>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="place_index">
        <xsl:for-each select="//listPlace/place">
            <li>
                <xsl:value-of select="placeName//name"/>

                <xsl:choose>
                    <xsl:when test="placeName//region != 'none'">
                        <xsl:value-of select="concat(', ', placeName//region)"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="note">
                        <xsl:value-of select="concat(' : ', note)"/>
                    </xsl:when>
                </xsl:choose>
            </li>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
