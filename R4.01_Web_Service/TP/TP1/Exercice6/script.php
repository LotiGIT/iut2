<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Country List Filter</title>
</head>
<body>
    <form method="GET" action="">
        <label for="filter">Filtrer par :</label>
        <select name="filter" id="filter">
            <option value="langage">Langage</option>
            <option value="monnaie">Monnaie</option>
        </select>
        <input type="text" name="value" placeholder="Entre ce que vous cherchez">
        <button type="submit">Filtrer</button>
    </form>
    <!--    je n'ai pas réussi à le faire marcher avec l'exercice précédent alors 
            je l'ai fait en brut -->
    <?php
    $countries = [
        ['name' => 'France', 'langage' => 'French', 'monnaie' => 'Euro'],
        ['name' => 'Germany', 'langage' => 'German', 'monnaie' => 'Euro'],
        ['name' => 'Italy', 'langage' => 'Italian', 'monnaie' => 'Euro'],
        ['name' => 'Spain', 'langage' => 'Spanish', 'monnaie' => 'Euro'],
        ['name' => 'Portugal', 'langage' => 'Portuguese', 'monnaie' => 'Euro'],
        ['name' => 'England', 'langage' => 'English', 'monnaie' => 'Pound'],
        ['name' => 'USA', 'langage' => 'English', 'monnaie' => 'Dollar'],
        ['name' => 'Canada', 'langage' => 'English', 'monnaie' => 'Dollar'],
        ['name' => 'Brazil', 'langage' => 'Portuguese', 'monnaie' => 'Real'],
        ['name' => 'Argentina', 'langage' => 'Spanish', 'monnaie' => 'Peso'],
        ['name' => 'Mexico', 'langage' => 'Spanish', 'monnaie' => 'Peso'],
        ['name' => 'China', 'langage' => 'Chinese', 'monnaie' => 'Yuan'],
        ['name' => 'Japan', 'langage' => 'Japanese', 'monnaie' => 'Yen'],
        ['name' => 'Russia', 'langage' => 'Russian', 'monnaie' => 'Rouble'],
        ['name' => 'Australia', 'langage' => 'English', 'monnaie' => 'Dollar'],
        ['name' => 'India', 'langage' => 'Hindi', 'monnaie' => 'Rupee'],
        ['name' => 'South Africa', 'langage' => 'Zulu', 'monnaie' => 'Rand'],
        ['name' => 'Nigeria', 'langage' => 'Yoruba', 'monnaie' => 'Naira'],
        ['name' => 'Egypt', 'langage' => 'Arabic', 'monnaie' => 'Pound'],
        ['name' => 'Morocco', 'langage' => 'Arabic', 'monnaie' => 'Dirham'],
        ['name' => 'Tunisia', 'langage' => 'Arabic', 'monnaie' => 'Dinar'],
        ['name' => 'Algeria', 'langage' => 'Arabic', 'monnaie' => 'Dinar'],
        ['name' => 'Senegal', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Cameroon', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Ivory Coast', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Mali', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Niger', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Chad', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Gabon', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Congo', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Madagascar', 'langage' => 'French', 'monnaie' => 'Franc'],
        ['name' => 'Vietnam', 'langage' => 'Vietnamese', 'monnaie' => 'Dong'],
        ['name' => 'Thailand', 'langage' => 'Thai', 'monnaie' => 'Baht'],
        ['name' => 'Cambodia', 'langage' => 'Khmer', 'monnaie' => 'Riel'],
        ['name' => 'Laos', 'langage' => 'Lao', 'monnaie' => 'Kip'],
        ['name' => 'Myanmar', 'langage' => 'Burmese', 'monnaie' => 'Kyat'],
        ['name' => 'Indonesia', 'langage' => 'Indonesian', 'monnaie' => 'Rupiah'],
        ['name' => 'Philippines', 'langage' => 'Filipino', 'monnaie' => 'Peso'],
        ['name' => 'South Korea', 'langage' => 'Korean', 'monnaie' => 'Won'],
        ['name' => 'North Korea', 'langage' => 'Korean', 'monnaie' => 'Won'],
        ['name' => 'Turkey', 'langage' => 'Turkish', 'monnaie' => 'Lira'],
        ['name' => 'Iran', 'langage' => 'Persian', 'monnaie' => 'Rial'],
        ['name' => 'Iraq', 'langage' => 'Arabic', 'monnaie' => 'Dinar'],
        ['name' => 'Saudi Arabia', 'langage' => 'Arabic', 'monnaie' => 'Riyal'],
        ['name' => 'United Arab Emirates', 'langage' => 'Arabic', 'monnaie' => 'Dirham']
    ];

    $filter = isset($_GET['filter']) ? $_GET['filter'] : '';
    $value = isset($_GET['value']) ? $_GET['value'] : '';
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $itemsParPage = 10;

    if ($filter && $value) {
        $filteredCountries = array_filter($countries, function($country) use ($filter, $value) {
            return stripos($country[$filter], $value) !== false;
        });
    } else {
        $filteredCountries = $countries;
    }

    $totalItems = count($filteredCountries);
    $totalPages = ceil($totalItems / $itemsParPage);
    $offset = ($page - 1) * $itemsParPage;
    $paginatedCountries = array_slice($filteredCountries, $offset, $itemsParPage);

    echo '<ul>';
    foreach ($paginatedCountries as $country) {
        echo '<li>' . $country['name'] . ' - ' . $country['langage'] . ' - ' . $country['monnaie'] . '</li>';
    }
    echo '</ul>';

    if ($page > 1) {
        echo '<a href="?filter=' . $filter . '&value=' . $value . '&page=' . ($page - 1) . '">Précédente</a> ';
    }
    if ($page < $totalPages) {
        echo '<a href="?filter=' . $filter . '&value=' . $value . '&page=' . ($page + 1) . '">Suivante</a>';
    }
    ?>
</body>
</html>