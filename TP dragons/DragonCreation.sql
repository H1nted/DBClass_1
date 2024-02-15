prompt suppression par anticipation des tables
DROP TABLE REPAS;
DROP TABLE AIME;
DROP TABLE NOURRITURE;
DROP TABLE DRAGONS;

prompt creation des tables
CREATE TABLE DRAGONS
      (dragon VARCHAR2(50),
       sexe VARCHAR2(1),
       longueur INTEGER,
       nombreEcailles INTEGER,
       cracheFeu VARCHAR2(3),
       comportementAmoureux VARCHAR2(25),
       CONSTRAINT dragons_pk PRIMARY KEY (dragon));

CREATE TABLE NOURRITURE
  (produit VARCHAR2(25),
   calories INTEGER,
   CONSTRAINT nourriture_pk PRIMARY KEY (produit));

CREATE TABLE AIME
  (dragonAimant VARCHAR2(50),
   dragonAime VARCHAR2(50),
   force  VARCHAR2(25),
   CONSTRAINT aime_pk PRIMARY KEY (dragonAimant),
   CONSTRAINT aime_fk1 FOREIGN KEY (dragonAimant) REFERENCES DRAGONS(dragon),
   CONSTRAINT aime_fk2 FOREIGN KEY (dragonAime) REFERENCES DRAGONS(dragon));


CREATE TABLE REPAS
  (dragon VARCHAR2(50),
   produit VARCHAR2(25),
   quantite INTEGER,
   CONSTRAINT repas_pk PRIMARY KEY (dragon,produit),
   CONSTRAINT repas_fk1 FOREIGN KEY (dragon) REFERENCES DRAGONS(dragon),
   CONSTRAINT repas_fk2 FOREIGN KEY (produit) REFERENCES NOURRITURE(produit));

