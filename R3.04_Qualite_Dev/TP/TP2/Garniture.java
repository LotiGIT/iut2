public interface Garniture(){
    public void creerGarniture();
}

public class GarnitureLannion implements Garniture(){
    String nomGarniture;

    public GarnitureLannion(String nom) {
        nomGarniture = nom;
    }

    public void creerGarniture();

    
}

public class GarnitureQuimper implements Garniture(){
    public void creerGarniture();
    
    public GarnitureQuimper (String nom) {
        nomGarniture = nom;
    }
}