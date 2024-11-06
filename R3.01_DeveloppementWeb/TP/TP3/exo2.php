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

    // Méthode pour vérifier si le timestamp $dt est dans le futur
    function estFutur($dt) {
        return $dt > $this->maintenant;  // Retourne true si $dt est dans le futur
    }
}

// Création de deux objets Horodateur
$horodateur1 = new Horodateur();
$horodateur2 = new Horodateur();

// Labels
$horodateur1->label = "test 1";
$horodateur2->label = "test 2";


$horodateur1->setNow();
$horodateur2->setNow();

// Affichage 
echo $horodateur1->label . " - Différence avec 1664524330 : " . $horodateur1->difference(1664524330) . " secondes<br>";
echo $horodateur1->label . " - Futur ? Réponse : " . ($horodateur1->estFutur(1664524330) ? 'Oui' : 'Non') . "<br>";
echo $horodateur1->label . " - Différence avec 2074751530 : " . $horodateur1->difference(2074751530) . " secondes<br>";
echo $horodateur1->label . " - Futur ? Réponse : " . ($horodateur1->estFutur(2074751530) ? 'Oui' : 'Non') . "<br><br>";

echo $horodateur2->label . " - Différence avec 1664524330 : " . $horodateur2->difference(1664524330) . " secondes<br>";
echo $horodateur1->label . " - Futur ? Réponse : " . ($horodateur2->estFutur(1664524330) ? 'Oui' : 'Non') . "<br>";
echo $horodateur2->label . " - Différence avec 2074751530 : " . $horodateur2->difference(2074751530) . " secondes<br>";
echo $horodateur1->label . " - Futur ? Réponse : " . ($horodateur2->estFutur(2074751530) ? 'Oui' : 'Non') . "<br>";
?>
