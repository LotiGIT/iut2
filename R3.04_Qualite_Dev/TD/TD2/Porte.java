
public class Porte {
	private EtatPorte ouverte;
	private EtatPorte enCoursFermeture;
	private EtatPorte enCoursOuverture;
	private EtatPorte fermee;
	
    private EtatPorte etatPorte;

    public Porte() { 
    
    fermee= new Fermee(this);
    ouverte = new Ouverte(this);
    enCoursOuverture=new EnCoursOuverture(this);
    enCoursFermeture=new EnCoursFermeture(this);
    setEtat(fermee);
    
    }
    
	public void appuie() {             
          etatPorte.appuie();
        } 

	public void termine() {
             etatPorte.termine();
        }

	public void setEtat(EtatPorte nv_etat) {
	    etatPorte=nv_etat;
	    System.out.println(etatPorte);
	}

	public EtatPorte getEtatOuverte(){
	return(ouverte);
	}
	public EtatPorte getEtatFermee(){
	return(fermee);
	}
	public EtatPorte getEtatEnCoursOuverture(){
	return(enCoursOuverture);
	}
	public EtatPorte getEtatEnCoursFermeture(){
	return(enCoursFermeture);
	}
}
