<?php const PAGE_SIZE = 5; 
   
   $regions = [
      'Auvergne-Rhône-Alpes' => ['01', '03', '07', '15', '26', '38', '42', '43', '63', '69', '73', '74'],
      'Bourgogne-Franche-Comté' => ['21', '25', '39', '58', '70', '71', '89', '90'],
      'Bretagne' => ['22', '29', '35', '56'],
      'Centre-Val de Loire' => ['18', '28', '36', '37', '41', '45'],
      'Corse' => ['2A', '2B'],
      'Grand Est' => ['08', '10', '51', '52', '54', '55', '57', '67', '68', '88'],
      'Hauts-de-France' => ['02', '59', '60', '62', '80'],
      'Île-de-France' => ['75', '77', '78', '91', '92', '93', '94', '95'],
      'Normandie' => ['14', '27', '50', '61', '76'],
      'Nouvelle-Aquitaine' => ['16', '17', '19', '23', '24', '30', '33', '40', '47', '64', '79', '86', '87'],
      'Occitanie' => ['09', '11', '12', '30', '31', '32', '34', '46', '48', '65', '66', '81', '82'],
      'Pays de la Loire' => ['44', '49', '53', '72', '85'],
      'Provence-Alpes-Côtes d\'Azur' => ['04', '05', '06', '13', '83', '84'],
   ];

   if(isset($_GET['page'])){
      $pagenumber = $_GET['page'];
   }else{
      $pagenumber = 1;
   }


   $displayedRegions = array_slice($regions,($pagenumber-1)*PAGE_SIZE, PAGE_SIZE);

   

   for ($i=1; $i < $pagenumber; $i++) { 
      if($i = $pagenumber);
   }

   //Q: Créez un script exo3-regions.php qui affiche la liste des régions (juste les noms) issues du tableau $regions du fichier regions.php, mais en respectant les contraintes suivantes : ● Utilisez une liste <ul> ● Paginez votre affichage en n’affichant que 5 lignes à la fois ● Récupérez le numéro de page dans un paramètre d’URL nommé page ● Placez deux liens (<a href…>) sous la liste permettant de se déplacer vers la page précédente et la page suivante. Adaptez l’URL de chaque lien en fonction du numéro de la page courante. ● Si on est sur la page 1, ne pas afficher le lien “page précédente” ● Si on est sur la dernière page, ne pas afficher le lien “page suivante” en utilisant : require_once(), $_GET, array_slice(), count()
   require_once('regions.php');
   $regions = array_keys($regions); //array_keys() retourne toutes les clés ou un sous-ensemble des clés d'un tableau

   $page = $_GET['page'] ?? 1; // Si la variable $_GET['page'] existe, on l'affecte à $page, sinon on affecte 1 à $page 

   // On calcule le nombre de pages
   $totalPages = ceil(count($regions) / PAGE_SIZE);

   // On vérifie que $page est bien un nombre entier compris entre 1 et $totalPages
   $start = ($page - 1) * PAGE_SIZE;

   // On récupère les régions à afficher
   $end = $start + PAGE_SIZE;

   // array_slice() retourne une portion du tableau. Ici, on récupère les éléments du tableau $regions compris entre $start et $end
   $regions = array_slice($regions, $start, PAGE_SIZE);

   echo '<ul>';

   foreach ($regions as $region) {
      echo "<li>$region</li>";
   }
   echo '</ul>';

   if ($page > 1) {
      echo "<a href='exo3-regions.php?page=" . ($page - 1) . "'>Page précédente</a>";
   }

   if ($page < $totalPages) {
      echo "<a href='exo3-regions.php?page=" . ($page + 1) . "'>Page suivante</a>";
   }



   ?>

      
      



   