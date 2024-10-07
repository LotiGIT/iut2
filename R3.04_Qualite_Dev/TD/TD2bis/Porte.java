public class Porte{
    private EtatPorte ouverte;
    private EtatPorte fermee;
    private EtatPorte enCoursOuverture;
    private EtatPorte enCoursFermeture;

    private EtatPorte etatPorte;

    public Porte(){
        fermee = new Fermee(this);
        ouverte = new Ouverte(this);
        enCoursFermeture = new EnCoursFermeture(this);
        enCoursOuverture = new EnCoursOuverture(this);
        setEtat(fermee);
    }

    public void appuie(){
        etatPorte.getEtatEnCoursOuverture();
    }

    public void termine(){
        etatPorte.termine();
    }

    public void setEtat(EtatPorte eP){
        etatPorte = eP;
        System.out.println(etatPorte);
    }

    public EtatPorte getEnCoursOuverture(){
        return enCoursOuverte;
    }

    public EtatPorte getEtatEnCoursFermeture(){
        return enCoursFermeture;
    }

    public EtatPorte getEtatFermee(){
        return fermee;
    }

    public EtatPorte getEtatOuverte(){
        return ouverte;
    }
}