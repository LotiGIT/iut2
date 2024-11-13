public class StationMeteo implements Subscriber{
    String nomStation;
    int sommeMesures;
    int nbMesures;
    

    public StationMeteo(String n){
        nomStation = n;
        sommeMesures = 0;
        nbMesures = 0;

    }

    @Override
    public void actualiser(Publisher p){
        System.out.println("Ici : " + nomStation + "\n");
        System.out.println("Nouvelles mesures");

        if (c instanceof PosteMeteo){
            PosteMeteo a = (PosteMeteo) c;

            System.out.println(a.ajouterTemp());
            sommeMesures += a.ajouterTemp();
            nbMesures ++;  
        }
    }

    public void afficherMoyenne(){
        System.out.println("Moyenne de : " + nomStation + " est : " + sommeMesures / nbMesures);
    }

}