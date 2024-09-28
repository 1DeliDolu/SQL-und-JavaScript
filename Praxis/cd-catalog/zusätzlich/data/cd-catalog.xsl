<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html lang="de">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CD-Catalog</title>
        <link rel="stylesheet" href="../css/stylesheet.css"/>
      </head>
      <body>
        <h1>CD-Catalog</h1>
        <!-- <xsl:value-of select="CATALOG/CD/TITLE"/> -->
        <!-- <ul>
  <xsl:for-each select="CATALOG/CD">
    <li><xsl:value-of select="TITLE"/>, <xsl:value-of select="ARTIST"/></li>
  </xsl:for-each>
</ul>
-->
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
          <xsl:for-each select="CATALOG/CD">
            <!--xsl:sort select="ARTIST" order="ascending"></xsl:sort-->
            <xsl:sort select="PRICE" order="ascending" data-type="number"></xsl:sort>


            <tr>
              <td>
                <xsl:value-of select="position()"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="ARTIST"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="TITLE"></xsl:value-of>
              </td>
              <td>
                <!--xsl:value-of select="COUNTRY"></xsl:value-of-->
                <img src="../img/{COUNTRY}.svg" alt="{COUNTRY}"/>
              </td>
              <td>
                  <xsl:value-of select="COMPANY"></xsl:value-of>
                </td>
                <td>
                <xsl:value-of select="PRICE"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="YEAR"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="NOTES">"Kommt noch"</xsl:value-of>
              </td>
            </tr> 
          </xsl:for-each>
        </tbody>
      </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>