public abstract class Entite implements Observateur {
    protected String nom;

    public Entite(String nom) {
        this.nom = nom;
    }

    
    public abstract void notifier(String message);
}
