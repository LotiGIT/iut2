
public class EnCoursFermeture implements EtatPorte {
	Porte porte;
	public EnCoursFermeture(Porte p)
	{
	    // put your code here
	   porte=p;
	}
	public void appuie() {
		
		porte.setEtat(porte.getEtatEnCoursOuverture());
	}

	public void termine() {
		
		porte.setEtat(porte.getEtatFermee());
	}
	public String toString()
	{
	    return "EN COURS DE FERMETURE";
	}

}
