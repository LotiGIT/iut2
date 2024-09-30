drop schema if exists SAE cascade;
create schema SAE;
set schema 'SAE';


create table _compte(
  id integer constraint compte_pk primary key,
  nom varchar(255) not null,
  prenom varchar(255) not null,
  email varchar(255) not null,
  motDePasse varchar(255) not null
);


create table _membre(
  pseudo varchar(255) constraint membre_pk primary key,
  idMembre integer constraint fk_membre references _compte(id) on delete cascade
)inherits (_compte);

create table _professionnel(
  numSiren integer constraint professionnel_pk primary key,
  nomEntreprise varchar(255),
  idProfessionnel integer constraint fk_professionnel references _compte(id) on delete cascade
)inherits (_compte);

create table _offre(
  idOffre integer constraint offre_pk primary key,
  titre varchar(255) not null,
  typeOffre varchar(255) not null,
  prix float not null,
  statut boolean not null,
  idProfessionnel integer constraint foreign key fk_offre_professionnel references _professionnel(idProfessionnel) on delete cascade
);

create table _avis(
  idAvis integer constraint avis_pk primary key,
  note integer not null check (note >= 0 and note <= 5),
  commentaire varchar not null,
  dateVisite timestamp NOT NULL default now(),
  idMembre integer constraint fk_avis_membre references _membre(idMembre) on delete cascade,
  idOffre integer constraint fk_avis_offre references _offre(idOffre) on delete cascade
);



