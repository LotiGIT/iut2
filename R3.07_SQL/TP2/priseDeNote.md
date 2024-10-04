# Implémentation

## A faire au début

Il faut réaliser un schéma externe. 

s'il existe des tables : 
 - _comment
 - _user
 - _post
 - etc..

alors il faut les transformer en vues.

Si la base s'appelle forum :
    create or replace view forum.user as 
        select * 
        from forum._user;

Il peut y avoir des jointures entre les tables (attention de bien les identifier pour créer de bonnes vues).

### CRUD

Il faut créer un CRUD des tables en quelques étapes :
1. Identifier les tables.
2. Créer les commentaires CREATE, READ, UPDATE, DELETE
3. Répéter l'étape 3 pour autant de table à faire.

#### UPDATE

Ici commence à se corser les choses.
Pour update il faut utiliser des triggers pour raise des exceptions.
C'est l'étape où l'ont commence vraiment à coder en SQL.


On créer d'abord une fonction **user_update** qui va gérer les cas d'erreurs d'update mais qui va aussi mettre à jour la table dans les bonnnes conditions  : 

```sql
create or replace function user_update() returns trigger as $$
begin
  if old.nickname <> new.nickname then
    raise exception 'Vous ne pouvez pas modifier le nickname';
  end if;
  update forum._user
  set pass = new.pass,
      mail = new.mail
  where nickname = new.nickname;
  return old;
end;
$$ language 'plpgsql';
```
Ici on considère qu'on ne peut pas modifier le nickname dans la table mais qu'on peut très bien modifier les autres données.

On utiliser le language 'plpgsql' car on exécute une procédure (pgsql pour ORACLE).
<br><br>

On créer ensuite le trigger qui va nous permettre d'exécuter la procédure précédente sur une cible (forum.user) :

```sql
create trigger tg_user_update
instead of update
on forum.user for each row
execute procedure user_update();
```




##


