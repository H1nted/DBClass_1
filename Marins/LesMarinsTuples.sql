--SCRIPT de creation et remplissage de tables

ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_TERRITORY = AMERICA;

DROP TABLE PARTICIPE;
DROP TABLE NAVIGATEUR;
DROP TABLE COURSE;

-- creation Course à faire

INSERT INTO COURSE VALUES
        (1, 'Route du Rhum','4-nov-2018','Saint Malo','Pointe a Pitre','Ultime');
INSERT INTO COURSE VALUES
        (2, 'Route du Rhum','4-nov-2018','Saint Malo','Pointe a Pitre','Class40');
INSERT INTO COURSE VALUES
        (3, 'Route du Rhum','4-nov-2018','Saint Malo','Pointe a Pitre','R-Multi');
INSERT INTO COURSE VALUES
        (4, 'Route du Rhum','2-nov-2014','Saint Malo','Pointe a Pitre','Ultime');
INSERT INTO COURSE VALUES
        (5, 'Route du Rhum','2-nov-2014','Saint Malo','Pointe a Pitre','R-Multi');
INSERT INTO COURSE VALUES
        (6, 'Route du Rhum','9-nov-2002','Saint Malo','Pointe a Pitre','Imoca');
INSERT INTO COURSE VALUES
        (7, 'Transat Jacques Vabre','5-nov-2017','Le Havre','Salvador de Bahia','Class40');
INSERT INTO COURSE VALUES
        (8, 'Transat Anglaise','11-may-2008','Plymouth','Boston','Imoca');
INSERT INTO COURSE VALUES
        (9, 'Transat Anglaise','11-may-2008','Plymouth','Boston','Class40');
INSERT INTO COURSE VALUES
        (10, 'Transat Jacques Vabre','4-nov-1993','Le Havre','Carthagene','Class40');
INSERT INTO COURSE VALUES
        (11, 'Transat Jacques Vabre','5-nov-2017','Le Havre','Salvador de Bahia','Imoca');
INSERT INTO COURSE VALUES
        (12, 'Vendee Globe','6-nov-2016','Les Sables d''Olonne','Les Sables d''Olonne','Imoca');

-- creation Navigateur à faire

INSERT INTO NAVIGATEUR VALUES
        (1, 'Peyron','Loick','h','1-dec-1959','France');
INSERT INTO NAVIGATEUR VALUES
        (2, 'MacArthur','Ellen','f','8-jul-1976','Royaume-Uni');
INSERT INTO NAVIGATEUR VALUES
        (3, 'Merron','Miranda','f','2-jul-1969','Royaume-Uni');
INSERT INTO NAVIGATEUR VALUES
        (4, 'Mabire','Halvard','h','18-nov-1956','France');
INSERT INTO NAVIGATEUR VALUES
        (5, 'Joyon','Francis','h',' 28-may-1956','France');
INSERT INTO NAVIGATEUR VALUES
        (6, 'Antoine','Pierre','h','2-mar-1962','France');
INSERT INTO NAVIGATEUR VALUES
        (7, 'Corre','Francois','h','23-dec-1981','France');
INSERT INTO NAVIGATEUR VALUES
        (8, 'De Pavant','Kito','h','23-feb-1961','France');
INSERT INTO NAVIGATEUR VALUES
        (9, 'De Lamotte','Tanguy','h','6-may-1978','France');
INSERT INTO NAVIGATEUR VALUES
        (10, 'Ursault Poupon','Morgane','f','10-may-1986','France');
INSERT INTO NAVIGATEUR VALUES
        (11, 'Gabart','Francois','h','23-mar-1983','France');
INSERT INTO NAVIGATEUR VALUES
        (12, 'Thomson','Alex','h','18-apr-1974','Royaume-Uni');

-- creation Participe à faire

INSERT INTO PARTICIPE VALUES
        (3,1,4,'Olmix');
INSERT INTO PARTICIPE VALUES
        (3,6,1,'Happy');
INSERT INTO PARTICIPE VALUES
        (4,1,1,'Banque populaire VII');
INSERT INTO PARTICIPE VALUES
        (6,2,1,'Kingfisher');
INSERT INTO PARTICIPE VALUES
        (6,3,7,'UUDS');
INSERT INTO PARTICIPE VALUES
        (2,3,13,'Campagne de France');
INSERT INTO PARTICIPE VALUES
        (7,3,null,'Campagne de France');
INSERT INTO PARTICIPE VALUES
        (8,1,1,'Gitana Eighty');
INSERT INTO PARTICIPE VALUES
        (9,3,7,'40 Degrees');
INSERT INTO PARTICIPE VALUES
        (9,4,5,'Custo Pol');

INSERT INTO PARTICIPE VALUES
        (10,1,3,'Fujicolor III');
INSERT INTO PARTICIPE VALUES
        (1,5,1,'Idec-Sport');
INSERT INTO PARTICIPE VALUES
        (11,8,5,'Bastide Otio');
INSERT INTO PARTICIPE VALUES
        (12,8,null,'Bastide Otio');
INSERT INTO PARTICIPE VALUES
        (11,9,6,'Initiative Coeur');
INSERT INTO PARTICIPE VALUES
        (2,10,27,'Fleury Michon');
INSERT INTO PARTICIPE VALUES
        (1,11,2,'Macif');
INSERT INTO PARTICIPE VALUES
        (12,12,2,'Hugo Boss');
INSERT INTO PARTICIPE VALUES
        (3,7,5,'Friends Lovers');
COMMIT;



-- 1. donner les nom, prénom et pays d'origine des navigatrices

-- 2. donner les libellés, date de départ et catégories de bateaux des courses dans lesquelles ont participé des bateaux de catégorie Ultime ou Classe 40


-- 3. donner les vainqueurs (nom, prénom) des courses de la Route du Rhum en catégorie de bateau Ultime

-- 4. donner le nom et le prénom des navigateurs qui n'ont pas fini au moins une course (classement non renseigné)


-- 5. donner le nom et le prénom des navigateurs qui ont participé à au moins une course à laquelle à participé Loic Peyron

-- 6. donner le nombre de courses par numéro, nom et prénom de navigateur


-- 7. donner le numéro, nom et prénom du ou des navigateurs qui ont participé au plus grand nombre de courses


-- 8. donner les navigateurs qui ont couru (participé à des courses) sur toutes les catégories de bateau 

