<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0">
<xsl:output method="html"
	doctype-system="about:legacy-compat"
	encoding="UTF-8"
	indent="yes" />
<xsl:decimal-format name="deutsch" decimal-separator="," grouping-separator="."/>
<xsl:param name="country"></xsl:param>
<xsl:param name="suchpfad" select="CATALOG/CD[starts-with(COUNTRY, $country)]"/>
<xsl:template match="/">
<html lang="de">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CD-Catalog</title>
    <link rel="stylesheet" href="css/stylesheet.css" />
  </head>
  <body>
    <h1>CD-Catalog</h1>
    <p>Ich habe <strong>
      <xsl:value-of select="count($suchpfad)"/>
    </strong> CDs.</p>
    <!-- table>(thead>tr>th[scope=col]*8)+(tbody>each>tr>td*8>val) -->

    <table>
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Artist</th>
          <th scope="col">Title</th>
          <th scope="col">Country</th>
          <th scope="col">Company</th>
          <th scope="col">Price</th>
          <th scope="col">Year</th>
          <th scope="col">Notes</th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="$suchpfad">
          <xsl:sort select="COUNTRY" order="descending"/>
          <xsl:sort select="PRICE" order="ascending" data-type="number"/>
          <tr>
            <xsl:attribute name="class"><xsl:choose>
              <xsl:when test="PRICE &lt; 8.50">billig</xsl:when>
              <xsl:when test="PRICE &lt;= 10">ok</xsl:when>
              <xsl:otherwise>teuer</xsl:otherwise>
            </xsl:choose></xsl:attribute>
            <td>
              <xsl:value-of select="position()"/>
            </td>
            <td>
              <xsl:value-of select="ARTIST"/>
            </td>
            <td>
              <xsl:value-of select="TITLE"/>
            </td>
            <td>
              <!-- <xsl:if test="COUNTRY !='USA' and COUNTRY !='UK' and COUNTRY !='EU'"> -->
              <xsl:if test="not(COUNTRY = 'USA' or COUNTRY = 'UK' or COUNTRY = 'EU')">
                  <xsl:attribute name="class">exotisch</xsl:attribute>
              </xsl:if>
              <!-- <xsl:value-of select="COUNTRY"/> -->
               <img src="img/{COUNTRY}.svg" alt="{COUNTRY} Flagge"/>
            </td>
            <td>
              <xsl:value-of select="COMPANY"/>
            </td>
            <td>
              <xsl:value-of select="format-number(PRICE, '#.##0,00 €', 'deutsch')"/>
            </td>
            <td>
              <xsl:value-of select="YEAR"/>
            </td>
            <td>
              <xsl:if test="COUNTRY !='USA' and COUNTRY !='UK' and COUNTRY !='EU'">Exot! - </xsl:if>
              <xsl:choose>
                <xsl:when test="PRICE &lt; 8.50">billig</xsl:when>
                <xsl:when test="PRICE &lt;= 10">ok</xsl:when>
                <xsl:otherwise>teuer</xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>

  </body>
</html>
</xsl:template>
</xsl:stylesheet>