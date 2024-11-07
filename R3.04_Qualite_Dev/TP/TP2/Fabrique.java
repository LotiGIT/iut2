public interface Fabrique{
    public void creerPizza();
}


public class FabriqueLannion implements FabriqueAbstraite{
    PateQuimper pateLannionaise;
    GarnitureLannion pipi;
    GarnitureLannion chocolat;
    GarnitureLannion vomi;

    public FabriqueLannion(){
        pateLannionaise = new pateLannionaise("Pate de Lannion")
        pipi = new GarnitureLannion("pipi froid ");
        chocolat = new GarnitureLannion("chocolat blanc");
        vomi = new GarnitureLannion("vomi à l'eau");
    }
    

    public void creerGarniture() {
        System.out.println("Produit 1 : " + pipi);
        System.out.println("Produit 2 : " + chocolat);
        System.out.println("Produit 3 : " + vomi);
    }
}

public class FabriqueQuimper implements FabriqueAbstraite{
    
    PateQuimper pateQuimperoise;
    GarnitureQuimper caca;
    GarnitureQuimper boudin;
    GarnitureQuimper molard;

    public FabriqueQuimper(){
        pateQuimper = new pateQuimper("Pate de Lannion")
        caca = new GarnitureLannion("pipi chaud");
        boudin = new GarnitureLannion("boudin noir");
        molard = new GarnitureLannion("crotte de nez");
    }

    public void creerGarniture() {
        System.out.println("Produit 1 : " + caca);
        System.out.println("Produit 2 : " + boudin);
        System.out.println("Produit 3 : " + molard);
    }
    
}
