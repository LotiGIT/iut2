interface Maximier {
    public int poids();
    public Maximier inserer(Processus p);
    public void afficheInfixe();
    public boolean estVide();
    public boolean existe(Processus p);
    public Maximier supprimer();
    public Processus suivant();
}

void inserer(Processus p)
{
    int i, j;
    assert(N < TAILLE);
    N++;
    j = N;
    while (j > 1)
    {
        i = j / 2;
        if (PRIOR(t[i]) >= PRIOR(p))
            break;
        t[j] = t[i];
        j = i;
    }
    t[j] = p;
}


