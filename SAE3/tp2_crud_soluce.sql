-- Creation des vues
set schema 'forum2';

create or replace view forum2.user as
  select *
  from _user;

--- Interface CRUD

-------- USER

-- CREATE
insert into forum2.user (nickname, pass, email)
  values ('Arnaud', 'duanra', 'arnaud@iutlan.fr');
insert into forum2.user (nickname, pass, email)
  values ('Vladimir', 'rimidalv', 'vladimir@krml.ru');

-- READ
select *
from forum2.user;

-- UPDATE
-- Si le nickname est mis à jour on provoque une erreur
create or replace function ftg_user_update() returns trigger as $$
begin
  if new.nickname <> old.nickname then  
    raise 'Vous ne pouvez pas changer le nickname !' using errcode = 23521;
  end if;
  return new;
end;
$$ language 'plpgsql';

create trigger tg_user_update
before update 
on _user for each row
execute procedure ftg_user_update();

-- DELETE
-- Pas de problème, c'est facile, ça marche tout seul.

-----------------------
-------- POST ---------
-----------------------
create or replace view forum2.post as
  select *
  from forum2._document natural join forum2._post;

-- CREATE 
drop function if exists ftg_post_create();
create or replace function ftg_post_create() returns trigger as $$
declare
  iddoctemp _document.iddoc%type;
begin
  insert into _document(content, author)
    values (new.content, new.author)
    returning iddoc into iddoctemp;
  insert into _post(iddoc) values (iddoctemp);
  return new;
end;
$$ language 'plpgsql';

drop trigger if exists tg_post_create on forum2.post;
create trigger tg_post_create
instead of insert
on forum2.post for each row
execute procedure ftg_post_create();

insert into forum2.post(content,author)
values('Lorem ipsum dolor sit amet, consectetur adipiscing elit. ','Vladimir');

-- READ
select * from forum2.post;

-- UPDATE
--OK
--update forum2.post 
--set content = 'seiryoku zenyo !' where iddoc = 2;

-- Erreur
--update forum2.post
--set author = 'Alex' where iddoc = 2;

drop function if exists ftg_post_update();
create or replace function ftg_post_update() returns trigger as $$
begin
  -- si autre chose que le contenu est changé : provoquer une erreur
  if (new.iddoc <> old.iddoc) or 
     (new.create_date <> old.create_date) or
     (new.author <> old.author)
  then 
    raise exception 'Vous ne pouvez changer que le contenu d''un post !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
  end if;
  -- sinon : on pourrait tester si le nouveau contenu est différent de l'ancien
  update forum2.post
  set content = new.content
  where iddoc = old.iddoc;
  return new;
end;
$$ language 'plpgsql';


drop trigger if exists tg_post_update on forum2.post;
create trigger tg_post_update
instead of update 
on forum2.post for each row
execute procedure ftg_post_update();



----------------------------
-------- COMMENT -----------
----------------------------

create view forum2.comment as
  select *
  from forum2._document natural join forum2._comment;
  
-- CREATE
drop function if exists ftg_comment_create();
create or replace function ftg_comment_create() returns trigger as $$
  declare
    iddoctemp forum2._document.iddoc%type;
  begin
    insert into _document(content, author) 
      values (new.content, new.author) returning iddoc into iddoctemp;
    insert into _comment(iddoc,ref) values (iddoctemp, new.ref);
    return new;
  end;
$$ language 'plpgsql';

drop trigger if exists tg_comment_create on forum2.comment;
create trigger tg_comment_create
instead of insert on forum2.comment for each row
execute procedure ftg_comment_create();

-- READ
select * from forum2.comment;

-- UPDATE
drop function if exists ftg_comment_update();
create or replace function ftg_comment_update() returns trigger as $$
  begin
    raise exception 'Mise à jour d''un commentaire interdite !!' 
    using errcode = 23520 ; -- Mon code erreur à moi
    return old;
  end;
$$ language 'plpgsql';

drop trigger if exists tg_comment_update on forum2.comment;
create trigger tg_comment_update
instead of update on forum2.comment for each row
execute procedure ftg_comment_update();

-- DELETE
-- Modification des contraintes
alter table forum2._comment 
  drop constraint _comment_fk_inherit;
alter table forum2._comment
  add constraint _comment_fk_inherit 
    foreign key (iddoc) references forum2._document(iddoc) on delete cascade;
alter table forum2._comment 
  drop constraint _comment_fk_ref;
alter table forum2._comment
  add constraint _comment_fk_ref 
    foreign key (ref) references forum2._document(iddoc) on delete cascade;

drop function if exists ftg_comment_table_delete();
create or replace function ftg_comment_table_delete() returns trigger as $$
begin
  -- suppression du _document correspondant
  delete from _document where iddoc = old.iddoc;
  return old;
end;
$$ language 'plpgsql';

create trigger tg_comment_table_delete
after delete 
on _comment for each row
execute procedure ftg_comment_table_delete();

-- test du trigger et des suppressions de valeurs de FK en cascade
-- delete from _comment where iddoc = 6;

-- gestion de la suppression au travers de la vue comment
drop function if exists ftg_delete_comment();
create or replace function ftg_delete_comment() returns trigger as $$
begin
  delete from _comment where iddoc = old.iddoc;
  return old;
end;
$$ language 'plpgsql';

create trigger tg_delete_comment
instead of delete on forum2.comment for each row
execute procedure ftg_delete_comment();

-- test trigger delete sur vue comment
-- delete from forum2.comment where iddoc = 6;


-- POST 
-- DELETE
alter table forum2._post drop constraint _post_fk_inherit;
alter table forum2._post add constraint _post_fk_inherit
  foreign key (iddoc) references forum2._document(iddoc) on delete cascade;

create trigger tg_post_table_delete
after delete on forum2._post for each row
execute procedure ftg_comment_table_delete();

-- test trigger after delete et suppression FK en cascade
-- delete from _post where iddoc = 2; 

-- Mise en place du trigger de suppression d'un post au travers de la vue
drop function if exists ftg_post_delete();
create or replace function ftg_post_delete() returns trigger as $$
  begin
    delete from _post where iddoc = old.iddoc;
    return old;
  end;
$$ language 'plpgsql';

create trigger tg_post_delete
instead of delete
on post for each row
execute procedure ftg_post_delete();
