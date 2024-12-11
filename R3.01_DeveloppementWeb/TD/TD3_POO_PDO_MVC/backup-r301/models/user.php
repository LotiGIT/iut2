<?php

    require_once __DIR__ . '/../config/database.php';
    class User {
        private $conn;
        private $table_name = "users";
        private $id;
        private $name;
        private $email;

        public function __construct($db) {
            $this->conn = $db;
        }

        public function readAll() {
            $query = "SELECT id, name, email FROM " . $this->table_name;
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $res = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $res[] = $row;
            }
            return $res;
        }

        public function getAllUsers(){
            $allUsers = "SELECT * FROM " . $this->table_name;
            $stmt = $this->conn->prepare($allUsers);
            $stmt->execute();
            $res = [];
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                $res[] = $row;
            }
            return $res;
        }

        public function addUser($nom, $pseudo, $email){
            $addUser = "INSERT INTO " . $this->table_name . "(nom, pseudo, email) VALUES (?, ?, ?)";
            $stmt = $this->conn->prepare($addUser);
            $stmt->execute([$nom, $pseudo, $email]);
            return 0;
        }

        public function alterUser($id, $nom, $pseudo, $email){
            $alterUser = "UPDATE " . $this->table_name . " SET nom = ?, pseudo = ?, email = ? WHERE id = ?";
            $stmt = $this->conn->prepare($alterUser);
            $stmt->execute([$nom, $pseudo, $email, $id]);
            return 0;
        }

        public function deleteUser($id){
            $deleteUser = "DELETE " . $this->table_name . "WHERE id = ?";
            $stmt = $this->conn->prepare($deleteUser);
            $stmt-> execute([$id]);
            return true;
        }
    }
?>