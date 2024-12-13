public class MaximierVide implements Maximier{
    
    public int poids(){
        return 0;
    }
    
    public Maximier inserer(int v){
        Noeud a = new Noeud(v);
        return a;
    }

    public void afficheInfixe(){

    }

    public boolean estVide(){
        return true;
    }

    public boolean existe(int v){
        return false;
    }

    public Maximier supprimer(){
        return this;
    }

    public int obtenirMax(){
        return -1;
    }
}