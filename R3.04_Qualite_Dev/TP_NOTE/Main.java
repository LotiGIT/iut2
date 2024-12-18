public class Main {
    public static void main(String[] args){
        Alarme alarme = new Alarme();
        Entreprise entrepriseA = new Entreprise("Entreprise A");
        alarme.ajouterObservateur(entrepriseA);
        alarme.getArmee();
        

        Dirigeant dirigeantB = new Dirigeant("Dirigeant B", entrepriseA);

        Entreprise entrepriseC = new Entreprise("Entreprise C");
        Dirigeant dirigeantD = new Dirigeant("Dirigeant D", entrepriseC);  


        alarme.ajouterObservateur(dirigeantB);
        alarme.ajouterObservateur(entrepriseC);
        alarme.ajouterObservateur(dirigeantD);

        alarme.getArmee();
        alarme.getDesarmee();
        alarme.getArmee();
        alarme.getActivee();
        alarme.getArmee();
        alarme.getArmee();

    }
}
