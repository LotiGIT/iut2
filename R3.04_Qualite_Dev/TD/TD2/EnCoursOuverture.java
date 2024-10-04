
public class EnCoursOuverture implements EtatPorte {
	Porte porte;
	public EnCoursOuverture(Porte p)
	{
    			porte=p;
	}

	public void appuie() {
				porte.setEtat(porte.getEtatEnCoursFermeture());
	}

	public void termine() {
		
		porte.setEtat(porte.getEtatOuverte());
	}
	public String toString()
	{
	    // put your code here
	    return "EN COURS D'OUVERTURE";
	}

}
