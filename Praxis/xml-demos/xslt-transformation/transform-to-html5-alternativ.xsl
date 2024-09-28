<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0">
<xsl:output 
  method="html" 
  encoding="UTF-8" 
  omit-xml-declaration="yes" />
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt; 
</xsl:text>
<html lang="de">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seitentitel</title>
    <link rel="stylesheet" href="css/stylesheet.css" />
  </head>
  <body>
    <h1>XSL-Transformation</h1>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
