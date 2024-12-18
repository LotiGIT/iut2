public class Sujets {
    public interface Sujet {
        void ajouterObservateur(Observateur o);
        void retirerObservateur(Observateur o);
        void notifierObservateurs(String message);
    }
}
