public class Main{

    public static void main(String[] args){
        Maximier monArbre = new MaximierVide();

        monArbre = monArbre.inserer(5);
        monArbre = monArbre.inserer(7);
        monArbre = monArbre.inserer(8);
        monArbre = monArbre.inserer(2);
        monArbre = monArbre.inserer(1);
        monArbre = monArbre.inserer(10);
        monArbre = monArbre.inserer(6);
        monArbre = monArbre.inserer(3);
        monArbre = monArbre.inserer(4);
        monArbre = monArbre.inserer(9);

        System.out.println("Poids est : " + monArbre.poids());
    }
}