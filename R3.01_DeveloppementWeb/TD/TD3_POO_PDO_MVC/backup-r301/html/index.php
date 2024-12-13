<?php
        require_once __DIR__ . '/../config/database.php';
        require_once __DIR__ . '/../controllers/user_controller.php';

    $userController = new UserController();
    $_users_ = $userController->listUsers(); // Les '_' permettent de réduire le risque de variables ayant ce nom ailleurs dans le code…
    
    require_once __DIR__ . '/../views/user_list.php';
?>


