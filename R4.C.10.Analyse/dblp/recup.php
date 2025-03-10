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
    <h3>Résultat :</h3>
    <pre id="resultat">Entrez un titre d'article de la base DBLP.</pre>

<script>
document.getElementById("formulaire").addEventListener("submit", async function(event) {
    event.preventDefault();
    const titre = document.getElementById("recherche").value.trim();
    
    if (!titre) {
        document.getElementById("resultat").textContent = "Veuillez entrer un titre valide";
        return;
    }

    try {
        // 1. Vérifier le cache localStorage
        const cacheKey = `dblp-${titre}`;
        const cachedData = localStorage.getItem(cacheKey);

        if (cachedData) {
            const { data, timestamp } = JSON.parse(cachedData);
            
            // Vérifier si le cache est encore valide (1 heure)
            if (Date.now() - timestamp < 3600000) {
                displayResult(data);
                return; // Sortir si cache valide
            }
        }

        // 2. Si pas de cache valide, appeler l'API
        const url = `https://dblp.org/search/publ/api?q=${encodeURIComponent(titre)}&format=json`;
        const response = await fetch(url);
        
        if (!response.ok) throw new Error(`Erreur HTTP: ${response.status}`);
        
        const apiData = await response.json();
        
        // 3. Mettre à jour le cache
        localStorage.setItem(cacheKey, JSON.stringify({
            data: apiData,
            timestamp: Date.now()
        }));

        // 4. Afficher les résultats
        displayResult(apiData);

    } catch (error) {
        document.getElementById("resultat").innerHTML = 
            `<span style="color:red">Erreur : ${error.message}</span>`;
    }
});

function displayResult(apiData) {
    if (!apiData.result?.hits?.hit?.length) {
        document.getElementById("resultat").textContent = "Aucun résultat trouvé";
        return;
    }

    const hit = apiData.result.hits.hit[0].info;
    const authors = hit.authors?.author.map(a => a.text).join(', ') || 'Inconnu';
    
    document.getElementById("resultat").innerHTML = `
        <strong>Titre :</strong> ${hit.title || 'N/A'} <br>
        <strong>Auteurs :</strong> ${authors} <br>
        <strong>Année :</strong> ${hit.year || 'N/A'} <br>
        <strong>Venue :</strong> ${hit.venue || 'N/A'} <br>
        <strong>URL :</strong> <a href="${hit.url}" target="_blank">${hit.url}</a>
        <br><small>(Source: ${localStorage.getItem(`dblp-${titre}`) ? 'Cache' : 'API Live'})</small>
    `;
}
</script>
</body>
</html>