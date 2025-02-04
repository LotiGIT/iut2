package fr.iutlan.ql.tp2;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Cette classe fournit des données pour des tests du TP2
 */
public class DataProvider {

    static int getCentTrenteSept() {
        return 145;
    }

    static int getMoinsDeuxMilleTreize() {
        return -2013;
    }

    static float getMoinsDeuxPointSeptUn() {
        return -2.71f;
    }

    static float getMInfini() {
        return -1.0f/0.0f;
    }

    static String getGouvernails() {
        return "Gouvernails";
    }

    public static class Vehicule {
        protected int prix;
        protected String nom;
        protected int places;

        public String getPropulsion() {
            return "inconnu";
        }

        public Vehicule(int prix, String nom, int places) {
            this.prix = prix;
            this.nom = nom;
            this.places = places;
        }
    }

    public static class Voiture extends Vehicule {
        @SuppressWarnings("unused")
        private String energie;

        public Voiture(int prix, String nom, String energie) {
            super(prix, nom, 4);
            this.energie = energie;
        }

        @Override
        public String getPropulsion() {
            return "moteur";
        }
    }

    @SuppressWarnings("unused")
    public static class Camion extends Vehicule {
        private String energie;
        private boolean lourd;

        public Camion(int prix, String nom, String energie, boolean lourd) {
            super(prix, nom, 4);
            this.energie = energie;
            this.lourd = lourd;
        }

        @Override
        public String getPropulsion() {
            return "moteur";
        }
    }

    public static class Velo extends Vehicule {

        public Velo(int prix, String nom) {
            super(prix, nom, 2);
        }

        @Override
        public String getPropulsion() {
            return "jambes";
        }
    }

    private static final Vehicule v1 = new Vehicule(100, "V1", 4);
    private static final Vehicule v2 = new Velo(100, "V1");
    private static final Vehicule v3 = new Vehicule(100, "V1", 2);
    private static final Vehicule v4 = new Vehicule(200, "V1", 2);
    private static final Vehicule v5 = new Vehicule(100, null, 4);

    static Vehicule getVehicule1() {
        return v1;
    }
    static Vehicule getVehicule2() {
        return v2;
    }
    static Vehicule getVehicule3() {
        return v3;
    }
    static Vehicule getVehicule4() {
        return v4;
    }
    static Vehicule getVehicule5() {
        return v5;
    }

    static List<Object> getListe() {
        return Arrays.asList(new Object[] {
                "salut", null, "a", "tout", "le", "groupe", "ici"
            });
    }


    private static String filename;

    static {
        try {
            File file = File.createTempFile("R4_02_TP2_",".txt");
            final FileWriter myWriter = new FileWriter(file);
            myWriter.write("ligne 1\n");
            myWriter.write("ligne 2\n");
            myWriter.write("ligne 2\n");
            myWriter.write("ligne 3\n");
            myWriter.write("ligne 4\n");
            myWriter.close();
            filename = file.getAbsolutePath();
        } catch (IOException e) {
            filename = e.getMessage();
        }
    }

    static String getDataFileName() {
        return filename;
    }
}

