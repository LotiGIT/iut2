<?php
header('Content-Type: application/json');

$config = [
    'use_postgres' => false,    // Changer selon disponibilité
    'use_sqlite' => true,
    'use_file_cache' => true
];

$search = json_decode(file_get_contents('php://input'), true)['search'] ?? '';
if(empty($search)) {
    echo json_encode(['error' => 'Requête vide']);
    exit;
}

// Solution 1: PostgreSQL avec pg_connect()
if($config['use_postgres']) {
    try {
        $conn = pg_connect("host=servbdd:5432 dbname=dblp user=ejanot password=LouMila2001");
        $result = pg_query_params($conn, 
            "SELECT * FROM publications WHERE title ILIKE $1 LIMIT 1", 
            ["%$search%"]
        );
        
        if(pg_num_rows($result) > 0) {
            $data = pg_fetch_assoc($result);
            $data['source'] = 'PostgreSQL Cache';
            echo json_encode([$data]);
            exit;
        }
    } catch(Exception $e) {
        // Fallback aux autres méthodes
    }
}

// Solution 2: SQLite
if($config['use_sqlite']) {
    $db = new SQLite3('dblp.db');
    $db->exec("CREATE TABLE IF NOT EXISTS publications (
        id INTEGER PRIMARY KEY,
        title TEXT,
        authors TEXT,
        year INTEGER,
        venue TEXT,
        url TEXT
    )");

    $stmt = $db->prepare("SELECT * FROM publications WHERE title LIKE :search LIMIT 1");
    $stmt->bindValue(':search', "%$search%");
    $result = $stmt->execute();
    
    if($row = $result->fetchArray(SQLITE3_ASSOC)) {
        $row['source'] = 'SQLite Cache';
        echo json_encode([$row]);
        exit;
    }
}

// Solution 3: Cache fichier
if($config['use_file_cache']) {
    $cacheDir = __DIR__ . '/cache/';
    $cacheFile = $cacheDir . md5($search) . '.json';
    
    if(file_exists($cacheFile) && time() - filemtime($cacheFile) < 3600) {
        $data = json_decode(file_get_contents($cacheFile), true);
        $data[0]['source'] = 'Fichier Cache';
        echo json_encode($data);
        exit;
    }
}

// Si aucun cache trouvé, appeler l'API DBLP
$apiResponse = file_get_contents("https://dblp.org/search/publ/api?q=" . urlencode($search) . "&format=json");
$apiData = json_decode($apiResponse, true);

if(empty($apiData['result']['hits']['hit'])) {
    echo json_encode([]);
    exit;
}

$publication = $apiData['result']['hits']['hit'][0]['info'];
$formattedData = [
    'title' => $publication['title'] ?? '',
    'type' => $publication['type'] ?? '',
    'year' => $publication['year'] ?? '',
    'authors' => implode(', ', array_column($publication['authors']['author'], 'text')),
    'venue' => $publication['venue'] ?? '',
    'url' => $publication['url'] ?? '',
    'source' => 'API Directe'
];

// Mise à jour des caches
if($config['use_postgres']) {
    pg_query_params($conn,
        "INSERT INTO publications (title, authors, year, venue, url)
         VALUES ($1, $2, $3, $4, $5)
         ON CONFLICT (title) DO NOTHING",
        [$formattedData['title'], $formattedData['authors'], $formattedData['year'], $formattedData['venue'], $formattedData['url']]
    );
}

if($config['use_sqlite']) {
    $db->exec("INSERT OR IGNORE INTO publications (title, authors, year, venue, url)
               VALUES ('{$formattedData['title']}', '{$formattedData['authors']}', '{$formattedData['year']}', '{$formattedData['venue']}', '{$formattedData['url']}')");
}

if($config['use_file_cache']) {
    file_put_contents($cacheFile, json_encode([$formattedData]));
}

echo json_encode([$formattedData]);