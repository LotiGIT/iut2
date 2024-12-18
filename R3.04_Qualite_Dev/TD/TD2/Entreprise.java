public class Entreprise extends Entite{
    public Entreprise(String nom){
        super(nom);
    }

    public void notifier(String message) {
        System.out.println("Entreprise " + nom + " a reçu le message : " + message);
    }
}
