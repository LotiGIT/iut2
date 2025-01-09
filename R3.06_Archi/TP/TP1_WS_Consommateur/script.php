<?php

stream_context_set_default([
    'http'=>[
        'proxy'=>'129.20.239.11:3128'
    ]
]);



echo '<form method="post">';
echo '<input type="text" name="nom_pays">';
echo '<input type="submit" value="Chercher">';
echo '</form>';

if (isset($_POST['nom_pays'])) {
    $nom_pays = $_POST['nom_pays'];
    $contenu = file_get_contents('https://restcountries.com/v3.1/name/'.$nom_pays);
    $data = json_decode($contenu, true);
    echo '<pre>';
    print_r($data);
    echo '</pre>';
}




?>