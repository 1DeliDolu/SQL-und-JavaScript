<!doctype html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>XML Schema Validierung mit PHP</title>
  <link rel="shortcut icon" href="../../iad.ico">
  <link rel="stylesheet" href="../../css/main.css" media="screen">
  <style>
    .ergebnis { border: 1px solid #333; padding: 1rem; background-color: beige;}
    .no, .go { font-weight: bold; }
    .go { color: green;}
    .no { color: red;}
  </style>
</head>
<body>
  <main>
    <article>
      <header>
        <h1>Validierung einer XML Datei nach einem XML-Schema mit PHP</h1>
          <p>Hier wird die Gültigkeit des Buchkatalogs <a href="books.xml">books.xml</a> anhand des Schemas <a href="books.xsd">books.xsd</a> überprüft. </p>
          <p>Bearbeiten Sie diese Dateien und beobachten Sie, wie sich das Ergebnis verändert, wenn die Dateien nicht wohlgeformt oder ungültig sind.</p>
          <p>Zum Einsatz kommen Methoden der <a href="http://php.net/manual/de/book.libxml.php">libxml Erweiterung von PHP</a>.</p>
      </header>
      <section>
      <?php
        error_reporting(0);

        $dataFile = "books.xml";
        $schemaFile = "books.xsd";
        
        echo "<h2>Laden der XML-Datei mit <code>DOM -> load()</code></h2>";
        echo "<p>Wenn beim Laden kein Fehler auftritt, ist die Datei wohlgeformt.</p>";
        
        $dataDomContainer = new DOMDocument();
        libxml_use_internal_errors(true);
        $ist_wohlgeformt = $dataDomContainer -> load($dataFile);
        $error = libxml_get_last_error();
        $ergebnisSyntaxPruefung = "<p class=\"ergebnis\">Die Datei <strong>$dataFile</strong> ist " . 
          ($ist_wohlgeformt ? "<span class=\"go\">wohlgeformt</span>" : "<span class=\"no\">kaputt: <br>{$error -> message}</span>") . ".</p>";
        echo $ergebnisSyntaxPruefung;  

        echo "<h2>Validierung der XML-Datei mit <code>DOM -> schemaValidate(Schema)</code></h2>";
        echo "<p>Wenn bei der Validierung kein Fehler auftritt, ist die Datei gültig. Ein Fehler könnte auch beim Parsen der Schema-Datei auftreten.</p>";  
        
        $ist_gueltig = $dataDomContainer -> schemaValidate($schemaFile);
        $error = libxml_get_last_error();
        $ergebnisValidierung = "<p class=\"ergebnis\">Die Datei <strong>$dataFile</strong> ist " . 
          ($ist_gueltig ? "<span class=\"go\">gültig</span>" : "<span class=\"no\">ungültig: <br>{$error -> message}</span>") . ".</p>";
        echo $ergebnisValidierung;  
      ?>
        <p>Die weitere Verarbeitung der Daten kann nur erfolgen, wenn die XML Datei sowohl wohlgeformt als auch gültig ist. Die Überprüfung erledigen Sie durch zwei einfache Methodenaufrufe eines PHP Objekts. Sie müssen den Algorythmus dieser Überprüfung nicht selbst programmieren :-)</p>
        <p>Falls Ihre Datendatei nicht wohlgeformt oder ungültig ist, beenden Sie die Verarbeitung mit einer Fehlermeldung.</p>
      </section>
      <section>
        <h2 class="toggler ein">Beispiel Code der Schema-Validierung</h2>
        <figure>
          <pre><code>
&lt;?php
// Direkte Fehleranzeige unterdrücken, z. B. wenn eine Datei nicht gefunden wird
<b>error_reporting(0);</b>

// Variable mit XML- und Schema-Dateien
$dataFile = &quot;books.xml&quot;;
$schemaFile = &quot;books.xsd&quot;;

// DOM Objekt als Container für die XML Daten
<b>$dataDomContainer = new DOMDocument()</b>;

// Zugriff auf Interne Fehler der XML Bibliothek ermöglichen
// <a href="http://php.net/manual/de/function.libxml-use-internal-errors.php">http://php.net/manual/de/function.libxml-use-internal-errors.php</a>
<b>libxml_use_internal_errors(true);</b>

// load() gibt true zurück, wenn erfolgreich geladen
<b>$ist_wohlgeformt = $dataDomContainer -&gt; load($dataFile)</b>;
<b>$error = libxml_get_last_error();</b>
$ergebnisSyntaxPruefung = &quot;&lt;p class=\&quot;ergebnis\&quot;&gt;Die Datei &lt;strong&gt;$dataFile&lt;/strong&gt; ist &quot; . 
  ($ist_wohlgeformt ? &quot;&lt;span class=\&quot;go\&quot;&gt;wohlgeformt&lt;/span&gt;&quot; : 
        &quot;&lt;span class=\&quot;no\&quot;&gt;kaputt: &lt;br&gt;{<b>$error -&gt; message</b>}&lt;/span&gt;&quot;) . &quot;.&lt;/p&gt;&quot;;
echo $ergebnisSyntaxPruefung;  
// schemaValidate() gibt true zurück für gültiges Ergebnis
<b>$ist_gueltig = $dataDomContainer -&gt; schemaValidate($schemaFile);</b>
<b>$error = libxml_get_last_error();</b>
$ergebnisValidierung = &quot;&lt;p class=\&quot;ergebnis\&quot;&gt;Die Datei &lt;strong&gt;$dataFile&lt;/strong&gt; ist &quot; . 
  ($ist_gueltig ? &quot;&lt;span class=\&quot;go\&quot;&gt;gültig&lt;/span&gt;&quot; : 
        &quot;&lt;span class=\&quot;no\&quot;&gt;ungültig: &lt;br&gt;{<b>$error -&gt; message</b>}&lt;/span&gt;&quot;) . &quot;.&lt;/p&gt;&quot;;
echo $ergebnisValidierung;  
?&gt;          
          </code></pre>
          <figcaption>Schema Validierung mit PHP</figcaption>
        </figure>
      </section>
    </article>
  </main>
  <footer>
    <p>&copy; 2024 IAD GmbH</p>
  </footer>
</body>
</html>