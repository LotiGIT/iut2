public class Fermee implements EtatPorte{
    Porte porte;

    public Fermee(Porte p){
        porte = p;
    }

    public void appuie(){
        porte.setEtat(porte.getEnCoursOuverture());
    }

    public void termine(){

    }

    public String toString(){
        return "Fermée";
    }   
}