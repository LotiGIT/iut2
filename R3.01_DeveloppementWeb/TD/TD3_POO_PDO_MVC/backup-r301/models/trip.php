<?php 

    require_once __DIR__ . '/../config/database.php';
    class Trip{
        private $conn;
        private $table_name = "trips";
        private $id;
        private $titre;
        private $description;
        private $localisation;
        private $date_post;
        private $user_id;

        public function __construct($db) {
            $this->conn = $db;
        }

        public function getByUser($user_id){
            $query = "SELECT * FROM " . $this->table_name . " WHERE user_id = :user_id";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(":user_id", $user_id);
            $stmt->execute();
            $trips = array();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $trip = new Trip();
                $trip->id = $row['id'];
                $trip->titre = $row['titre'];
                $trip->description = $row['description'];
                $trip->localisation = $row['localisation'];
                $trip->date_post = $row['date_post'];
                $trip->user_id = $row['user_id'];
                $trips[] = $trip;
            }

            return $trips;
        }

        


    }



?>