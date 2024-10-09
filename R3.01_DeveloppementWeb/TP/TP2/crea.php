<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    
    
    ?>

    <form action="crea.php" method="post" enctype="multipart/form-data">

        <label for="nom">Nom : </label>
        <input type="text" id="nom" name="nom" required />
        <br/>
        <br>
        <label>Genre :</label>
        <input type="radio" id="genre1" name="genre" value="Homme" />
        <label for="genre1">Homme</label>
        <input type="radio" id="genre2" name="genre" value="Femme" />
        <label for="genre2">Femme</label>
        <br/>
        <br>
        <label for="class">Classe : </label>
        <input type="text" id="classe" name="classe" required />
        <br/>
        <br>
        <input type="file" id="fichier" name="fichier" required>
        <br>
        <br>
        <input type="submit" value="Envoyer"/>
    </form>
</body>
</html>