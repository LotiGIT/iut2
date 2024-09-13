DROP SCHEMA IF EXISTS forum1 CASCADE;

CREATE SCHEMA forum1;

CREATE TABLE forum1._user(
	nickname 	VARCHAR(30)	CONSTRAINT _user_pk PRIMARY KEY,
	pass 		VARCHAR(20)	NOT NULL,
	email 		VARCHAR(40)	NOT NULL
);
 
CREATE TABLE forum1._document (
	iddoc		SERIAL			CONSTRAINT _document_pk PRIMARY KEY, -- SERIAL pour auto-incrément
	content		VARCHAR(128) 	NOT NULL, 
	create_date	TIMESTAMP		NOT NULL DEFAULT now(), -- pas DATE, il faut etre precis
	author		VARCHAR(30)		NOT NULL,
	CONSTRAINT _document_fk_author
		FOREIGN KEY (author) REFERENCES forum1._user(nickname)
);

CREATE TABLE forum1._post(
	iddoc		INTEGER,
	CONSTRAINT _post_pk PRIMARY KEY (iddoc),
	CONSTRAINT _post_fk_inherit
		FOREIGN KEY (iddoc) REFERENCES forum1._document(iddoc) 
);

CREATE TABLE forum1._comment(
	iddoc		INTEGER,
	ref			INTEGER	NOT NULL,
	CONSTRAINT _comment_pk PRIMARY KEY (iddoc),
	CONSTRAINT _comment_fk_inherit
		FOREIGN KEY (iddoc) REFERENCES forum1._document(iddoc),
	CONSTRAINT _comment_fk_ref
		FOREIGN KEY (ref) REFERENCES forum1._document(iddoc),
	CONSTRAINT _comment_ck_iddoc_ref
		CHECK (iddoc <> ref)
);

---
--- Peuplement de la base
---

--- Premier utilisateur : virtuel, ne devrait pas pouvoir se connecter
INSERT INTO forum1._user VALUES ('Anonymous', 'VGilo6VKjhcv', 'null@nowhere.space');

--- Les autres
INSERT INTO forum1._user VALUES ('Félix', 'xilef', 'felix@gcris.fr');
INSERT INTO forum1._user VALUES ('Arthur', 'ruhtra', 'arthur@gcris.fr');
INSERT INTO forum1._user VALUES ('Jean', 'naej', 'jean@gcris.fr');
INSERT INTO forum1._user VALUES ('Thomas', 'samoht', 'thomas@gcris.fr');
INSERT INTO forum1._user VALUES ('Alex', 'xela', 'alex@gcris.fr');

--- Les posts et comments
--- Insister sur le fait qu'on ne doit pas creer de document en realite
--- Document ets une classe abstraite et on instancie un Post ou un Comment
--- Suite au prochain TP avec des vues post et comment et des triggers instead of

--- Les posts

INSERT INTO forum1._document(iddoc, content, author) VALUES (1, 'Bonjour tout le monde !', 'Félix');
INSERT INTO forum1._post(iddoc) VALUES (1);

INSERT INTO forum1._document(iddoc, content, author) VALUES (2, 'Quelqu''un jouera encore au foot cette année ?', 'Arthur');
INSERT INTO forum1._post(iddoc) VALUES (2);

--- Les comments
INSERT INTO forum1._document(iddoc, content, author) VALUES (3, 'Salut Félix ! Tu vas bien ?', 'Arthur');
INSERT INTO forum1._comment(iddoc, ref) VALUES (3,1);

INSERT INTO forum1._document(iddoc, content, author) VALUES (4, 'Oui, merci. Et toi ?', 'Félix');
INSERT INTO forum1._comment(iddoc, ref) VALUES (4,3);

INSERT INTO forum1._document(iddoc, content, author) VALUES (5, 'Tiens, Félix, tu es rentré de vacances ?', 'Jean');
INSERT INTO forum1._comment(iddoc, ref) VALUES (5,1);

INSERT INTO forum1._document(iddoc, content, author) VALUES (6, 'Bonjour Félix ! Bonjour à tous', 'Thomas');
INSERT INTO forum1._comment(iddoc, ref) VALUES (6,1);

INSERT INTO forum1._document(iddoc, content, author) VALUES (7, 'Salut Thomas !', 'Jean');
INSERT INTO forum1._comment(iddoc, ref) VALUES (7,6);

INSERT INTO forum1._document(iddoc, content, author) VALUES (8, 'Hello Thomas ! Tu reprends le foot cette année ?', 'Arthur');
INSERT INTO forum1._comment(iddoc, ref) VALUES (8,6);

INSERT INTO forum1._document(iddoc, content, author) VALUES (11, 'Non, je vais me mettre au handball, je crois.', 'Thomas');
INSERT INTO forum1._comment(iddoc, ref) VALUES (11,8);

INSERT INTO forum1._document(iddoc, content, author) VALUES (12, 'Ah ? Dommage, on s''amusait bien ensemble.', 'Félix');
INSERT INTO forum1._comment(iddoc, ref) VALUES (12,8);

INSERT INTO forum1._document(iddoc, content, author) VALUES (9, 'Oui, moi !', 'Jean');
INSERT INTO forum1._comment(iddoc, ref) VALUES (9,2);

INSERT INTO forum1._document(iddoc, content, author) VALUES (10, 'Pas moi.', 'Thomas');
INSERT INTO forum1._comment(iddoc, ref) VALUES (10,2);

INSERT INTO forum1._document(iddoc, content, author) VALUES (13, 'Moi aussi', 'Félix');
INSERT INTO forum1._comment(iddoc, ref) VALUES (13,2);

INSERT INTO forum1._document(iddoc, content, author) VALUES (14, 'Et moi !', 'Alex');
INSERT INTO forum1._comment(iddoc, ref) VALUES (14,2);

--
-- Pour mettre la sequence à la bonne valeur après les insertions
select setval('forum1._document_iddoc_seq', 14 );

/*
-- Autre façon : enchainer les insert
with insertion as (
INSERT INTO forum1._document(content, author) 
  VALUES ('Et moi !', 'Alex') RETURNING iddoc
)
insert into forum1._post select iddoc from insertion;

-- A condition de vérifier à chaque création qu'on commente le bon document
with insertion as (
INSERT INTO forum1._document(content, author) 
  VALUES ('Et moi aussi !', 'Arthur') RETURNING iddoc
)
insert into forum1._comment(iddoc,ref) select iddoc,6 from insertion;
*/
