<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:decimal-format name="deutsch" decimal-separator="," grouping-separator="." />
    
    <!-- Parameter für die Filterkriterien -->
    <xsl:param name="genre" select="''"/>
    <xsl:param name="category" select="''"/>
    <xsl:param name="stichwort" select="''"/>
    
    <xsl:template match="/">
        <html lang="de">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>IMDB Top Movies</title>
                <link rel="stylesheet" href="css/style.css" />
                
            </head>
            <body>
                <h1>IMDB Top Movies</h1>
                
                <!-- Anzeige der aktuellen Suchkriterien und Anzahl der Treffer -->
                <p>
                    Suchkriterien: 
                    <xsl:if test="$genre != ''">Genre: <strong><xsl:value-of select="$genre"/></strong>,</xsl:if>
                    <xsl:if test="$category != ''">Kategorie: <strong><xsl:value-of select="$category"/></strong>,</xsl:if>
                    <xsl:if test="$stichwort != ''">Stichwort: <strong><xsl:value-of select="$stichwort"/></strong></xsl:if>
                    <xsl:if test="$genre = '' and $category = '' and $stichwort = ''">Keine</xsl:if>
                </p>
                <p>
                    Gefundene Filme: 
                    <strong>
                        <xsl:value-of select="count(movies/movie[
                            (contains(genre, $genre) or $genre='') and
                            (category = $category or $category='') and
                            (contains(translate(movie_name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),
                            translate($stichwort, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')) or $stichwort='')
                        ])"/>
                    </strong>
                </p>
                
                <!-- Suchformular -->
                <form action="movie.php" method="get">
                    <!-- Radiobuttons für Genres -->
                    <fieldset>
                        <legend>Genre</legend>
                        <input type="radio" name="genre" id="genre0" value="">
                            <xsl:if test="$genre=''">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                        </input>
                        <label for="genre0">Alle Genres</label>
                        
                        <xsl:for-each select="//genre[not(. = preceding::genre)]">
                            <xsl:sort select="." />
                            <input type="radio" name="genre" id="genre{position()}" value="{.}">
                                <xsl:if test=". = $genre">
                                    <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                            </input>
                            <label for="genre{position()}">
                                <xsl:value-of select="." />
                            </label>
                        </xsl:for-each>
                    </fieldset>
                    
                    <!-- Radiobuttons für Kategorien -->
                    <fieldset>
                        <legend>Kategorie</legend>
                        <input type="radio" name="category" id="category0" value="">
                            <xsl:if test="$category=''">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                        </input>
                        <label for="category0">Alle Kategorien</label>
                        
                        <xsl:for-each select="//category[not(. = preceding::category)]">
                            <xsl:sort select="." />
                            <input type="radio" name="category" id="category{position()}" value="{.}">
                                <xsl:if test=". = $category">
                                    <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                            </input>
                            <label for="category{position()}">
                                <xsl:value-of select="." />
                            </label>
                        </xsl:for-each>
                    </fieldset>
                    
                    <!-- Stichwortsuche -->
                    <label for="stichwort">Stichwort: </label>
                    <input type="text" id="stichwort" name="stichwort" value="{$stichwort}"/>
                    
                    <!-- Such- und Zurücksetzen-Buttons -->
                    <button type="submit">Suchen</button>
                    <button type="reset">Formular zurücksetzen</button>
                </form>
                
                <!-- Anzeige der Suchergebnisse -->
                <xsl:choose>
                    <xsl:when test="movies/movie[
                        (contains(genre, $genre) or $genre='') and
                        (category = $category or $category='') and
                        (contains(translate(movie_name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),
                        translate($stichwort, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')) or $stichwort='')
                    ]">
                        <!-- Tabelle mit den Ergebnissen -->
                        <table id="movie">
                            <thead>
                                <tr>
                                    <th scope="col">Lf.Nu</th>
                                    <th scope="col">Index</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Jahr</th>
                                    <th scope="col">Kategorie</th>
                                    <th scope="col">Laufzeit</th>
                                    <th scope="col">Genre</th>
                                    <th scope="col">IMDB-Bewertung</th>
                                    <th scope="col">Stimmen</th>
                                    <th scope="col">Einnahmen</th>
                                    <th scope="col">Empfehlung</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="movies/movie[
                                    (contains(genre, $genre) or $genre='') and
                                    (category = $category or $category='') and
                                    (contains(translate(movie_name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),
                                    translate($stichwort, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')) or $stichwort='')
                                ]">
                                    <xsl:sort select="imdb_rating" order="descending" data-type="number"/>
                                    <tr>
                                        <td><xsl:value-of select="position()"/></td>
                                        <td><xsl:value-of select="index"/></td>
                                        <td><xsl:value-of select="movie_name"/></td>
                                        <td><xsl:value-of select="year_of_release"/></td>
                                        <td><xsl:value-of select="category"/></td>
                                        <td><xsl:value-of select="run_time_minutes"/></td>
                                        <td>
                                            <xsl:for-each select="genre">
                                                <span>
                                                    <xsl:if test=". = $genre">
                                                        <xsl:attribute name="class">highlight</xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="."/>
                                                </span>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:attribute name="class">
                                                <xsl:choose>
                                                    <xsl:when test="imdb_rating &lt; 7">rating-sehr-schlecht</xsl:when>
                                                    <xsl:when test="imdb_rating &lt; 8">rating-schlecht</xsl:when>
                                                    <xsl:when test="imdb_rating &lt; 9">rating-mittel</xsl:when>
                                                    <xsl:when test="imdb_rating &lt; 10">rating-gut</xsl:when>
                                                    <xsl:otherwise>rating-sehr-gut</xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            <xsl:value-of select="imdb_rating"/>
                                      
                                        </td>
                                        <td><xsl:value-of select="format-number(votes, '#.###.##0', 'deutsch')"/></td>
                                        <td><xsl:value-of select="format-number(gross_total, '#.###.##0,00 €', 'deutsch')"/></td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="run_time_minutes &lt; 100">🍟</xsl:when>
                                                <xsl:when test="run_time_minutes &lt; 130">🍟🍔</xsl:when>
                                                <xsl:when test="run_time_minutese &lt; 150">🍟🍔🌭</xsl:when>
                                                <xsl:when test="run_time_minutes &lt; 170">🍕🍔🍟🌭</xsl:when>
                                                <xsl:when test="run_time_minutes &lt; 200">🍕🍔🍟🌭🍿</xsl:when>
                                                <xsl:otherwise>🍌</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Keine Filme gefunden.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>