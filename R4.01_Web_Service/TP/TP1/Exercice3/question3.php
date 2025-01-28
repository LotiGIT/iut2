<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pays - Liste</title>
    
</head>
<body>
    <?php
    
    $file = file_get_contents("pays.json");
    $pays = json_decode($file, true);

    echo "<table>";
    echo "<tr><th>Nom du pays</th><th>CCA3</th><th>Capital</th></tr>";
    foreach($pays as $p) {
        echo "<tr>";
        echo "<td>".$p['name']['common']."</td>";
        echo "<td>".$p['cca3']."</td>";
        echo "<td>".($p['capital'][0] ?? 'N/A')."</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>
</body>
</html>
