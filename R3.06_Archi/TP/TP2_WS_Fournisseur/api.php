<?php
	// NB : C'est du quick and dirty. Pas de test si pb accès item inexistant
	// $articles = [
	// 	1 => array('nom' => 'Livre'),
	// 	2 => array('nom' => 'Crayon'),
	// ];
	 $articles = json_decode(file_get_contents(__DIR__ . '/data.json'), true);

	$app->get('/', function($req, $resp) {
		return buildResponse($resp, 'Ca maaaaarche !');
	});

	$app->get('/articles', function($req, $resp) {
		global $articles;

		$ret = array();
		foreach ($articles as $key => $val) {
			$item = $val;
			$item['id'] = $key;
			$ret[] = $item;
		}
		return buildResponse($resp, $ret);
	});

	$app->get('/articles/{id}', function($req, $resp, $args) {
		global $articles;

		$id = $args['id'];
		$item = $articles[$id];
		$ret = $item;

		return buildResponse($resp, $ret);
	});

	// Fix "bug" (?) avec PUT vide (body non parsé)
	$app->addBodyParsingMiddleware();
	$app->run();

?>
