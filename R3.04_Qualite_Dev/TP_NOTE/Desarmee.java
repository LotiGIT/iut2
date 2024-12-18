
public class Desarmee implements EtatAlarme {
    
    public void armee(Alarme alarme) {
        alarme.setEtat(alarme.getArmee());
    }

    public void desarmee(Alarme alarme) {
        System.out.println("Déjà désarmée");
    }

    
    public void retenir(Alarme alarme) {
    }

    public String toString() {
        return("Désarmée");
    }
}
