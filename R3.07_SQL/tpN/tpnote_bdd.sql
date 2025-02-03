set schema 'articles_collection';

-- Exercice 1

create or replace view livre as 
select a.id_article, a.designation, a.prix, l.isbn13, l.nb_pages from _article a
join _livre l on a.id_article = l.id_article;

create or replace view cd as
select a.id_article, a.designation, a.prix, c.label, c.interprete_p, c.nb_morceaux from _article a
join _cd c on a.id_article = c.id_article;

create or replace view dvd as
select a.id_article, a.designation, a.prix, d.realisateur, d.duree from _article a
join _dvd d on a.id_article = d.id_article;


-- Exercice 2

create or replace function insertion_vue_livre() as $$
begin 
    insert into livre(designation, prix, isbn13, nb_pages)
    values ('Dune', 11.95, '978-2266320481', 928)
    
return values;
end;
$$ language plpgsql;
    
create trigger tg_insertion_vue_livre instead_of insert 
on _vue_livre
for each row
execute function insertion_vue_livre();


-- exrcice 5

select id_collectionneur, designation from _posseder p 
join _article a on p.id_article = a.id_article
where p.id_collectionneur = 2;


-- exercice 6 

select id_collectionneur, designation from _posseder p
join dvd d on p.id_article = d.id_article
where d.designation = 'Dune';


-- exercice 7 

/*

je mettrai une contrainte sur la table _posseder, si il existe un collectionneur alors il doit au moins y avoir 1 insert dans la table _posseder.
A la création d'un collectionneur, on doit rentrer obligatoirement un article qu'il possède.

*/









