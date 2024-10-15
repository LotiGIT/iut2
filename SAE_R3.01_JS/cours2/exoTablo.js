let planete = "Lune, Terre, Mars";
if(Array.isArray(planete)){
    // transformation d'une chaine de caractère en tableau
    let tabPlanete1;
    tabPlanete1 = planete.split(", ");

    //supression 1ere cellule
    tabPlanete1 = tabPlanete1.shift();

    // créer tableau Planete2 avec ceres, saturne et pluton
    let tabPlanete2;
    tabPlanete2= ["Céres", "Saturne", "Pluton"];
     
    // concat tabPLanete1 et tabPlanete2 et créer tabPlanete
    let tabPlanete;
    tabPlanete = concat(tabPlanete1, tabPlanete2);

    // Ajouter Mercure et Vénus au début de tabPlanete
    tabPlanete = tabPlanete.unshift("Mercure", "Vénus");
    
    // Supprimer la derniere cellule
    tabPlanete = tabPlanete.pop();

    // ajouter uranus à la fin
    tabPlanete = tabPlanete.push();

    // à quelle indice est ceres ?
    console.log(tabPlanete.indexOf("Céres"));

    //remplacer Ceres par Jupiter
    tabPlanete.splice(tabPlanete.indexOf("Céres", 1, "Jupiter"));

    // La lune fait elle partie du tableau
    console.log(includes("Lune"));

    // nouvelle variable tabPlanete avec le 3eme et 4eme planètes du tableau
    let planetes = tabPlanete.splice(2, 3);
    // quelle est la dernière planète du  tableau ?
    console.log(planetes.at());
}

