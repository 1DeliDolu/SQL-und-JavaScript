<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0">
  <xsl:output method="html"
    doctype-system="about:legacy-compat"
    encoding="UTF-8"
    indent="yes" />
<xsl:param name="lang">en</xsl:param>  
<xsl:template match="/">
<html lang="de">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hallo</title>
    <link rel="stylesheet" href="datei.css" />
  </head>
  <body>
    <h1><xsl:value-of select="sag-hallo/hallo[@lang=$lang]"/></h1>
    <h2>Demo-Datei für <em>XSL-Parameter</em> und <em>Parameterweitergabe durch PHP</em>.</h2>
    <form action="index.php" method="GET">
      <fieldset>
        <legend>Sprache</legend>
        <xsl:for-each select="sag-hallo/hallo">
          <input type="radio" id="{@lang}" name="lang" value="{@lang}">
            <xsl:if test="@lang=$lang or ($lang='' and @lang='en')">
              <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>
          </input>
          <label for="{@lang}"><xsl:value-of select="@lang"/> </label>
        </xsl:for-each>
        <input type="submit" value="Hallo!"/>
        <p class="klein">Mehr <a href="https://de.wikipedia.org/wiki/ISO-3166-1-Kodierliste">Ländercodes</a> und <a href="https://www.deepl.com/translator#de/sv/Hallo%20Welt!">Sprachen</a>?</p>
      </fieldset>

    </form>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>