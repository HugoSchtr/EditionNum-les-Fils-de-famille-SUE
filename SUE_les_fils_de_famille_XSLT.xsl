<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
<!-- Exclusion des préfixes TEI avec exclude-result-prefixes -->

<!-- On configure l'output HTML, avec indentation automatique et encodage en UTF-8 -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/> 

<!-- On évite les espaces non voulus -->
    <xsl:strip-space elements="*"/>

<!-- On configure les sorties HTML -->

    <xsl:template match="/">
        <!-- On stocke le nom le chemin du fichier courant -->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'SUE_les_fils_de_famille.xml', '')"/>
        </xsl:variable>

<!-- Pour chaque output HTML de l'édition numérique, on crée une variable qui stocke le chemin de l'output, en concaténant la variable witfile crée précédemment. -->
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
        
        <!-- BRIQUES DE CONSTRUCTION DES PAGES HTML -->
        
        <!-- On crée le head HTML -->
        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="description"
                    content="Projet d'édition numérique du roman-feuilleton les Fils de famille d'Eugène Sue (1856)"/>
                <meta name="keywords" content="edition, tei, xslt, roman-feuilleton"/>
                <meta name="author" content="Hugo Scheithauer"/>
                <title>
                    <!-- On récupère le titre de l'oeuvre littéraire encodée directement dans le XML source -->
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

<!-- On crée une barre de navigation -->
        <xsl:variable name="nav_bar">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between">
                <a class="navbar-brand" style="padding-left: 5px" href="{$path_homepage}">
                    <!-- On récupère le prénom et nom de l'auteur, et le titre de l'oeuvre dans la source XML -->
                    <xsl:value-of
                        select="concat(//sourceDesc//titleStmt/title, ', ', //sourceDesc//forename, ' ', //sourceDesc//surname)"
                    />
                </a>
                <!-- Pour chaque output HTML, on crée un lien de navigation dans la barre de navigation -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <!-- On récupère une variable entre {}. Les variables suivantes étant les chemins de fichier des différents outputs. -->
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

<!-- On crée un footer pour la mise en page -->
        <xsl:variable name="footer">
            <footer class="text-center text-white" style="background-color: #f1f1f1;">
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    <p>Hugo Scheithauer - 2021</p>
                </div>
            </footer>
        </xsl:variable>

<!-- Avec xsl:result-document, on écrit les règles de transformation pour les output -->
        <!-- Ici, on crée l'output HTML correspondant à la page d'accueil. -->
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
                            <!-- Pour créer un lien renvoyant à l'édition d'origine sur Gallica, on récupère l'attribut @facs de <distributor> dans la source XML, et on l'injecte comme attribut HTML dans la balise <a> grâce aux {} -->
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

<!-- On crée l'index des personnages -->
        <xsl:result-document href="{$path_pers_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1>Index des noms de personnages</h1>
                        <ul>
                            <!-- On appelle une xsl:template créée plus bas. -->
                            <xsl:call-template name="pers_index"/>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

        <xsl:result-document href="{$path_place_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1>Index des noms de lieux</h1>
                        <ul>
                            <xsl:call-template name="place_index"/>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

        <xsl:result-document href="{$path_original_edition}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1>Informations bibligraphiques de l'édition d'origine</h1>
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
                    </div>    
                    <div class="container">
                        <h1>Localisation de l'extrait dans l'oeuvre originale</h1>
                        <ul>
                            <li>Partie : <xsl:value-of select="//biblFull/seriesStmt/biblScope[@unit = 'part']"/></li>
                            <li>Chapitre : <xsl:value-of select="//biblFull/seriesStmt/biblScope[@unit = 'chapter']"/></li>
                            <li>Pages : <xsl:value-of select="//biblFull/seriesStmt/biblScope[@unit = 'page']"/></li>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_transcription}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                            <xsl:call-template name="transcription"/>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>            
        </xsl:result-document>

    </xsl:template>

<!-- Templates -->

<!-- Template d'affichage de l'index des personnages -->
    <xsl:template name="pers_index">
        <!-- On écrit une boucle for-each pour pouvoir trier par ordre alphabétique les personnages avec xsl:sort -->
        <xsl:for-each select="//listPerson/person">
            <xsl:sort select="./persName" order="ascending"/>
            <li>
                <xsl:value-of select="concat(persName, ' : ', note)"/>
            </li>
        </xsl:for-each>
    </xsl:template>

<!-- Template d'affichage de l'index des noms de lieux -->
    <xsl:template name="place_index">
        <!-- On utilise une boucle for-each pour pouvoir créer une mise en page en fonction des informations disponibles pour chaque lieu. -->
        <xsl:for-each select="//listPlace/place">
            <xsl:sort select=".//name"/>
            <li>
                <xsl:value-of select="placeName//name"/>

                <xsl:value-of select="concat(' (', @type, ')')"/>

<!-- Si le lieu a une information de région (!= 'none', dans l'encodage XML), on la récupère, sinon, on ne fait rien.. -->
                <xsl:if test="placeName//region != 'none'">
                    <xsl:value-of select="concat(', ', placeName//region)"/>
                </xsl:if>

<!-- Si le lieu a une information de note, on la récupère. Sinon, on met directement un '.' -->
                <xsl:choose>
                    <xsl:when test="note">
                        <xsl:value-of select="concat(' : ', note)"/>
                    </xsl:when>
                    <xsl:otherwise>.</xsl:otherwise>
                </xsl:choose>
            </li>
        </xsl:for-each>
    </xsl:template>
      
    <xsl:template name="transcription" match="//body">
        
        <xsl:element name="h1">
            <xsl:attribute name="class">text-center</xsl:attribute>
            <xsl:value-of select="descendant::div[1]/head"/>
        </xsl:element>
        
        <xsl:element name="h2">
            <xsl:attribute name="class">text-center</xsl:attribute>
            <xsl:value-of select="descendant::div[2]/head"/>
        </xsl:element>
        
        <xsl:for-each select="descendant::div[2]/div">
            
            <xsl:element name="h3">
                <xsl:attribute name="class">text-center</xsl:attribute>
                <xsl:value-of select="./head"/>
            </xsl:element>
            
            <xsl:element name="p">
                <xsl:apply-templates select="p"/>
            </xsl:element>
            
            <xsl:if test=".//gap">
                <xsl:element name="p">
                    <xsl:attribute name="class">text-danger</xsl:attribute>
                    <u>                Manque dans la version numérisée : <xsl:value-of select="//gap/desc"/></u>
                </xsl:element>
                
            </xsl:if>
        </xsl:for-each>
        
    </xsl:template>

    <xsl:template match="emph[@rend = 'italic']">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
