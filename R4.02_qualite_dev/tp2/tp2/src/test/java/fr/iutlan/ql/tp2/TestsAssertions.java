package fr.iutlan.ql.tp2;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.within;
import static org.assertj.core.api.Assertions.withinPercentage;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.regex.Pattern;

import org.assertj.core.util.Files;
import org.junit.jupiter.api.Test;

import org.apache.commons.io.FileUtils;

import fr.iutlan.ql.tp2.DataProvider.*;


@SuppressWarnings("unused")
public class TestsAssertions {

    @Test
    void testEntier137egal() {
        // Arrange
        int nombre = DataProvider.getCentTrenteSept();

        // Assert : nombre est égal ) 137
        assertThat(nombre).isEqualTo(137);
    }

    @Test
    void testEntier137entre() {
        // Arrange
        int nombre = DataProvider.getCentTrenteSept();

        // Assert : nombre est entre 130 et 140
        assertThat(nombre).isBetween(130, 140);
    }

    @Test
    void testEntier137proche() {
        // Arrange
        int nombre = DataProvider.getCentTrenteSept();

        // Assert : nombre est proche de 120 à 20%
        assertThat(nombre).isCloseTo(120, withinPercentage(20));
    }

    @Test
    void testsMultiplesEntier137() {
        // ARRANGE
        int nombre = DataProvider.getCentTrenteSept();

        // ASSERT
        assertThat(nombre)
            .isEqualTo(137)
            .isBetween(130, 140)
            .isCloseTo(120, withinPercentage(20));
    }

    @Test
    void testEntierM2013negatif() {
        // Arrange
        int nombre = DataProvider.getMoinsDeuxMilleTreize();

        // Assert : nombre est négatif
        assertThat(nombre);
    }

    @Test
    void testEntierM2013proche() {
        // Arrange
        int nombre = DataProvider.getMoinsDeuxMilleTreize();

        // Assert : nombre est proche de -2000 +- 20
        assertThat(nombre);
    }

    @Test
    void testEntierM2013multiple11() {
        // Arrange
        int nombre = DataProvider.getMoinsDeuxMilleTreize();

        // Assert : nombre est un multiple de 11
        assertThat(nombre);
    }

    @Test
    void testEntierM2013dansListe() {
        // Arrange
        int nombre = DataProvider.getMoinsDeuxMilleTreize();

        // Assert : nombre fait partie de la liste {137, 2, 1000, 13, 2014, -2013, -2}
        assertThat(nombre);
    }

    @Test
    void testReelM271valide() {
        // Arrange
        float nombre = DataProvider.getMoinsDeuxPointSeptUn();

        // Assert : nombre est un nombre valide (ni NaN, ni infini)
        assertThat(nombre);
    }

    @Test
    void testReelM271entreM2etM3() {
        // Arrange
        float nombre = DataProvider.getMoinsDeuxPointSeptUn();

        // Assert : nombre est entre -2 et -3 (piège)
        assertThat(nombre);
    }

    @Test
    void testReelM271nonEntier() {
        // Arrange
        float nombre = DataProvider.getMoinsDeuxPointSeptUn();

        // Assert : nombre est un nombre non entier (chiffres non nuls après la virgule)
        assertThat(nombre);
    }

    @Test
    void testInfini() {
        // Arrange
        float nombre = DataProvider.getMInfini();

        // Assert : nombre est infini (+∞ ou -∞)
        assertThat(nombre);
    }

    @Test
    void testGouvernailsLongueur11() {
        // Arrange
        String chaine = DataProvider.getGouvernails();

        // Assert : chaine est de longueur 11
        assertThat(chaine).hasSize(11);
    }

    @Test
    void testGouvernailsFinitParS() {
        // Arrange
        String chaine = DataProvider.getGouvernails();
        String souschaine = "s";
        // Assert : chaine finit par un s minuscule
        assertThat(chaine).endsWith(souschaine);
    }

    @Test
    void testGouvernailsContientGou() {
        // Arrange
        String chaine = DataProvider.getGouvernails();
        String souschaine = "gou";
        

        // Assert : chaine contient "gou" sans tenir compte de la casse (A=a)
        assertThat(chaine).containsIgnoringCase(souschaine);
    }

    @Test
    void testGouvernailsContientAilMaisPasVers() {
        // Arrange
        String chaine = DataProvider.getGouvernails();
        

        // Assert : chaine contient "ail" mais pas "vers"
        assertThat(chaine).contains("ail").doesNotContain("vers");
    }

    @Test
    void testGouvernailsContientLettresARES() {
        // Arrange
        String chaine = DataProvider.getGouvernails();

        // Assert : chaine contient les lettres a, r, e, s dans n'importe quel ordre
        assertThat(chaine).contains("a", "r", "e", "s");
    }

    @Test
    void testGouvernailsContientMajusculesEtMinuscules() {
        // Arrange
        String chaine = DataProvider.getGouvernails();

        // Assert : chaine contient à la fois des minuscules et des majuscules
        assertThat(chaine).matches(".*[a-z].*").matches(".*[A-Z].*");
    }

    @Test
    void testGouvernailsContientAucunChiffre() {
        // Arrange
        String chaine = DataProvider.getGouvernails();

        // Assert : chaine ne contient aucun chiffre
        assertThat(chaine).doesNotMatch(".*\\d.*");
    }

    @Test
    void testGouvernailsCommenceMajuscule() {
        // Arrange
        String chaine = DataProvider.getGouvernails();

        // Assert : chaine commence par une majuscule
        assertThat(chaine).matches("^[A-Z].*");
    }

    @Test
    void testGouvernailsContientUniquementDesCaracteresUniques() {
        // Arrange
        String chaine = DataProvider.getGouvernails();

        // Assert : chaine ne contient pas un seul caractère répété
        assertThat(chaine);
    }

