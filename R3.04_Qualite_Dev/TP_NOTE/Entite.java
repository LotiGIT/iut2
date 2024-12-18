public abstract class Entite implements Observateur {
    protected String nom;

    public Entite(String nom) {
        this.nom = nom;
    }

    
    public abstract void notifier(String message);

    // je veux créer des messages de notifications, où les créer ?
    // je veux qu'il y ait un lien entre les messages envoyées et les System.out.println des public void de armee et activee
    // R : dans la classe Alarme, dans la méthode notifierObservateurs
    
}
