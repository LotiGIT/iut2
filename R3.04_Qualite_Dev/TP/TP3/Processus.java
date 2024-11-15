public class Processus {
    int id;
    int prio;
    public Processus(int i, int p) {
        id=i; 
        prio=p;
    }
    
    public String toString() {
        return "processus numero : "+id+"et de priorite"+prio;
    }

    public boolean plusPrioritaire(Processus p) {
        return this.prio>p.prio;
    }
}