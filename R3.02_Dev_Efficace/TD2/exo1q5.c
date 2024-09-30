void inter_ens(ensemble l1, ensemble l2, ensemble *res){
    telement * parcours;
    init_ens(res);

    parcours = l1;
    while (parcours != NULL){
        if(appartient(l2, parcours->val) !=0){
            ajouter(res, parcours->val);
        }
        parcours = parcours->svt;
    }
}

int main(){
    ensemble ens3;
    //...
    inter_ens(ens1, ens2, &ens3);
    printf("\nvoici ens1 inter ens2 : ");
    afficher_ensemble(ens3);
    //...
}


////////////////////// Rappel ///////////////////////////////

// int appartient(ensemble l, int n){
//     int res=0;
//     telement * p;
//     p=l;
//     while((p!=NULL) && (res==0)){
//         if(p->val==n) res=l;
//         p=p->svt;
//     }
//     return res;
// }

// void ajouter(ensemble *l, int a){
//     if(appartient(*l, a)==0){
//         telement *e = (telement*)malloc(sizeof(telement));
//         e->val=a;
//         e->svt=*l;
//         *l=e;
//     }
// }