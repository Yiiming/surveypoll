<?php
	class Connexion
	{
		public $host = null;
		public $login = null;
		public $pass = null;
		public $bd_name = null;
		public $dbh = null;

		public function __construct($host, $login, $pass, $bd_name) {
			$this->bd_name = $bd_name;
			try {
				$this->dbh = new PDO('mysql:host='.$host.';dbname='.$bd_name, $login, $pass);
				// echo "Connexion de la base de donnée OK! <br />";
				// echo "Connexion de la base de donnée OK! <br />";
			} catch(PDOException $e) {
				print "ERREUR !: " . $e->getMessage() . "<br/>";
				die();
			}
		}
		public function requete($requete) {
			$resultat = $this->dbh->query($requete, PDO::FETCH_ASSOC);
			return $resultat;
		}
	}


?>