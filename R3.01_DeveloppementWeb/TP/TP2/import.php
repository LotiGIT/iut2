<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        // Chemin du fichier CSV
        $csvFile = 'INSEE.csv';
        if (file_exists($csvFile)) {
            // Ouvre le fichier CSV en lecture
            if (($handle = fopen($csvFile, 'r')) !== false) {
                echo "<h2>Liste des élèves</h2>";
                echo "<table>";
                echo "<tr><th>Nom</th><th>Classe</th><th>Sexe</th></tr>";
                
                // Lire la première ligne pour ignorer l'en-tête (NOM;PRENOM;email;numero;classe;sexe;)
                $header = fgetcsv($handle, 1000, ';');
        
                // Parcourt chaque ligne du fichier CSV
                while (($data = fgetcsv($handle, 1000, ';')) !== false) {
                    // On suppose que les colonnes Nom, Classe et Sexe sont dans cet ordre
                    $nom = $data[0];    // Colonne 1 : NOM
                    $classe = $data[4]; // Colonne 5 : CLASSE
                    $sexe = $data[5];   // Colonne 6 : SEXE
        
                    // Affiche les données dans une ligne de tableau HTML
                    echo "<tr><td>{$nom}</td><td>{$classe}</td><td>{$sexe}</td></tr>";
                }
        
                echo "</table>";
                
                // Ferme le fichier
                fclose($handle);
            } else {
                echo "Erreur lors de l'ouverture du fichier CSV.";
            }
        } else {
            echo "Le fichier CSV n'existe pas.";
        }
    ?>
</body>
</html>