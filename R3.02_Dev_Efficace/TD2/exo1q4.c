// Rappel

// int appartient(ensemble 1, int n){
//     int res=0;
//     telement * p;
//     p=1;
//     while((p!=NULL) && (res==0)){
//         if(p->val==n) res=1;
//         p=p->svt;
//     }
//     return res;
// }

// void ajouter(ensemble *1, int a){
//     if(appartient(*1, a)==0){
//         telement *e = (telement*)malloc(sizeof(telement));
//         e->val=a;
//         e->svt=*1;
//         *1=e;
//     }
// }

void union_ens(ensemble l1, ensemble l2, ensemble *res){
    telement * parcours;
    init_ens(res);

    parcours=l1;
    while(parcours != NOT NULL){
        ajouter(res, parcours->val);
        parcours = parcours->svt;
    }

    parcours=l2;
    while(parcours != NOT NULL){
        ajouter(res, parcours->val);
        parcours = parcours->svt;
    }
}

int main(){
    ensemble ens3;
    //...
    union_ens(ens1, ens2, &ens3);
    printf("\n voici ens1 union ens2 : ");
    afficher_ensemble(ens3);
}