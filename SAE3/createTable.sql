DROP SCHEMA IF EXISTS "tp1_quali" CASCADE;

CREATE SCHEMA tp1_quali;

SET SCHEMA 'tp1_quali';


/*
create table gamenn (id int, title varchar(30), release date, developper varchar(30), character
varchar(30));
insert into gamenn values (41,'VF 2', '1994-11-01', 'SEGA', 'Akira');
insert into gamenn values (41,'VF 2', '1994-11-01', 'SEGA', 'Jacky');
insert into gamenn values (41,'VF 2', '1994-11-01', 'Gaibrain', 'Akira');
insert into gamenn values (41,'VF 2', '1994-11-01', 'Gaibrain', 'Jacky');
insert into gamenn values (13053,'FF VII', '1997-01-31', 'Squaresoft', 'Cloud');
insert into gamenn values (13053,'FF VII', '1997-01-31', 'Squaresoft', 'Tifa');
insert into gamenn values (11189,'Tekken 3', '1997-03-20', 'Namco', 'Kazuya');
*/

create table developper (
  id serial primary key,
  nom varchar(30) unique
);

create table jeu (
  id_jeu serial primary key,
  titre varchar(50)unique,
  release date
);

create table jeu_developper (
  id_jeu int references jeu(id_jeu),
  id_developper int references developper(id),
  primary key (id_jeu, id_developper)
);

create table personnage (
  nom_personnage varchar(50),
  id_jeu int references jeu(id_jeu)
);




insert into developper(nom) values ('Sega');
insert into developper(nom) values ('Gaibrain');
insert into developper(nom) values ('Squaresoft');
insert into developper(nom) values ('Namco');

insert into jeu(titre, release) values ('FF VII', '1997-01-31');
insert into jeu(titre, release) values ('VF 2', '1994-11-01');
insert into jeu(titre, release) values ('Tekken 3', '1997-03-20');



insert into personnage values ('Akira', 2);
insert into personnage values ('Jacky', 2);
insert into personnage values ('Cloud', 1);
insert into personnage values ('Tifa', 1);
insert into personnage values ('Kazuya', 3);

insert into jeu_developper values (2, 1);
insert into jeu_developper values (2, 2);
insert into jeu_developper values (1, 3);
insert into jeu_developper values (3, 4);

CREATE VIEW vue_globale AS
SELECT 
    j.id_jeu,
    j.titre AS jeu_titre,
    j.release AS jeu_release,
    
    string_agg(DISTINCT d.nom, ', ') AS developper_nom,
    string_agg(DISTINCT p.nom_personnage, ', ') AS personnages
    
FROM jeu j
JOIN jeu_developper jd ON j.id_jeu = jd.id_jeu
JOIN developper d ON jd.id_developper = d.id
LEFT JOIN (
    SELECT DISTINCT id_jeu, nom_personnage
    FROM personnage
) p ON j.id_jeu = p.id_jeu
GROUP BY j.id_jeu, j.titre, j.release
ORDER BY j.id_jeu;





/*insert into jeu_developper(*/

