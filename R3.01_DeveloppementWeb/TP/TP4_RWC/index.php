<pre>

<?php
    require_once __DIR__ . '/../config/database.php';

    $lignes = file("../data/EQUIPES");
    foreach($lignes as $ligne){

        print_r(explode(",",trim($ligne)));
        $part = explode("=", trim($ligne));
        print_r($part);
        
    }

?>

</pre>