DROP TABLE REPAS;
DROP TABLE AIME;
DROP TABLE NOURRITURE;
DROP TABLE DRAGONS;

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

INSERT INTO  DRAGONS values ('Smeagol','M',152,1857,'oui','macho');
INSERT INTO  DRAGONS values ('Birduth','M',258,4787,'non','timide');
INSERT INTO  DRAGONS values ('Negueth','F',128,1581,'oui','sincere');
INSERT INTO  DRAGONS values ('MissToc','F',183,2781,'non','superflu');
INSERT INTO  DRAGONS values ('Bolong','M',213,2751,'oui','macho');
INSERT INTO  DRAGONS values ('Miloch','M',83,718,'oui','timide');
INSERT INTO  DRAGONS values ('Nessie','M',168,1721,'non','absent');
INSERT INTO  DRAGONS values ('Tarak','F',123,851,'oui','timide');
INSERT INTO  DRAGONS values ('Solong','M',173,1481,'oui','sincere');


INSERT INTO NOURRITURE values ('pomme',7);
INSERT INTO NOURRITURE values ('cacahuete',10);
INSERT INTO NOURRITURE values ('orange',25);
INSERT INTO NOURRITURE values ('oeuf',15);
INSERT INTO NOURRITURE values ('ver',3);
INSERT INTO NOURRITURE values ('poisson',35);


INSERT INTO AIME values ('Smeagol','Negueth','passionnement');
INSERT INTO AIME values ('Birduth','Negueth','beaucoup');
INSERT INTO AIME values ('Bolong','Negueth','a la folie');
INSERT INTO AIME values ('Negueth','Miloch','a la folie');
INSERT INTO AIME values ('Tarak','Bolong','un peu');
INSERT INTO AIME values ('Solong','Tarak','beaucoup');
INSERT INTO AIME values ('Nessie','MissToc','beaucoup');
INSERT INTO AIME values ('MissToc','Nessie','beaucoup');

INSERT INTO REPAS values ('Smeagol','cacahuete',1000);
INSERT INTO REPAS values ('Smeagol','pomme',16);
INSERT INTO REPAS values ('Birduth','oeuf',4);
INSERT INTO REPAS values ('Negueth','orange',6);
INSERT INTO REPAS values ('Negueth','oeuf',1);
INSERT INTO REPAS values ('Miloch','ver',53);
INSERT INTO REPAS values ('Miloch','cacahuete',100);
INSERT INTO REPAS values ('Nessie','poisson',20);
INSERT INTO REPAS values ('Tarak','pomme',10);
INSERT INTO REPAS values ('Tarak','orange',10);
INSERT INTO REPAS values ('Solong','oeuf',6);
INSERT INTO REPAS values ('Solong','poisson',1);
INSERT INTO REPAS values ('Solong','orange',2);
INSERT INTO REPAS values ('Solong','ver',11);
INSERT INTO REPAS values ('Solong','cacahuete',999);
INSERT INTO REPAS values ('Solong','pomme',2);

commit;

-- 1
SELECT dragon FROM  DRAGONS WHERE cracheFeu='oui';

-- 2
SELECT dragon FROM DRAGONS WHERE cracheFeu='oui' AND sexe='M';

-- 3
SELECT dragon FROM DRAGONS WHERE cracheFeu='non' AND sexe='F';

-- 4
SELECT dragonAimant FROM AIME;
-- 5
SELECT dragonAimant, dragonAime FROM AIME WHERE force='passionnement';

-- 6
SELECT dragon FROM REPAS WHERE produit='oeuf';

-- 7
SELECT dragon FROM DRAGONS
MINUS
SELECT dragonAimant FROM AIME;

-- 8
SELECT A1.dragonAimant, A2.dragonAimant FROM AIME A1, AIME A2 WHERE
A1.dragonAimant=A2.dragonAime AND A2.dragonAimant=A1.dragonAime;

-- 9
SELECT dragon FROM DRAGONS
MINUS
SELECT dragon FROM REPAS;

-- 10
SELECT dragon FROM DRAGONS
MINUS
SELECT dragonAimant FROM AIME
INTERSECT
SELECT dragon FROM DRAGONS
MINUS
SELECT dragon FROM REPAS;

-- les divisions sont traitees de differentes manieres
-- 11a division au travers d'une double différence
CREATE VIEW  produitsNonIngeres AS
SELECT dragon, n.produit
FROM REPAS, NOURRITURE N
MINUS
SELECT dragon, produit
FROM REPAS;

SELECT dragon FROM REPAS
MINUS
SELECT dragon FROM produitsNonIngeres;

-- 11b au travers d'un partitionnement
SELECT dragon from REPAS
GROUP BY dragon
HAVING COUNT(produit) = (SELECT COUNT(*)
                                FROM NOURRITURE);

-- 11c au travers d'un double NOT EXISTS
SELECT distinct dragon from REPAS R1
WHERE NOT EXISTS (SELECT * FROM NOURRITURE N
WHERE NOT EXISTS ( SELECT * from REPAS R2
WHERE R1.dragon=R2.dragon AND R2.produit=N.produit));

-- parfois macho est pris dans le sens juste du comportement amoureux
-- et parfois dans le sens du sexe M et du comportement amoureux
-- 12a au travers d'une double difference
-- vue dragonnes
CREATE VIEW dragonnes AS
SELECT dragon FROM DRAGONS
WHERE sexe='F';

-- vue machos
CREATE VIEW machos AS
SELECT dragon FROM DRAGONS
WHERE comportementAmoureux='macho';

-- différence 1
CREATE VIEW leContraireDeAime AS
SELECT d.dragon as dragonAime, m.dragon as dragonAimant
FROM dragonnes d, machos m
MINUS
SELECT dragonAime, dragonAimant
FROM AIME;

-- difference 2
SELECT dragon from dragonnes
MINUS
SELECT dragonAime
FROM leContraireDeAime;

-- 12b partitionnement
SELECT dragonAime FROM AIME, DRAGONS D1, DRAGONS D2
WHERE D1.sexe='F' AND dragonAime=D1.dragon AND dragonAimant=D2.dragon
AND D2.comportementAmoureux='macho'
GROUP BY dragonAime HAVING COUNT(dragonAimant) =
(SELECT COUNT(*) FROM DRAGONS WHERE comportementAmoureux='macho');

-- 12c  au travers d'un double NOT EXISTS
SELECT distinct A1.dragonAime FROM AIME A1, DRAGONS D1
WHERE A1.dragonAime=D1.dragon AND D1.sexe='F'
AND NOT EXISTS (SELECT * FROM DRAGONS D2
WHERE D2.comportementAmoureux='macho' and D2.sexe='M'
AND NOT EXISTS (SELECT * FROM AIME A2
WHERE A1.dragonAime=A2.dragonAime and D2.dragon=A2.dragonAimant));

