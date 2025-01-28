package fr.iutlan.ql.tp1;

public class StringUtils{
	/**
	* calcule la longueur d'une sous-chaîne de str comprise entre beg et end
	* c'est à dire qu'avec str = "XXXXXbegYYYYYYendZZZZZ", il faut retourner
	* la longueur de YYYYYY
	* Si beg ou end sont absents de str, alors lengthBetween retourne -1
	* @param str chaine dans laquelle on cherche beg puis end
	* @param beg sous-chaîne définissant le début (première occurrence)
	* @param end sous-chaîne définissant la fin (première occurrence après beg)
	* @return nombre de caractères entre beg et end (exclus) dans str
	*/
	static int lengthBetween(String str, String beg, String end) {
		// chercher beg dans str
		int begIndex = str.indexOf(beg);
		if (begIndex < 0) return -1;
		
		// on part de la fin de begIndex
		begIndex += beg.length();
		
		// chercher end dans str à partir de beg
		int endIndex = str.lastIndexOf(end);
		
		if (endIndex < 0) return -1;
		// écart entre endIndex et begIndex
		return endIndex - begIndex;
	}
	
    /**
     * extrait une sous-chaîne de str comprise entre beg et end
     * c'est à dire qu'avec str = "XXXXXbegYYYYYYendZZZZZ", il faut retourner
     * la sous-chaine YYYYYY
     * @throws NullPointerException si str, beg ou end sont null
     * @throws IllegalArgumentException si beg ou end sont absents de str
     * @param str chaine dans laquelle on cherche beg puis end
     * @param beg sous-chaîne définissant le début (première occurrence)
     * @param end sous-chaîne définissant la fin (première occurrence après beg)
     * @return la sous-chaine entre beg et end (exclus) dans str
     */
    static String substringBetween(String str, String beg, String end)
    throws RuntimeException {
        // chercher beg dans str
        int begIndex = str.indexOf(beg);
        if (begIndex < 0) throw new IllegalArgumentException(beg+" not found");
        // on part de la fin de begIndex
        begIndex += beg.length();
        // chercher end dans str à partir de beg
        int endIndex = str.lastIndexOf(end);
        if (endIndex < 0) throw new RuntimeException(end+" not found");
        // sous-chaine entre endIndex et begIndex
        return str.substring(begIndex, endIndex);
    }
}