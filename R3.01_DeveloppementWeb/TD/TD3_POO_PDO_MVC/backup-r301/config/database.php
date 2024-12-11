<?php
    class Database {
    // Informations de connexion à la base de données
        private $host = "mariadb";
        private $db_name = "r301_td3";
        private $username = "r301";
        private $password = "zorgLub!22";
        private $conn;

        // Méthode pour établir la connexion à la base de données
        public function getConnection() {
            $this->conn = null;
            try {
                // Création d'une nouvelle instance PDO pour se
                // connecter à la base de données
                $this->conn = new PDO("mysql:host=" . $this->host .
                ";dbname=" . $this->db_name, $this->username,
                $this->password);
                // Définir le mode d'erreur sur Exception pour une
                // meilleure gestion des erreurs
                $this->conn->setAttribute(PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $exception) {
                // Gestion des erreurs de connexion
                echo "Connection error: " . $exception->getMessage();
            }
            return $this->conn;
        }
    }
?>