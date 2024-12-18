public interface Sujets {
    void ajouterObservateur(Observateur o);
    void retirerObservateur(Observateur o);
    void notifierObservateurs(String message);
}

