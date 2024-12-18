import java.util.ArrayList;
import java.util.List;

public class Observateur {
    private List<Entite> entites = new ArrayList<Entite>();

    public void ajouterEntite(Entite entite) {
        entites.add(entite);
    }

    public void notifier(String message) {
        for (Entite entite : entites) {
            entite.notifier(message);
        }
    }
}
