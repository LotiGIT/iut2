-- exemples de fonctions
set schema 'forum1';

-- Une fonction qui utilise le langage procédural
create or replace function plus_vieux_document() returns record as $$
declare 
  mon_plus_vieux_document record;
begin
  select * into mon_plus_vieux_document
  from _document
  where create_date = (select min(create_date)
                       from _document);
  return mon_plus_vieux_document;
end;
$$ language 'plpgsql';

select plus_vieux_document();

-- Une fonction qui utilise le langage procédural qui renvoie une table
-- comme résultat d'une requête
drop function plus_vieux_document();
create or replace function plus_vieux_document() 
  returns table(iddoc integer, 
                content VARCHAR(128), 
                create_date	TIMESTAMP,
                author		VARCHAR(30)) as $$
begin
  -- Divers traitements ici
  return query
    select *
    from _document d
    where d.create_date = (select min(d1.create_date)
                           from _document d1);
end;
$$ language 'plpgsql';

select * from plus_vieux_document();

-- Autre façon de faire avec le langage SQL uniquement
drop function plus_vieux_document();
create or replace function plus_vieux_document() 
  returns table(iddoc integer, 
                content VARCHAR(128), 
                create_date	TIMESTAMP,
                author		VARCHAR(30)) as $$
  select *
  from _document
  where create_date = (select min(create_date)
                       from _document);
$$ language 'sql';

select *
from plus_vieux_document();
