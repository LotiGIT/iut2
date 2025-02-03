# 1 


```sql
create or replace function calc_lettre_lof(annee integer)
returns varchar as
$$
declare
    lettre varchar;
begin
    select RIGHT(
               LEFT(
                   REPEAT('abcdefghijlmnoprstuv', 2),
                   annee - 1985 + 1
               ),
               1
           )
    into lettre
    from generate_series(1985, 2023) as gs(annee) 
    where gs.annee = annee;

    return lettre;
end;
$$ language plpgsql;

```



```sql
create or replace view nac as
select idAnimal, nom, date_naissance, type_animal
from animal
where type_animal = 'NAC';

```


```sql
create or replace view chien as
select idAnimal, nom, date_naissance, race, lof,
       calc_categorie(race, lof) as categorie
from animal
where type_animal = 'Chien';

```


```sql
create or replace view chat as
select idAnimal, nom, date_naissance, race
from animal
where type_animal = 'Chat';

```

```sql
insert into animal (idAnimal, nom, date_naissance, type_animal)
values (nextval('animal_id_seq'), 'Nom_du_NAC', '2025-02-01', 'NAC');

```


```sql
delete from animal
where idNational = 'ID_DU_CHAT' and type_animal = 'Chat';

```


```sql
create or replace view proprio_et_ses_animaux as
select p.idProprio, p.nom, p.prenom, a.nom as animal_nom, a.type_animal as espece
from proprietaire p
join animal a on p.idProprio = a.idProprio;

```


```sql
create or replace view proprio_chats_de_meme_race as
select p1.idProprio, p1.nom, p1.prenom, a1.race
from proprietaire p1
join animal a1 on p1.idProprio = a1.idProprio
where a1.type_animal = 'Chat'
and exists (
    select 1
    from proprietaire p2
    join animal a2 on p2.idProprio = a2.idProprio
    where a2.type_animal = 'Chat' 
    and a2.race = a1.race
    and p2.idProprio <> p1.idProprio
);

```


