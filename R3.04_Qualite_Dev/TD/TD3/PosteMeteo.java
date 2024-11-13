public class PosteMeteo implements Publisher{
    List<Subscriber> observateurs;
    String nom;
    int temperature;

    public PosteMeteo(String n){
        nom = n;
        observateurs = new ArrayList<Subscriber>();
    }

    @Override
    public void attache(Subscriber s){
        observateurs.add(s);
    }

    @Override
    public void detache(Subscriber s){
        observateurs.remove(s);
    }

       
    public void ajouterTemp(){
        return temperature;
    }

    public void nouvelleTemperature() throws IOException{
        String ligne;
        BufferedReader entree = new BufferedReader(new InputStreamReader(System.in));

        System.out.println("Ici : " + nom + "donner nouvelle temperature \n");
        // saisir nouvelle température
        ligne = entree.readLine();
        temperature = Integer.parseInt(ligne);

        this.notifier();
    }

    @Override
    public void notifier(){
        Iterator<Subscriber> it;
        Subscriber s;

        it = new observateurs.iterator();
        while(it.hasNext()){
            s = it.next(); // next() donne l'élément et passe au suivant
            s.actualiser(this);
        }

    }
}