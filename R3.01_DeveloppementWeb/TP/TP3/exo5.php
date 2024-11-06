<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercice 5</title>
</head>
<body>
    <?php


    class Coureur{
        private $numero; 
        private $nom;

        function __construct($numero, $nom){
            $this->numero = $numero;
            $this->nom = $nom;
        }

        function setNumero($val) {
            $this->numero = $val;
        }
        function setNom($un_nom) {
            $this->nom = $un_nom;
            }
    }

    class Equipe {
        private $nom;
        private $numero;
        private $coureurs = [];

        function __construct($numero, $nom){
            $this->numero = $numero;
            $this->nom = $nom;
        }

        function setNom($un_nom) {
            $this->nom = $un_nom;
        }
        function remplirListeCoureurs(){
            // Ouvre le fichier qui contient la liste de coureurs
            $lines = file(str_replace(" ", "_", $this->nom));
            // Parcours les lignes 23 PIERRE LE GRAND
            foreach($lines as $line){
                new Coureur(explode(""));
            }
            // Par chaque ligne : créer un coureur (avec explode)
            //                    ajouter le coureur à la liste des coureurs de l'équipe ($coureurs)



            $this->nom;

        }
    }
    
    $equipes = [];
    $filename = 'EQUIPES_TDF_2023';
    // str_replace(" ", "_", $filename);

    if(file_exists($filename)){
        
        $lines = file($filename);
        foreach($lines as $index => $line){
            $line = trim($line);
            $equipe = new Equipe($index+1,$line);
            $equipes[] = $equipe;

            
            //echo"<br>"; 
        }
        print_r($equipes);
    }
    ?>
</body>
</html>