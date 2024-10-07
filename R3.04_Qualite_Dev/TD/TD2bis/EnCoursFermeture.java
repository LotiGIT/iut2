public class EnCoursFermeture implements EtatPorte{
    Porte p;

    public EnCoursFermeture(Porte p){
        porte = p;
    }

    public void appuie(){
        porte.setEtat(porte.getEnCoursOuverture());
    }

    public termine(){
        porte.setEtat(porte.Fermee());
    }

    public String toString(){
        return "En cours de Fermeture...";
    }
}