
public class Fermee implements EtatPorte {
	Porte porte;
	public Fermee(Porte p)
	{
	    	   porte=p;
	}
	public void appuie() {
	    porte.setEtat(porte.getEtatEnCoursOuverture());

	}

	public void termine() {
		
	}
	public String toString()
	{
	    // put your code here
	    return "FERMEE";
	}

}
