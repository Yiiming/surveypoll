
<?php
	include "database.php";
	$connect = new Connexion('127.0.0.1', 'root', '', 'surveypoll');

	if(isset($_GET['url'])){
		$url = $_GET['url'];
		$res = $connect->requete("SELECT * FROM SONDAGE WHERE URL = '".$url."'");
		$unSonda = $res->fetch();
		$idQuestion = $unSonda["id_sondage"];
		$question = $unSonda["question"];
		$rep = $connect->requete("SELECT REPONSE, VOTE FROM REPONSES WHERE id_sondage =" . $idQuestion);
		$countVote = $connect->requete("SELECT COUNT(*) as 'count' FROM REPONSES WHERE id_sondage =" . $idQuestion);
		$count = $countVote->fetch();

		$tabResp["question"] = $question;
		$n = 0;
		while($unResp = $rep->fetch()){
			$tabResp["response" . $n] = $unResp;
			$n++;
		}
		$tabResp["voteTotal"] = $count["count"];
		$tabResp["url"] = $url;
		header('Content-Type: json');
		echo json_encode($tabResp);
	}
?>