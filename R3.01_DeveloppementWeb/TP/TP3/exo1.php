<?php

class Horodateur {
    public $maintenant;
    public $label;  // Ajout de l'attribut label

    function setNow() {
        $this->maintenant = time();
    }

    function fmtDate() {
        return date("Y-m-d", $this->maintenant);
    }

    function fmtHeure() {
        return date("H:i:s", $this->maintenant);
    }

    // Ajout de la méthode difference
    function difference($dt) {
        return abs($this->maintenant - $dt);  // Retourne la différence en secondes
    }

}

// Création de deux objets Horodateur
$horodateur1 = new Horodateur();
$horodateur2 = new Horodateur();

// Affectation des labels
$horodateur1->label = "test 1";
$horodateur2->label = "test 2";

// Initialisation de l'heure actuelle pour les deux objets
$horodateur1->setNow();
$horodateur2->setNow();

// Affichage du label et de la différence de temps pour chaque objet et chaque timestamp
echo $horodateur1->label . " - Différence avec 1664524330 : " . $horodateur1->difference(1664524330) . " secondes<br>";
echo $horodateur1->label . " - Différence avec 2074751530 : " . $horodateur1->difference(2074751530) . " secondes<br>";

echo $horodateur2->label . " - Différence avec 1664524330 : " . $horodateur2->difference(1664524330) . " secondes<br>";
echo $horodateur2->label . " - Différence avec 2074751530 : " . $horodateur2->difference(2074751530) . " secondes<br>";

?>
