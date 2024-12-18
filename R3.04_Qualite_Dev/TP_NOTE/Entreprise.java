public class Entreprise extends Entite {
    public Entreprise(String nom) {
        super(nom);
    }

    public void notifier(String message) {
        System.out.println("Entreprise " + nom + " a reçu une alerte : " + message);
    }

    public String getNom() {
        return nom;
    }
}