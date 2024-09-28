<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0">
<xsl:output method="html"
    doctype-system="about:legacy-compat"
    encoding="UTF-8"
    indent="yes" />
<xsl:decimal-format
  name="de"
  decimal-separator=","
  grouping-separator="."
/>  
<xsl:param name="suchgenre"></xsl:param>
<xsl:param name="stichwort"></xsl:param>
<xsl:param name="suchpfad" 
  select="catalog/book[starts-with(genre,$suchgenre) and 
    contains(translate(., 'abcdefghijklmnopqrstuvwxyzäöü', 
    'ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ'), $stichwort)]"/>
<xsl:param name="anztreffer" select="count($suchpfad)"/>
<xsl:template match="/">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Buchkatalog</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="books.css" />
  </head>
  <body>
    <h1>Hier kommt der Buchkatalog</h1>
    <form action="index.php" method="post">
      <fieldset>
        <legend>Suche im Buchkatalog</legend>
        <label for="stichwort">Stichwort: </label> 
        <input type="text" name="stichwort" 
          id="stichwort" value="{$stichwort}"/>
        <br/>
        <label for="suchgenre">Genre Auswahl: </label>
        <select name="suchgenre" id="suchgenre">
          <option value="">Alle Genres</option>
          <xsl:for-each select="catalog/book">
            <xsl:sort select="genre"/>
          <xsl:if test="not(preceding-sibling::book/genre=genre)">
            <option><xsl:if test="genre=$suchgenre">
              <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if><xsl:value-of select="genre"/></option>
          </xsl:if>
          </xsl:for-each>
        </select>
        <br/>
        <input type="submit" value="Suchen"/>
      </fieldset>  
    </form>
  <xsl:if test="$anztreffer = 0">
    <p>Ihre Suche nach
      Genre <strong><xsl:value-of select="$suchgenre"/></strong>, 
      Stichwort <strong><xsl:value-of select="$stichwort"/></strong>
      ergab leider keine Treffer.
    </p>
  </xsl:if>    
  <xsl:if test="$anztreffer &gt; 0">   
    <p>Das Suchergebnis Ihrer Suche nach 
    Genre <strong><xsl:value-of select="$suchgenre"/></strong>, 
    Stichwort <strong><xsl:value-of select="$stichwort"/></strong>
    enthält <strong><xsl:value-of select="$anztreffer"/></strong> Bücher.</p>
    <!-- 
         Shortcut für Tabellenstruktur für 7 Spalten
         Lfd-Nr ID Autor Titel Genre Preis Datum
         table[border=1]>(thead>tr>th[scope=col]*7)+(tbody>tr>td*7)          
    -->
    <table border="1">
      <thead>
        <tr>
          <th scope="col">Lfd-Nr</th>
          <th scope="col">ID</th>
          <th scope="col">Autor</th>
          <th scope="col">Titel</th>
          <th scope="col">Genre</th>
          <th scope="col">Preis</th>
          <th scope="col">Datum</th>
        </tr>
      </thead>
      <tbody>
      <xsl:for-each select="$suchpfad">
        <tr>
          <td><xsl:value-of select="position()"/></td>
          <td><xsl:value-of select="@id"/></td>
          <td><xsl:value-of select="author"/></td>
          <td><xsl:value-of select="title"/></td>
          <td><xsl:value-of select="genre"/></td>
          <td><xsl:value-of select="format-number(price, '#.##0,00', 'de')"/></td>
          <td><xsl:value-of select="publish_date"/></td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:if>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>