    @Test
    void testVehiculeV1classe() {
        // Arrange
        Vehicule v1 = DataProvider.getVehicule1();

        // Assert : v1 est une instance de Vehicule, éventuellement une de ses sous-classes
        assertThat(v1).isInstanceOf(Vehicule.class);
    }

    @Test
    void testVehiculeV1classeStricte() {
        // Arrange
        Vehicule v1 = DataProvider.getVehicule1();

        // Assert : v1 est une instance de Vehicule, pas une de ses sous-classes
        assertThat(v1).isExactlyInstanceOf(Vehicule.class);
    }

    @Test
    void testVehiculeV2classeVeloStricte() {
        // Arrange
	        Vehicule v2 = DataProvider.getVehicule2();
	
	    // Assert : v2 est une instance de Velo, pas une de ses sous-classes ou superclasse
	        assertThat(v2).isExactlyInstanceOf(Velo.class);
    }

    @Test
    void testVehiculeV1pasNull() {
        // Arrange
        Vehicule v1 = DataProvider.getVehicule1();

        // Assert : v1 n'est pas null
        assertThat(v1).isNotNull();
    }

    @Test
    void testVehiculeV2diffV3() {
        // Arrange
        Vehicule v2 = DataProvider.getVehicule2();
        Vehicule v3 = DataProvider.getVehicule3();

        // Assert : v2 est une instance différente de v3
        assertThat(v2).isNotEqualTo(v3);
    }

    @Test
    void testVehiculeV2commeV3() {
        // Arrange
        Vehicule v2 = DataProvider.getVehicule2();
        Vehicule v3 = DataProvider.getVehicule3();

        // Assert : v2 possède les mêmes valeurs dans ses variables membres que v3
        assertThat(v2);
    }

    @Test
    void testVehiculeV3commeV4saufPrix() {
        // Arrange
        Vehicule v3 = DataProvider.getVehicule3();
        Vehicule v4 = DataProvider.getVehicule4();

        // Assert : v3 possède les mêmes valeurs de champ que v4, excepté le prix
        assertThat(v3.nom).isEqualTo(v4.nom);
        assertThat(v3.places).isEqualTo(v4.places);
    }

    @Test
    void testVehiculeV5commeV1saufNulls() {
        // Arrange
        Vehicule v5 = DataProvider.getVehicule5();
        Vehicule v1 = DataProvider.getVehicule1();

        // Assert : v5 possède les mêmes valeurs de champ que v1, quand elles ne sont pas nulles
        assertThat(v5);
    }

    @Test
    void testListeNonVide() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste n'est pas vide
        assertThat(liste);
    }

    @Test
    void testListeContientTout() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste contient "tout"
        assertThat(liste);
    }

    @Test
    void testListe4eElement() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : le 4e élément de liste est "tout"
        assertThat(liste);
    }

    @Test
    void testListeContientExactementUnNull() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste contient un et un seul null
        assertThat(liste);
    }

    @Test
    void testListeNeContientPasChaineVide() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste ne contient pas de chaîne vide
        assertThat(liste);
    }

    @Test
    void testListeNeContientPasQueNull() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste ne contient pas que des null
        assertThat(liste);
    }

    @Test
    void testListeChainesToutesEntre1et6Chars() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : les chaînes de la liste ne sont pas vides et ont au maximum 6 caractères
        assertThat(liste);
    }

    @Test
    void testListeContientUniquementDesStrings() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste ne contient que des instances de String ou null
        assertThat(liste);
    }

    @Test
    void testListeNeContientPasDeChainesEnDouble() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste ne contient pas d'élément en double (ou plus)
        assertThat(liste);
    }

    @Test
    void testListeElementsParmi() {
        // Arrange
        List<Object> liste = DataProvider.getListe();

        // Assert : liste est uniquement composée d'éléments parmi {"ici", "le", "groupe", "a", 17, "me", "dit", 23, "salut", "tout", "le", "temps", null}
        assertThat(liste);
    }


    @Test
    void testFichierExtensionTXT() {
        // Arrange
        String nom = DataProvider.getDataFileName();

        // Assert : le nom se termine par .txt
        assertThat(nom);
    }

    @Test
    void testFichierEstUnFichierLisible() {
        // Arrange : obtenir le fichier
        String filename = DataProvider.getDataFileName();
        File file = new File(filename);

        // Assert : le fichier est un fichier lisible
        assertThat(file);
    }

    @Test
    void testFichierPasVide() {
        // Arrange : obtenir le fichier
        String filename = DataProvider.getDataFileName();
        File file = new File(filename);

        // Assert : le fichier n'est pas vide
        assertThat(file);
    }

    private static final Charset UTF_8 = StandardCharsets.UTF_8;

    @Test
    void testFichierContientEntre3et6lignes() {
        // Arrange : obtenir le fichier
        String filename = DataProvider.getDataFileName();
        File file = new File(filename);

        // Assert : le fichier contient entre 3 et 6 lignes
        assertThat(Files.linesOf(file, UTF_8));
    }

    @Test
    void testFichierContientLignesCommençantParLigne() {
        // Arrange : obtenir le fichier
        String filename = DataProvider.getDataFileName();
        File file = new File(filename);

        // Assert : le fichier contient uniquement des lignes qui commencent par "ligne "
    }

    @Test
    void testFichierContientLignesLigneNombre() {
        // Arrange : obtenir le fichier
        String filename = DataProvider.getDataFileName();
        File file = new File(filename);

        // Assert : le fichier contient uniquement des lignes qui correspondent au patron "ligne <chiffres>"
    }
    
}
