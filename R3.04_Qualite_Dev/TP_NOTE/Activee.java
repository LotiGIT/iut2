public class Activee implements EtatAlarme {
    
    
    public void armee(Alarme alarme) {
        System.out.println("Action invalide : L'alarme est déjà Activée.");
    }

    
    public void desarmee(Alarme alarme) {
        System.out.println("L'alarme passe à l'état Désarmée.");
        alarme.setEtat(new Desarmee());
    }

    
    public void retenir(Alarme alarme) {
        System.out.println("Action invalide : L'alarme est déjà Activée.");
    }

    public String toString() {
        return("Activée");
    }
}