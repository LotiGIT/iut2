public class Noeud implements Maximier{
    private int valeur;
    private Maximier gauche;
    private Maximier droit;

    public Noeud(int v){
        valeur = v;
        gauche = new MaximierVide();
        droit = new MaximierVide();
    }

    public int poids(){
        return gauche.poids() + droit.poids();
    }

    public Maximier inserer(int v){
        if(v<valeur){
            gauche = gauche.inserer(v);
        }else{
            droit = droit.inserer(v);
        }
        return this;
    }

    public void afficheInfixe(){
        gauche.afficheInfixe();
        System.out.println(valeur);
        droit.afficheInfixe();
    }

    public boolean estVide(){
        return false;
    }

    public boolean existe(int v){
        if(v==valeur){
            return true;
        }else if(v<valeur){
            return gauche.existe(v);
        }else{
            return droit.existe(v);
        }
    }

    public Maximier supprimer(){
        if(gauche.estVide()){
            return droit;
        }else if(droit.estVide()){
            return gauche;
        }else{
            valeur = droit.obtenirMax();
            droit = droit.supprimer();
            return this;
        }
    }

    public int obtenirMax(){
        if(droit.estVide()){
            return valeur;
        }else{
            return droit.obtenirMax();
        }
    }
}