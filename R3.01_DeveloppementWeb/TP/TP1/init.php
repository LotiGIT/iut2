<?php
    $lines = file('articles');

    $products = [];

    foreach($lines as $line){
        $fields = explode(',', $line);
        // Construire un produit
        $product["libelle"]=$fields[1];
        $product["prix"]=$fields[2];
        $product["TVA"]=$fields[3];
        $product["stock"]=0;
        $product["vendu"]=0;

        // Ajouter à la listes des produits
        $products[$fields[0]]=$product;   
    }
    print_r($products);

    $tablo = serialize($products);
    file_put_contents('data',$tablo);
    
    // si pas serialisé avant on peut le faire comme ça
    // file_put_contents('data',serialize($products));

?>