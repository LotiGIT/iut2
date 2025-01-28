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
            echo "<table border='1'>";
            echo "<tr><th>Capitale</th><th>Région</th><th>Population</th><th>Drapeau</th></tr>";
            echo "<tr>";
            echo "<td>" . htmlspecialchars($data[0]['capital'][0]) . "</td>";
            echo "<td>" . htmlspecialchars($data[0]['region']) . "</td>";
            echo "<td>" . htmlspecialchars($data[0]['population']) . "</td>";
            echo "<td><img src='" . htmlspecialchars($data[0]['flags']['png']) . "' alt='Drapeau'></td>";
            echo "</tr>";
            echo "</table>";
        } else {
            echo "<p>Aucune information trouvée pour le pays: " . htmlspecialchars($pays) . "</p>";
        }
        
    }
    ?>
</body>
</html>