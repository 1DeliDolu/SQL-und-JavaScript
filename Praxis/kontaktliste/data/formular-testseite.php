<?php 
header('Content-type: text/html; charset=utf-8');
?><!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=	, initial-scale=1.0">
    <title>Formularparameter Anzeige</title>
    <style type="text/css">
      html { font-size: 100%; }
      body	{font-family: 'Segoe UI', sans-serif; font-size:0.9rem;}
      article { margin: 1rem; }
      h1	{font-size: 1.1rem;}
      h2	{font-size: 1.05rem;}
      h3	{font-size: 1.0rem;}
      h2 > span, h3 { color: red; }
      h3 { margin-left: 2rem;}
      dl { display: flex; flex-wrap: wrap;}
      dt { flex: 0 1 100%; font-weight: bold; }
      dd { flex: 0 1 100%; margin-left: 1rem; list-style-type: square; }
      pre, dl { border: 1px solid #333; border-radius: 2rem; padding: 1.5rem; }

      @media screen and (min-width: 666px) {
        article { max-width: 720px; margin: 1rem auto; }
        dt { flex: 0 0 250px; }
        dd { flex: 1 0 300px; }
      }

    </style>
</head>
<body>
  <article>
  <h1>Parameteranzeige</h1>
  <h2>Formular wurde über 
  <span><?php echo $_SERVER['REQUEST_METHOD']; ?></span> 
  aufgerufen.
  </h2>
  <?php if($_GET){ ?>
    <h3>Get-Variable</h3>
    <dl>
    <?php
    foreach ($_GET as $schluessel => $wert)
    {
      echo "<dt>$schluessel</dt>";
      if(is_array($wert)) $wert = implode(", ", $wert);
      // wenn in der php_ini magic_quotes_gpc= on ist, werden
      // " und ' mit slashs markiert (gut für Datenbank, schlecht
      // für die HTML-Anzeige. Lösung: stripslashes
      $wert = stripslashes($wert);
      // Da im Schlüssel auch Sonderzeichen vorkommen können,
      // wie zum Besp. das &, sollten für die HTML-Anzeige diese
      // codiert werden. Lösung: htmlentities oder htmlspecialchars
      $wert = htmlentities($wert, ENT_NOQUOTES, 'UTF-8');
      // $wert = htmlspecialchars($wert, ENT_NOQUOTES, 'UTF-8');    
      echo "<dd>$wert</dd>";
    }
    ?>
    </dl>
    <?php } ?>
    
    <?php if($_POST){ ?>
      <h3>Post-Variable</h3>
      <dl>
      <?php
      foreach ($_POST as $schluessel => $wert)
      {
    echo "<dt>$schluessel</dt>";
    if(is_array($wert)) $wert = implode(", ", $wert);
    $wert = stripslashes($wert);
    $wert = htmlentities($wert, ENT_NOQUOTES, 'UTF-8');
    // $wert = htmlspecialchars($wert, ENT_NOQUOTES, 'UTF-8');
    echo "<dd>$wert</dd>";
  }
  ?>
  </dl>
  <?php } ?>
  <h3>var_dump von $_REQUEST</h3>
  <pre>
  <?php
  var_dump($_REQUEST);
  ?>  
  </pre>
  
  <?php if ($_FILES) {
    echo "<h3>Datei Upload</h3>";
    echo "<pre>";
    print_r ( $_FILES );
    echo "</pre>";
  }
  ?>
  
  </article>
  </body>
  </html>