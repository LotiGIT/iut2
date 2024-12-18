public class Dirigeant extends Entite{
    private Entreprise entreprise;

    public Dirigeant(String nom, Entreprise entreprise) {
        super(nom);
        this.entreprise = entreprise;
    }

    public void notifier(String message) {
        System.out.println("Dirigeant " + nom + " (Entreprise: " + entreprise.getNom() + ") a reçu une alerte : " + message);
    }

}