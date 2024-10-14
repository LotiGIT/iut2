-- supprimer et créer le schéma
drop schema if exists sae cascade;
create schema sae;
set search_path to sae;

-- table 'compte' (table parente)
create table _compte(
  id serial primary key,
  nom varchar(255) not null,
  prenom varchar(255) not null,
  email varchar(255) not null,
  motdepasse varchar(255) not null
);

-- table 'membre' (hérite de 'compte' et ajoute une contrainte unique sur id)
create table _membre(
  pseudo varchar(255) constraint membre_pk primary key
) inherits (_compte);


-- ajouter une contrainte unique sur id pour les membres
alter table _membre add constraint unique_id_membre unique(id);

create table _organisation(
  denomination varchar(255)
)inherits(_compte);

create table _public(
  typePublic varchar(255)
)inherits (_organisation);

create table _privee(
  numSiren integer,
  idIBAN integer,
  FOREIGN KEY (idIban) REFERENCES sae._rib(idIban)
)inherits (_organisation);

-- ajouter une contrainte unique sur id pour les professionnels
alter table _professionnel add constraint unique_id_professionnel unique(id);

-- Insertion d'un compte professionnel
insert into _professionnel (nom, prenom, email, motDePasse, numsiren, nomEntreprise)
values ('Dupont', 'Jean', 'jean.dupont@exemple.com', 'motdepasse123', 123456789, 'Entreprise Dupont');

insert into _membre (nom, prenom, email, motDePasse, pseudo)
values ('Dupont', 'Jean', 'jean.dupont@exemple.com', 'motdepasse123', 'Entreprise Dupont');


-- table 'offre' (référence à id_professionnel)
create table _offre(
  idoffre serial primary key,
  titre varchar(255) not null,
  description varchar(255)
  typeoffre varchar(255) not null,
  ordre integer not null,
  enLigne boolean not null,
  idAdresse intger not null,
  create_date	TIMESTAMP		NOT NULL DEFAULT now(),
  idprofessionnel integer constraint fk_offre_professionnel references _professionnel(id) on delete cascade
  idAdresse integer constraint fk_offre_adresse references _adresse(id) on delete cascade
);



create table _offre_payante(
  
)inherits (_offre);

create table _a_la_une(
  dateDebut date,-- a revoir
  dateFin date --a revoir
);
create table _offre_public(

)inherits (_offre);

-- table 'avis' (référence à idmembre et idoffre)
create table _avis(
  idavis serial primary key,
  note integer not null check (note >= 0 and note <= 5),
  commentaire varchar(255) not null,
  datevisite timestamp not null default now(),
  idmembre integer constraint fk_avis_membre references _membre(id) on delete cascade,  -- correction ici
  idoffre integer constraint fk_avis_offre references _offre(idoffre) on delete cascade
);
