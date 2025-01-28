<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Recherche de Pays</title>
</head>
<body>

    <!-- j'ai changé ma méthode de récupération de données,
      maintenant je récupère les données directement via l'url du site-->
    <form method="post" action="">
        <label for="country">Nom du pays:</label>
        <input type="text" id="country" name="country" required>
        <button type="submit">Chercher</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $pays = htmlspecialchars($_POST['country']);
        $url = "https://restcountries.com/v3.1/name/" . urlencode($pays);
        $file = file_get_contents($url);
        $data = json_decode($file, true);
        
        if (!empty($data)) {
            echo "<p>Capitale: " . htmlspecialchars($data[0]['capital'][0]) . "</p>";
            echo "<p>Région: " . htmlspecialchars($data[0]['region']) . "</p>";
            echo "<p>Population: " . htmlspecialchars($data[0]['population']) . "</p>";
        } else {
            echo "<p>Aucune information trouvée pour le pays: " . htmlspecialchars($pays) . "</p>";
        }
        
    }
    ?>
</body>
</html>