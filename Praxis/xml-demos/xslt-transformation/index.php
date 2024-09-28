<?php
$file_xml = "datei.xml";
$file_xsl = "datei.xsl";
// DOM-Objekt für XML erstellen und Datei laden
$obj_xml = new DomDocument();
$obj_xml -> load($file_xml);
// DOM-Objekt für XSL erstellen und Datei laden
$obj_xsl = new DomDocument();
$obj_xsl -> load($file_xsl);
// Objekt für XSL-Transformation erstellen
$obj_xsltprocessor = new XsltProcessor();
// Stylesheet XSL-Objekt importieren
$obj_xsltprocessor -> importStylesheet($obj_xsl);
// Parameter auslesen und übergeben
// setParameter( NAMESPACE, PARAMETERNAME, WERT)
// if(isset($_POST['variable'])) {
//   $obj_xsltprocessor -> 
//         setParameter(null, 'variable', strtoupper($_POST['variable']));
// }
if(isset($_GET['lang'])) {
  $obj_xsltprocessor -> 
      setParameter(null, 'lang', $_GET['lang']);
}
// XSL-Transformation durchführen, Ergebnis ist Zeichenkette!
$str_output = $obj_xsltprocessor -> transformToXml($obj_xml);
// Ausgabe des Ergebnisses in die Seite
echo $str_output;
?>