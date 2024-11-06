<?php

class Horodateur {
    public $maintenant;
    public $label;  // Attribut label

    // Constructeur 
    function __construct($timestamp = null) {
        if ($timestamp === null) {
            $this->maintenant = time();  // Utilise l'heure actuelle si aucun paramètre n'est passé
        } else {
            $this->maintenant = $timestamp;  // Utilise le timestamp passé en paramètre
        }
    }

    function fmtDate() {
        return date("Y-m-d", $this->maintenant);
    }

    function fmtHeure() {
        return date("H:i:s", $this->maintenant);
    }

    // Méthode pour calculer la différence en secondes
    function difference($dt) {
        return abs($this->maintenant - $dt);
    }

    // Méthode pour vérifier si le timestamp $dt est dans le futur
    function estFutur($dt) {
        return $dt > $this->maintenant;  // Retourne true si $dt est dans le futur
    }


}


$horodateur1 = new Horodateur();  // Utilise l'heure actuelle
$horodateur2 = new Horodateur(1664524330);  // Utilise un timestamp spécifique

// Labels
$horodateur1->label = "test 1";
$horodateur2->label = "test 2";

// Affichage 
echo $horodateur1->label . " - Différence avec 1664524330 : " . $horodateur1->difference(1664524330) . " secondes<br>";
echo $horodateur1->label . " - Futur ? Réponse : " . ($horodateur1->estFutur(1664524330) ? 'Oui' : 'Non') . "<br><br>";
echo $horodateur1->label . " - Différence avec 2074751530 : " . $horodateur1->difference(2074751530) . " secondes<br>";
echo $horodateur1->label . " - Futur ? Réponse : " . ($horodateur1->estFutur(2074751530) ? 'Oui' : 'Non') . "<br><br>";

echo $horodateur2->label . " - Différence avec 1664524330 : " . $horodateur2->difference(1664524330) . " secondes<br>";
echo $horodateur2->label . " - Futur ? Réponse : " . ($horodateur2->estFutur(1664524330) ? 'Oui' : 'Non') . "<br><br>";
echo $horodateur2->label . " - Différence avec 2074751530 : " . $horodateur2->difference(2074751530) . " secondes<br>";
echo $horodateur2->label . " - Futur ? Réponse : " . ($horodateur2->estFutur(2074751530) ? 'Oui' : 'Non') . "<br><br>";

?>
