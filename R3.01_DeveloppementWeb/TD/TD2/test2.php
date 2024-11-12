<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    
    echo "<pre>";
    print_r($_FILES);
    echo "</pre>";


    if($_SERVER['REQUEST_METHOD'] == 'POST'){

    
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $email = $_POST['email'];

        if(isset($_FILES['fichier']) && ($_FILES['fichier']['error'] == 0)){

            $nom_fichier = $_FILES['fichier']['name'];
            $type_fichier = $_FILES['fichier']['type'];
            $tmp_fichier = $_FILES['fichier']['tmp_name'];

            $types_ok = ['image/png', 'image/jpeg', 'image/gif', 'image/webp'];

            if(in_array($type_fichier, $types_ok)){

                switch($type_fichier){
                    case 'image/png':
                        $extention = '.png';
                        break;
                    case 'image/webp':
                        $extention = '.webp';
                        break;
                    case 'image/gif':
                        $extention = '.gif';
                        break;
                    case 'image/jpeg':
                        $extention = '.jpeg';
                        break;
                }

                $nouveau_nom = time().$extention;

                $changement = 'avatars/'.$nouveau_nom;

                move_uploaded_file($tmp_fichier, $changement);
            }

        }
    }
    ?>
</body>
</html>