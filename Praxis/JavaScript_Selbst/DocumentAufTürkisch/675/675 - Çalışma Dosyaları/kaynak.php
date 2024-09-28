<!doctype html>
<html lang="de-DE">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Extra Bildung</title>
</head>

<body>
<?php
$EmpfangeneDaten 	=	$_GET["wert"];
if($EmpfangeneDaten!=""){
	$DatenbankVerbindung	=	mysqli_connect("localhost", "root", "", "ders");
	if(!$DatenbankVerbindung){
		die("Datenbankverbindungsfehler");
	}
	mysqli_select_db($DatenbankVerbindung, "ders");
	mysqli_set_charset($DatenbankVerbindung, "utf8");
	
	$AbfrageErgebnis	=	mysqli_fetch_assoc(mysqli_query($DatenbankVerbindung,"SELECT * FROM personen WHERE id=$EmpfangeneDaten ORDER BY id ASC LIMIT 1"));
		$vornameWert		=	$AbfrageErgebnis["vorname"];
		$nachnameWert		=	$AbfrageErgebnis["nachname"];
		$alterWert			=	$AbfrageErgebnis["altaer"];
		$berufWert			=	$AbfrageErgebnis["beruf"];
		$stadtWert			=	$AbfrageErgebnis["stadt"];
		$emailWert			=	$AbfrageErgebnis["email"];
		$webseiteWert		=	$AbfrageErgebnis["web"];
	
	echo	"Vorname : ".$vornameWert."<br />";
	echo	"Nachname : ".$nachnameWert."<br />";
	echo	"Alter : ".$alterWert."<br />";
	echo	"Beruf : ".$berufWert."<br />";
	echo	"Stadt : ".$stadtWert."<br />";
	echo	"E-Mail : ".$emailWert."<br />";
	echo	"Webseite : ".$webseiteWert."<br />";
	
	mysqli_close($DatenbankVerbindung);
}else{
	echo	"Bitte wählen Sie einen gültigen Datensatz aus";
}
?>
</body>
</html>
