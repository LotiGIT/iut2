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
   ?>

   <ul>
      <?php foreach ($regions as $region => $departements) { ?>
         <li><?php echo $region ?></li>
      <?php }?>
   </ul>

   <?php
   if($pagenumber>1){
   ?>
         <a href = "http://localhost:8888/exo3-regions.php&page=<?php echo $pagenumber-1?>">Page précédente</a>
         <?php
         $totalPage = ceil(count($regions)/PAGE_SIZE);?>
         <a href = "http://localhost:8888/exo3-regions.php&page=<?php echo $pagenumber+1?>">Page suivante</a>
         <?php }?>
      
      



   