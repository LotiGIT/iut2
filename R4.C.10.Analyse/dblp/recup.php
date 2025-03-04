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
    <h3>Résultat : <h3>
    <pre id="resultat">Entrez un titre d'article de la base DBLP.</pre>
    
    <script>
    
        document.getElementById("formulaire").addEventListener("submit", async function(event){
        event.preventDefault();

        // url change en fonction du de la recherche (titre ici)
        // définition de la variable, on prend l'id de ce que j'écris dans la recherhe puis on trim la valeur. (on récupère un nouveau "q:")
        const titre = document.getElementById("recherche").value.trim();
        if(!titre){
            document.getElementById("resultat").textContent="erreur de con, y'a pas de titre";
            return;
        }

        // changer l'url en fonction du titre
        const url = `https://dblp.org/search/publ/api?q=${encodeURIComponent(titre)}&format=json`;
        try {
            let reponse = await fetch(url);
            let data = await reponse.json();
            console.log(data);

            if(data.result.hits.hit.length > 0){
                // attention ici au hit[0] qui récupère la données dont on a besoin
                let demande = data.result.hits.hit[0].info;
                let auteur = data.result.hits.hit;
                // key ici est la suite de l'url qu'on veut, elle se trouve en cherchant les id de la base json de l'api
                let articleURL = `https://dblp.org/rec/${demande.key}`;
                // innerHTML sert à remplacer un contenu par un autre au format html
                document.getElementById("resultat").innerHTML= `
                    <strong>Titre : </strong> ${demande.title} <br>
                    <strong>Type : </strong> ${demande.type} <br>
                    <strong>Année : </strong> ${demande.year} <br>
                    <strong>URL : </strong> ${demande.url} <br>
                    <strong>Auteur numéro 1  : </strong> ${demande.authors.author.text} <br>
                    <strong>Pages : </strong> ${demande.pages} <br>
                    <strong>DOI : </strong> ${demande.doi} <br>
                    <strong>Venue : </strong> ${demande.venue} <br>
                    <strong>EE : </strong> ${demande.ee} <br>
                `;
            }else{
                // document permet de récupérer un élément ou faire des vérifications
                document.getElementById("resultat").textContent = "J'ai rien trouvé chef";
            }
        } catch (error) {
            document.getElementById("resultat").textContent = "Problème";
        }
    });

</script>
</body>
</html>
