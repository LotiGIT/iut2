--- Base d'articles pour contrôle TP Vues et Triggers
drop schema if exists articles_collection cascade;
create schema articles_collection;
set schema 'articles_collection';

create table _collectionneur(
  id_collectionneur   serial        primary key,
  nom_c               varchar(30)   not null,
  prenom_c            varchar(30)   not null
);

create table _article(
  id_article    serial        primary key,
  designation   varchar(75)   not null,
  prix          numeric(7,2)  not null
);

create table _posseder (
  id_collectionneur   integer,
  id_article          integer,
  constraint _posseder_pk primary key (id_collectionneur, id_article),
  constraint _posseder_fk_collec foreign key(id_collectionneur) 
    references _collectionneur,
  constraint _posseder_fk_article foreign key (id_article)
    references _article
);
    
create table _livre(
  id_article  integer     primary key,
  isbn13      varchar(14) not null,
  nb_pages    integer     not null,
  constraint _livre_fk_inherit foreign key(id_article)
    references  _article);
    
create table _cd(
  id_article    integer     primary key,
  label         varchar(30) not null,
  interprete_p  varchar(40) not null, --interprete principal
  nb_morceaux   integer     not null,
  constraint _cd_fk_inherit foreign key(id_article)
    references  _article);
    
create table _dvd(
  id_article  integer     primary key,
  realisateur varchar(40) not null,
  duree       integer     not null, -- en minutes
  constraint _cd_fk_inherit foreign key(id_article)
    references  _article);
    

--- DATA

-- COLLECTIONNEURS
INSERT INTO _collectionneur (nom_c,prenom_c) 
VALUES
  ('Thecat','Felix'),
  ('Kenobi','Ben'),
  ('Martin','Arthur');


-- ARTICLES
INSERT INTO _article (designation,prix) 
VALUES
  ('Blake & Mortimer - Tome 29 - Huit heures à Berlin',16.50),
  ('Les Schtroumpfs - Tome 35 - Les Schtroumpfs et les haricots mauves',11.90),
  ('La Schtroumpf Party Vol 3',29.95),
  ('Les Schtroumpfs : Coffret - Intégrale des Saisons 1 à 6',81.56),
  ('Jurassic World : Le Monde d''après - Version Longue',22.99),
  ('Top gun : Maverick - Steelbook',34.98);

-- LIVRES
INSERT INTO _livre (id_article,isbn13,nb_pages) 
VALUES
  (1,'978-2870972366',64),
  (2,'978-2803671144',56);
  
-- CD
INSERT INTO _cd (id_article,label,interprete_p,nb_morceaux) 
VALUES
  (3,'France Television Distribution','Les Schtroumpfs',16);
  
-- DVD
INSERT INTO _dvd (id_article,realisateur,duree) 
VALUES
  (4,'Péyo',3440),
  (5,'Colin Trevorrow',280),
  (6,'Joseph Kosinski',250);

INSERT INTO _posseder (id_collectionneur,id_article) 
VALUES
  (1,1),  (1,2),  (1,6),  (2,4),  (2,5),  (3,2);
