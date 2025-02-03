set schema 'forum1';

--1
select *
from _user;

-- 2 
select *
from _document
where author = 'Félix'
order by create_date asc;

(select *, 'post' as type
from _document d
where author = 'Félix'
   and iddoc in (select iddoc from _post)
union
select *, 'comment' as type
from _document d
where author = 'Félix'
   and iddoc in (select iddoc from _comment))
order by create_date desc;

-- 3
with recursive refset (iddoc, ref) as (
  select c.iddoc, c.ref
  from _comment c
  where c.ref = 1
  union
  select c.iddoc, c.ref
  from refset r inner join _comment c
  on r.iddoc = c.ref)
select *
from refset;

-- 4
-- Dans une fonction SQL
create or replace function commentaires_sql(ref_in integer) 
  returns table (iddoc integer, ref integer) as $$
    with recursive refset (iddoc, ref) as (
      select c.iddoc, c.ref
      from _comment c
      where c.ref = ref_in
      union
      select c.iddoc, c.ref
      from refset r inner join _comment c
      on r.iddoc = c.ref)
    select * from refset;
$$ language 'sql';

select * from commentaires_sql(1);

create or replace function commentaires(ref_in integer) 
  returns table (iddoc integer, ref integer) as $$
begin
  --- un ensemble de traitements
  perform * from _document d where d.iddoc = ref_in;  
  if not found then
    raise notice 'Le document % n''existe pas.', ref_in;
  end if;
  -- retourner le résultat
  return query
    select *
    from commentaires_sql(ref_in);
end;
$$ language 'plpgsql';

select *
from commentaires_plpgsql(20);

--- Mise à jour des documents à la suppression d'un user

create or replace function user_delete() returns trigger as $$
begin
  if old.nickname = 'Anonymous' then
    raise exception 'L''utilisateur Anonymous n''existe pas.';
  end if;
  update _document
  set author = 'Anonymous'
  where author = old.nickname;
  return old;
end;
$$ language 'plpgsql';

create trigger tg_user_delete
before delete 
on _user for each row
execute procedure user_delete();

delete from _user where nickname = 'Arnaud';
delete from _user where nickname = 'Félix';

