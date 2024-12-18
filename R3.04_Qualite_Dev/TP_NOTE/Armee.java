public class Armee implements EtatAlarme {
    
    public void armee(Alarme alarme) {
        System.out.println("L'alarme est déjà Armée.");
    }

    
    public void desarmee(Alarme alarme) {
        System.out.println("L'alarme passe à l'état Désarmée.");
        alarme.setEtat(new Desarmee());
    }

    
    public void retenir(Alarme alarme) {
        System.out.println("L'alarme reste activée.");
        alarme.setEtat(new Activee());
    }

    public String toString() {
        return "Armée";
    }
}