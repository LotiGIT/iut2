<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    // Question 1
    echo "<pre>";
    print_r($_FILES);
    echo "</pre>";

    //Question 2 
    if($_SERVER['REQUEST_METHOD'] == 'POST'){

        // Récupérer les champs normaux
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $email = $_POST['email'];

        // Vérifier si un fichier a été envoyé
        if(isset($_FILES['fichier']) && ($_FILES['fichier']['error'] == 0)){

            $nom_fichier = $_FILES['fichier']['name'];
            $type_fichier = $_FILES['fichier']['type'];
            $fichier_temporaire = $_FILES['fichier']['tmp_name'];

            $types_autorises = ['image/png', 'image/jpeg', 'image/gif', 'image/webp'];
            

            // Récupérer l'extension en fonction du type MIME

            // Générer un nom de fichier unique avec time()

            // Définir le chemin complet pour déplacer le fichier

            // Déplacement du fichier dans une nouvelle destination
        }

            

    }
    ?>
</body>
</html>