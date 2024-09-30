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