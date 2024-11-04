let maFenetre;
function ouvrirFenetre(){
    maFenetre = maFenetre.open("", "popUp", width=250, height=100);
    maFenetre.document.write("<h1>Bonjour à tous !</h1>");
    maFenetre.focus();
}

function placerFenetre(){
    maFenetre.moveTo(100, 250);
}

function decalerFenetre(){
    maFenetre.moveBy(200, 0);
}

function agrandirFenetre(){
    resizeTo(500,200);
}

function fermerFenetre(){
    maFenetre.close();
}

ouvrirFenetre(); decalerFenetre();agrandirFenetre();fermerFenetre();
setTimeout(500);

