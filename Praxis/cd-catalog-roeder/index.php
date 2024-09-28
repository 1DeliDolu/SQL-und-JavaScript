<?php
//
// error_reporting(E_ALL & ~(E_NOTICE | E_WARNING | E_DEPRECATED)); 
error_reporting(E_ALL & ~(E_DEPRECATED)); 
$file_xml = "data/cd-catalog.xml";
$file_xsl = "data/cd-catalog.xsl";
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
/* if(isset($_POST['stichwort'])) {
  $obj_xsltprocessor -> 
      setParameter(null, 'stichwort', strtoupper($_POST['stichwort']));
}
if(isset($_POST['suchgenre'])) {
  $obj_xsltprocessor -> 
      setParameter(null, 'suchgenre', $_POST['suchgenre']);
} */
if(isset($_GET['country'])) {
  $obj_xsltprocessor -> 
      setParameter(null, 'country', $_GET['country']);
}
// XSL-Transformation durchführen, Ergebnis ist Zeichenkette!
$str_output = $obj_xsltprocessor -> transformToXml($obj_xml);
// Ausgabe des Ergebnisses in die Seite
echo $str_output;
?>