<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercice  2</title>
</head>
<body>
    <!-- CSS -->
    <style>
        table, th, td{
            border : 2px;
        }

        th, td{
            padding-right : 10px;
            padding-left : 10px;
        }
    </style>

    <!-- PHP -->
    <?php
        $data = file_get_contents('data');
        $products = unserialize($data);
        echo $products;
    ?>


    <table>
    <thead>
        <td>
            <th>Code</th>
            <th>Libellé</th>
            <th>Prix HT</th>
            <th>Taux TVA</th>
            <th>Montant TVA</th>
            <th>Prix TTC</th>
            <th>Stock</th>
            <th>Quantité vendue</th>
        <td>
    </thead>
    <tbody>
        <td>
            <?php ?>
        </td>
    </tbody>
    </table>
    
    
    
    


</body>
</html>