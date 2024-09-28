<?php
error_reporting(E_ALL & ~(E_DEPRECATED));
$file_xml = "data/movie.xml";
$file_xsl = "data/movie.xsl";

// DOM-Objekt für XML erstellen und Datei laden
$obj_xml = new DomDocument();
$obj_xml->load($file_xml);

// DOM-Objekt für XSL erstellen und Datei laden
$obj_xsl = new DomDocument();
$obj_xsl->load($file_xsl);

// Objekt für XSL-Transformation erstellen
$obj_xsltprocessor = new XsltProcessor();
$obj_xsltprocessor->importStylesheet($obj_xsl);

// Parameter auslesen und übergeben
if (isset($_GET['genre'])) {
    $obj_xsltprocessor->setParameter(null, 'genre', $_GET['genre']);
}
if (isset($_GET['category'])) {
    $obj_xsltprocessor->setParameter(null, 'category', $_GET['category']);
}
if (isset($_GET['stichwort'])) {
    $obj_xsltprocessor->setParameter(null, 'stichwort', $_GET['stichwort']);
}

// XSL-Transformation durchführen, Ergebnis ist Zeichenkette
$str_output = $obj_xsltprocessor->transformToXml($obj_xml);

// Ausgabe des Ergebnisses in die Seite
echo $str_output;
?>
