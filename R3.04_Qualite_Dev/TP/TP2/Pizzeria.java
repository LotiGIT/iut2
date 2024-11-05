public class Pizzeria{
    private String nom;
    private FabriqueAbstraite fabrique;

    public Pizzeria(String nom){
        nom = this.nom;
    }

    public void creerPizza(String type){
        Pizza pizza = fabrique.creerPizza(type);
    }


}