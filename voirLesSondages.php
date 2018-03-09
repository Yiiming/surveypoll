<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Tous les sondages</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.css"></link>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<h1>Tous les sondages</h1>
		<?php
			include "database.php";

			$connect = new Connexion('127.0.0.1', 'root', '', 'surveypoll');

			$URL = $connect->requete("SELECT * FROM SONDAGE");
			$tabURL = array();
			while($unURL = $URL->fetch()){
				$tabURL[] = $unURL;
			}
			//print_r($tabURL);
			foreach ($tabURL as $stringURL) {
				echo "<h3 style='text-decoration: underline;'><a href='voirUnSondage.php?url=".$stringURL['URL']."''>". $stringURL['question'] ."</a></h3>";
			}
			//print_r($tabURL);
			/*for($i = 0; $i < $nbrSondageExistant; $i++){
				echo "<h3 style='text-decoration: underline;'><a href='voirUnSondage.php?url='".$tabURL[$i]."> Sondage1 </a></h3>";
			}*/

		?>
		<!--<h3 style="text-decoration: underline;"><a href="voirUnSondage.php"> Sondage1 </a></h3>
		
		<h3 style="text-decoration: underline;"><a href="voirUnSondage.php"> Sondage2 </a></h3>-->
	</div>
</body>
</html>