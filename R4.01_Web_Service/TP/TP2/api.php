<?php
	// NB : C'est du quick and dirty. Pas de test si pb accès item inexistant
	// $articles = [
	// 	1 => array('nom' => 'Livre'),
	// 	2 => array('nom' => 'Crayon'),
	// ];

	$articles = json_decode(file_get_contents(__DIR__ . '/data.json'),true);
	
	function save(){
		global $articles;
		file_put_contents(__DIR__ . '/data.json', json_encode($articles, JSON_PRETTY_PRINT));
	}
	
	$app->get('/', function($req, $resp) {
		return buildResponse($resp, 'Ca maaaaarche !');
	});

	$app->post('/articles', function ($req, $resp, $args) {
		global $articles;

		$params = $req->getParsedBody();
		array_push($articles, $params);
		save();
		return $resp->withStatus(200);
	});

	$app->put('/articles/{id}', function ($req, $resp, $args) {
		global $articles;
		$id = $args['id'];
		$params = $req->getParsedBody();
		$articles[$id] = $params;
		
		save();
		return $resp->withStatus(200);
	});

	$app->patch('/articles/{id}', function ($req, $resp, $args) {
		global $articles;
		$id = $args['id'];
		$params = $req->getParsedBody();

		foreach($params as $cle => $value){
			$articles[$id][$cle]=$value;
		}
		
		save();
		return $resp->withStatus(200);
	});

	$app->delete('/articles/{id}', function ($req, $resp, $args) {
		global $articles;
		$id = $args['id'];
		unset($articles[$id]);
		save();
		return $resp->withStatus(200);
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
