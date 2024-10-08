public class Pizzeria{
    private String nom;
    private Fabrique fabrique;

    public Pizzeria(String nom){
        nom = this.nom;
    }

    public void creerPizza(String type){
        Pizza pizza = fabrique.creerPizza(type);
    }


}