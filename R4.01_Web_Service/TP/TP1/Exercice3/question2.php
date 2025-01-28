<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    
    $file = file_get_contents("pays.json");
    $pays = json_decode($file, true);

    echo "<pre>";
    print_r($pays);
    echo "</pre>";
    ?>
</body>
</html>