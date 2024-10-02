<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    

    
<?php
if(isset($_FILES["fichier"]) ){
    // traitement
    $tmpname = $_FILES['fichier']['tmp_name'];
    $lignes = file($tmpname);
    foreach($lignes as $ligne_num->$ligne){
        echo "oui{$ligne}";
    }
    
    echo "<pre>";
    print_r($_FILES);
    echo "</pre>";

}
else{
    

      
        
    
        /*
        if (isset($_FILES["INSEE.csv"])) {

            // Récupère les informations du fichier soumis
            $fichierCSV = 'INSEE.csv';
            $data = fgetcsv($handle, 1000, ';');

            // Boucle
            while (($data = fgetcsv($handle, 1000, ';')) !== false) {
                $nom = $data[0];
                $classe = $data[4];
                $sexe = $data[5];
            }
            



        }
        */
       /*
        echo "<pre>";
        print_r($lines);
        echo "</pre>";
        */



    //     if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //         // Récupérer les champs normaux
    //         // $nom = $_POST['nom'];
    //         // $prenom = $_POST['prenom'];
    //         // $email = $_POST['email'];

    //         if(isset($_FILES["fichier"])){
    //             $fichierC = 'INSEE.csv';
    //             $parties = explode(";", $fichierCSV);
    //             echo $parties[1];
    //         }
    // }
        
    ?>

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