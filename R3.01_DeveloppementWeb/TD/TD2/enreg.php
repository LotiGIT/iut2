
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    // Question 2
    echo "<pre>";
    print_r($_FILES);
    echo "</pre>";


    // Question 3 
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Récupérer les champs normaux
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $email = $_POST['email'];
        

        // Vérifier si un fichier a été envoyé
        if (isset($_FILES['fichier']) && $_FILES['fichier']['error'] == 0) {
        
            $nom_fichier = $_FILES['fichier']['name'];
            $type_fichier = $_FILES['fichier']['type'];
            $taille_fichier = $_FILES['fichier']['size'];
            $tmp_fichier = $_FILES['fichier']['tmp_name'];

            $types_autorises = ['image/png', 'image/jpeg', 'image/gif', 'image/webp'];

            if (in_array($type_fichier, $types_autorises)) {
                // Récupérer l'extension en fonction du type MIME
                switch ($type_fichier) {
                    case 'image/png':
                        $extension = '.png';
                        break;
                    case 'image/gif':
                        $extension = '.gif';
                        break;
                    case 'image/jpeg':
                        $extension = '.jpg'; // extension pour JPEG
                        break;
                    case 'image/webp':
                        $extension = '.webp';
                        break;
                }

                // Générer un nom de fichier unique avec time()
                $nom_nouveau_fichier = time().$extension;

                // Définir le chemin complet pour déplacer le fichier
                $destination = 'avatars/'.$nom_nouveau_fichier;

                // Déplacement du fichier dans une nouvelle destination
                $deplacement = move_uploaded_file($tmp_fichier, $destination);

                // Question 4
                //enregistrer les données dans un fichier
                $data = file_get_content("data");
                $unserializedData = unserialize($data);
                $unserializedData[$currentTime]["nom"] = $_POST["nom"];
                $unserializedData[$currentTime]["prenom"] = $_POST["prenom"];
                $unserializedData[$currentTime]["email"] = $_POST["email"];
                $unserializedData[$currentTime]["photo"] = $currentTime.$extension;

            }else{
                echo "Erreur au niveau du fichier";
            }

        }
        echo "Nouveau nom du fichier : $nom_nouveau_fichier<br>";
        echo "Chemin de destination : $destination<br>";
    }

    ?>

</body>
</html>