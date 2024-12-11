<?php
    require_once __DIR__ . '/../config/database.php';
    require_once __DIR__ . '/../models/user.php';
    
    class UserController {
        private $conn;

        public function __construct() {
            $database = new Database();
            $this->conn = $database->getConnection();
        }
        public function listUsers() {
            $user = new User($this->conn);
            $all_users = $user->readAll();
            return $all_users;
        }
    }
?>