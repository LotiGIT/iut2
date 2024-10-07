public class Ouverte implements EtatPorte{
    Porte porte;
    public Ouverte(Porte p){
        porte = p;
    }

    public void appuie(){
        porte.setEtat(porte.getEtatEnCoursFermeture());
    }

    public void termine(){
        
    }

    public String toString(){
        return "Ouverte";
    }
}