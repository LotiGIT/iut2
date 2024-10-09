<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    

    
<?php

// $fichierCSV = 'INSEE.csv';
// $handle = fopen($fichierCSV, 'r');
unlink("data.csv");
if(isset($_FILES["fichier"])){
    // traitement
    $tmpname = $_FILES['fichier']['tmp_name'];
    $lignes = file($tmpname);
    
    $tabErreurs = [];
    foreach ($lignes as $ligne) {
        $erreur = false;
        // définition des éléments 
        $parts = explode(",",trim($ligne));
        $nom = $parts[0];
        $prenom = $parts[1];
        $email = $parts[2];
        $codeInsee = $parts[3];
        $classe = $parts[4];
        $sexe = $parts[5];
        // définition d'une ligne correct avec ses éléments
        $ligneCorrecte = $nom.",".$prenom.",".$email.",".$codeInsee;
        // Vérifier que la classe est correcte
        $classesCorrectes = ["6","5","4","3","2","1","T"];
        // vérifie si $classe se trouve dans le tableau $classseCorrectes
        if(in_array($classe, $classesCorrectes)){ // C'est OK
            $ligneCorrecte = $ligneCorrecte.",".$classe;
        }else{ // Pb
            $tabErreurs[] = "La classe ".$classe." n'est pas définie dans le tableau de classes possible";
            $erreur = true;
        }
        // Vérifier que le sexe est correcte
        $sexesCorrects = ["H","F"];
        if(in_array($sexe, $sexesCorrects)){ // C'est OK
            $ligneCorrecte = $ligneCorrecte.",".$sexe."\n";
        } 
        else{ // Pb
            $tabErreurs[] = "Le sexe ".$sexe." n'est pas défini dans le tableau des sexes possible";
            $erreur = true;
        }
        //echo "Ligne initiale: ".$ligne;
        //echo "Ligne correcte: ".$ligneCorrecte;
        if($erreur === false){
            file_put_contents("data.csv",$ligneCorrecte,FILE_APPEND);
        }

    }
    if(empty($tabErreurs)){
        echo "Importation OK";
    }   
    else{
        foreach ($tabErreurs as $erreur) {
            echo $erreur."<br>";
        }    
    }
    

}
else{ ?>

    <form action="import2.php" method="post" enctype="multipart/form-data">

            <label for="nom">Choisissez un fichier à importer </label>
            <br/>
            <br>
            <input type="file" id="fichier" name="fichier" required>
            <br>
            <br>
            <input type="submit" value="Envoyer"/>
    </form>
    <?php
    }
    ?>

</body>
</html>