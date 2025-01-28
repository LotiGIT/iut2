package fr.iutlan.ql.tp1;

public class Main {

    /* retourne la version inscrite dans le fichier pom.xml */
    static String getVersionString() {
        return Main.class.getPackage().getImplementationVersion();
    }

    public static void main(String[] args) {
        System.out.println("Version "+getVersionString());

        int lng = StringUtils.lengthBetween("bonjour tout le monde", "jour", "mon");
        System.out.println("lng = " + lng);
    }
}