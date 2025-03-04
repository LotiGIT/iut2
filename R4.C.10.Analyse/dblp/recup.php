<!-- <?php
    // q : recherche voulu
    // $url = "https://dblp.org/search/publ/api?q=%22Multi-Dimensional%20Exploration%20of%20Media%20Collection%20Metadata%22&format=json";
    
    // $api = json_encode($url);

    // echo $api;


?> -->


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recherche via DBLP</title>
</head>
<body>
    <h1>Recherche via l'API</h1>
    <form id="formulaire">
        <label for="recherche">Recherche du titre</label>
        <input type="text" id="recherche"/>
        <button type="submit">Rechercher</button>
    </form>
    
    <script>
    
    
    document.getElementById("formulaire").addEventListener("submit", async function(event){
        event.presentDefault();

        // url change en fonction du de la recherche (titre ici)
        // définition de la variable, on prend l'id de ce que j'écris dans la recherhe puis on trim la valeur. (on récupère un nouveau "q:")
        const titre = document.getElementById("recherche").value.trim();

        // changer l'url en fonction du titre
        const url = `https://dblp.org/search/publ/api?q=${encodeURIComponent(titre)}&format=json`;
        try {
            let reponse = await fetch(url);
            let data = await reponse.json();
            console.log(data);

            if(data.result.hits.hit.info.lenght > 0){
                
            }
        } catch (error) {
            
        }
    });

</script>
</body>
</html>
