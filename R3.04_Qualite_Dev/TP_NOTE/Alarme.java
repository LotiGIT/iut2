import java.util.ArrayList;
import java.util.List;

public class Alarme implements Sujets{
    private EtatAlarme etat;
    private EtatAlarme armee;
    private EtatAlarme activee;
    private EtatAlarme desarmee;
    private List<Observateur> observateurs;

    public Alarme() {
        armee = new Armee();
        activee = new Activee();
        desarmee = new Desarmee();
        observateurs = new ArrayList<>();
        setEtat(desarmee);
    }

    public void setEtat(EtatAlarme nv_etat) {
        while(etat != nv_etat) {
            etat = nv_etat;
            notifierObservateurs("L'alarme est " + etat.toString());
            System.out.println(nv_etat);
        }
    }

    public EtatAlarme getArmee() {
        return(armee);

    }

    public EtatAlarme getActivee() {
        return(activee);
    }

    public EtatAlarme getDesarmee() {
        return(desarmee);
    }

    public void ajouterObservateur(Observateur o) {
        observateurs.add(o);
    }

    
    public void retirerObservateur(Observateur o) {
        observateurs.remove(o);
    }

    public void notifierObservateurs(String message) {
        System.out.println("Nombre d'observateurs : " + observateurs.size());
        for(Observateur o : observateurs) {
            o.notifier(message);
        }
    }

}