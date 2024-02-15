-- !  ssh -A -Y wassim.ammar@etu.umontpellier.fr@x2go.umontpellier.fr

-- !  rlwrap sqlplus e20170010657/oracle@oracle.etu.umontpellier.fr:1523/pmaster

-- todo -->  set linesize 200

-- * col  for a25 
-- * desc  ;
-- * select * from cat;
-- * all strings are 'STRINGS'

-- todo --> col OWNER for a15
-- todo --> col CONSTRAINT_NAME for a20
-- todo --> col constraint_type for a15
-- todo --> col TABLE_NAME for a15
-- todo --> col R_CONSTRAINT_NAME for a20
-- todo --> col SEARCH_CONDITION for a25

Select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, SEARCH_CONDITION from user_constraints WHERE (TABLE_name = 'COMPETITION' OR table_name ='EQUIPE' OR table_name ='MATCH');

alter session set NLS_LANGUAGE='FRENCH';
alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

-- Suppression des tables
Drop table competition cascade constraints;
Drop table equipe cascade constraints;
Drop table match cascade constraints;

-- creation des tables
Create TABLE competition (
    nomCompetition varchar(18) CONSTRAINT competition_pk PRIMARY KEY,
    typeCompetition varchar(16),
    annee number(4),
    paysOrganisateur varchar(18)
);

Create TABLE equipe (
    codeEquipe varchar(18) CONSTRAINT equipe_pk PRIMARY KEY,
    nomPays varchar(18),
    genre varchar(1),
    rangInternational number(4),
    CONSTRAINT equipeGenre check (genre in ('h','f'))
);

Create TABLE match (
    codeMatch varchar(10) CONSTRAINT match_pk PRIMARY KEY,
    date_M date,
    nomCompetition varchar(20),
    equipe1 varchar(18),
    equipe2 varchar(18),
    scoreEquipe1 number(2),
    scoreEquipe2 number(2),
    niveauCompetition varchar(16),
    CONSTRAINT match_fk1 FOREIGN KEY (equipe1) 
            REFERENCES equipe (codeEquipe),
    CONSTRAINT match_fk2 FOREIGN KEY (equipe2) 
            REFERENCES equipe (codeEquipe),
    CONSTRAINT match_fk3 FOREIGN KEY (nomCompetition) 
            REFERENCES competition (nomCompetition)
);
-- Insertion des tables

-- Groupe A
insert into Equipe values ('Equateur_h','Equateur','h',44);
insert into Equipe values ('Senegal_h','Senegal','h',18);
insert into Equipe values ('Pays_Bas_h','Pays Bas','h',8);
insert into Equipe values ('Qatar_h','Qatar','h',50);
-- Groupe B
insert into Equipe values ('Iran_h','Iran','h',20);
insert into Equipe values ('Etats_Unis_h','Etats Unis','h',16);
insert into Equipe values ('Angleterre_h','Angleterre','h',5);
insert into Equipe values ('Pays_de_Galles_h','Pays de Galles','h',19);
-- Groupe C
insert into Equipe values ('Pologne_h','Pologne','h',26);
insert into Equipe values ('Argentine_h','Argentine','h',3);
insert into Equipe values ('Mexique_h','Mexique','h',13);
insert into Equipe values ('Arabie_Saoudite_h','Arabie Saoudite','h',51);
-- Groupe D
insert into Equipe values ('Tunisie_h','Tunisie','h',30);
insert into Equipe values ('France_h','France','h',4);
insert into Equipe values ('Australie_h','Australie','h',38);
insert into Equipe values ('Danemark_h','Danemark','h',10);
-- Groupe E
insert into Equipe values ('Japon_h','Japon','h',24);
insert into Equipe values ('Espagne_h','Espagne','h',7);
insert into Equipe values ('Costa_Rica_h','Costa Rica','h',31);
insert into Equipe values ('Allemagne_h','Allemagne','h',11);
-- Groupe F
insert into Equipe values ('Croatie_h','Croatie','h',12);
insert into Equipe values ('Belgique_h','Belgique','h',2);
insert into Equipe values ('Canada_h','Canada','h',41);
insert into Equipe values ('Maroc_h','Maroc','h',4);
-- Groupe G
insert into Equipe values ('Cameroun_h','Cameroun','h',43);
insert into Equipe values ('Uruguay_h','Uruguay','h',14);
insert into Equipe values ('Portugal_h','Portugal','h',9);
insert into Equipe values ('Ghana_h','Ghana','h',61);
-- Groupe H
insert into Equipe values ('Serbie_h','Serbie','h',21);
insert into Equipe values ('Suisse_h','Suisse','h',15);
insert into Equipe values ('Bresil_h','Bresil','h',1);
insert into Equipe values ('Coree_du_Sud_h','Coree du Sud','h',28);

-- Equipe féminine
insert into Equipe values ('Etats_Unis_f','Etats Unis','f',1);
insert into Equipe values ('Suede_f','Suede','f',2);
insert into Equipe values ('Allemagne_f','Allemagne','f',3);
insert into Equipe values ('Angleterre_f','Angleterre','f',4);
insert into Equipe values ('France_f','France','f',5);
insert into Equipe values ('Espagne_f','Espagne','f',6);
insert into Equipe values ('Canada_f','Canada','f',7);
insert into Equipe values ('Pays_Bas_f','Pays Bas','f',8);
insert into Equipe values ('Bresil_f','Bresil','f',9);

-- Insertion compétition
insert into Competition values ('FIFA_2022','masculin',2022,'Qatar');
insert into Competition values ('FIFA_2019','feminin',2019,'France');

--Matchs de poule
insert into Match values ('poule_A_1','20/11/22','FIFA_2022','Equateur_h','Qatar_h',2,0,'poule_A');
insert into Match values ('poule_B_1','21/11/22','FIFA_2022','Angleterre_h','Iran_h',6,2,'poule_B');
insert into Match values ('poule_A_2','21/11/22','FIFA_2022','Senegal_h','Pays_Bas_h',0,2,'poule_A');
insert into Match values ('poule_B_2','21/11/22','FIFA_2022','Etats_Unis_h','Pays_de_Galles_h',1,1,'poule_B');
insert into Match values ('poule_C_1','22/11/22','FIFA_2022','Arabie_Saoudite_h','Argentine_h',2,1,'poule_C');
insert into Match values ('poule_D_1','22/11/22','FIFA_2022','Tunisie_h','Danemark_h',0,0,'poule_D');
insert into Match values ('poule_C_2','22/11/22','FIFA_2022','Mexique_h','Pologne_h',2,1,'poule_C');
insert into Match values ('poule_D_2','22/11/22','FIFA_2022','France_h','Australie_h',4,1,'poule_D');
insert into Match values ('poule_F_1','23/11/22','FIFA_2022','Maroc_h','Croatie_h',0,0,'poule_F');
insert into Match values ('poule_E_1','23/11/22','FIFA_2022','Allemagne_h','Japon_h',1,2,'poule_E');
insert into Match values ('poule_E_2','23/11/22','FIFA_2022','Espagne_h','Costa_Rica_h',7,0,'poule_E');
insert into Match values ('poule_F_2','23/11/22','FIFA_2022','Belgique_h','Canada_h',1,0,'poule_F');
insert into Match values ('poule_G_1','24/11/22','FIFA_2022','Suisse_h','Cameroun_h',1,0,'poule_G');
insert into Match values ('poule_H_1','24/11/22','FIFA_2022','Uruguay_h','Coree_du_Sud_h',0,0,'poule_H');
insert into Match values ('poule_H_2','24/11/22','FIFA_2022','Portugal_h','Ghana_h',3,2,'poule_H');
insert into Match values ('poule_G_2','24/11/22','FIFA_2022','Bresil_h','Serbie_h',2,0,'poule_G');
insert into Match values ('poule_B_3','25/11/22','FIFA_2022','Pays_de_Galles_h','Iran_h',0,2,'poule_B');
insert into Match values ('poule_A_3','25/11/22','FIFA_2022','Qatar_h','Senegal_h',1,3,'poule_A');
insert into Match values ('poule_A_4','25/11/22','FIFA_2022','Pays_Bas_h','Equateur_h',1,1,'poule_A');
insert into Match values ('poule_B_4','25/11/22','FIFA_2022','Angleterre_h','Etats_Unis_h',0,0,'poule_B');
insert into Match values ('poule_C_3','26/11/22','FIFA_2022','Pologne_h','Arabie_Saoudite_h',2,0,'poule_C');
insert into Match values ('poule_D_3','26/11/22','FIFA_2022','Tunisie_h','Australie_h',0,1,'poule_D');
insert into Match values ('poule_C_4','26/11/22','FIFA_2022','Argentine_h','Mexique_h',2,0,'poule_C');
insert into Match values ('poule_D_4','26/11/22','FIFA_2022','France_h','Danemark_h',2,1,'poule_D');
insert into Match values ('poule_E_3','27/11/22','FIFA_2022','Japon_h','Costa_Rica_h',0,1,'poule_E');
insert into Match values ('poule_E_4','27/11/22','FIFA_2022','Espagne_h','Allemagne_h',1,1,'poule_E');
insert into Match values ('poule_F_3','27/11/22','FIFA_2022','Belgique_h','Maroc_h',0,2,'poule_F');
insert into Match values ('poule_F_4','27/11/22','FIFA_2022','Croatie_h','Canada_h',4,1,'poule_F');
insert into Match values ('poule_G_3','28/11/22','FIFA_2022','Cameroun_h','Serbie_h',3,3,'poule_G');
insert into Match values ('poule_G_4','28/11/22','FIFA_2022','Bresil_h','Suisse_h',1,0,'poule_G');
insert into Match values ('poule_H_3','28/11/22','FIFA_2022','Coree_du_Sud_h','Ghana_h',2,3,'poule_H');
insert into Match values ('poule_H_4','28/11/22','FIFA_2022','Portugal_h','Uruguay_h',2,0,'poule_H');
insert into Match values ('poule_A_5','29/11/22','FIFA_2022','Pays_Bas_h','Qatar_h',2,0,'poule_A');
insert into Match values ('poule_A_6','29/11/22','FIFA_2022','Equateur_h','Senegal_h',1,2,'poule_A');
insert into Match values ('poule_B_5','29/11/22','FIFA_2022','Iran_h','Etats_Unis_h',0,1,'poule_B');
insert into Match values ('poule_B_6','29/11/22','FIFA_2022','Pays_de_Galles_h','Angleterre_h',0,3,'poule_B');
insert into Match values ('poule_D_5','30/11/22','FIFA_2022','Australie_h','Danemark_h',1,0,'poule_D');
insert into Match values ('poule_D_6','30/11/22','FIFA_2022','Tunisie_h','France_h',1,0,'poule_D');
insert into Match values ('poule_C_5','30/11/22','FIFA_2022','Pologne_h','Argentine_h',0,2,'poule_C');
insert into Match values ('poule_C_6','30/11/22','FIFA_2022','Arabie_Saoudite_h','Mexique_h',1,2,'poule_C');
insert into Match values ('poule_F_5','01/12/22','FIFA_2022','Croatie_h','Belgique_h',0,0,'poule_F');
insert into Match values ('poule_F_6','01/12/22','FIFA_2022','Canada_h','Maroc_h',1,2,'poule_F');
insert into Match values ('poule_E_5','01/12/22','FIFA_2022','Costa_Rica_h','Allemagne_h',2,4,'poule_E');
insert into Match values ('poule_E_6','01/12/22','FIFA_2022','Japon_h','Espagne_h',2,1,'poule_E');
insert into Match values ('poule_H_5','02/12/22','FIFA_2022','Ghana_h','Uruguay_h',0,2,'poule_H');
insert into Match values ('poule_H_6','02/12/22','FIFA_2022','Coree_du_Sud_h','Portugal_h',2,1,'poule_H');
insert into Match values ('poule_G_5','02/12/22','FIFA_2022','Cameroun_h','Bresil_h',1,0,'poule_G');
insert into Match values ('poule_G_6','02/12/22','FIFA_2022','Serbie_h','Suisse_h',2,3,'poule_G');
insert into Match values ('huitieme_1','03/12/22','FIFA_2022','Argentine_h','Australie_h',2,1,'huitieme');
insert into Match values ('huitieme_2','03/12/22','FIFA_2022','Etats_Unis_h','Pays_Bas_h',1,3,'huitieme');
insert into Match values ('huitieme_3','04/12/22','FIFA_2022','France_h','Pologne_h',3,1,'huitieme');
insert into Match values ('huitieme_4','04/12/22','FIFA_2022','Senegal_h','Angleterre_h',0,3,'huitieme');

commit;



--LES REQUÊTES

--* 1// le nom (nomCompetition) et l’année (annee) de l’ensemble des compétitions :
select nomCompetition, annee
    from competition;

--* 2// Pour chaque équipe masculine (genre), donner le nom du pays (nomPays) et le rang de léquipe au niveau international (rangInternational) trié sur le rang de léquipe (tri descendant) :
--*RAJOUTER LE GENRE POUR ETRE SUR !
select nomPays, rangInternational, genre
    from equipe
        where (genre = 'h')
order by rangInternational;

--* 3// Donner le nombre d’équipes féminines :
select count(*) as Equipes_Feminines
    from equipe
        where (genre = 'f');

--* 4// Donner le code (codeMatch) et la date des matchs (date_M), ainsi que le pays organisateur (paysOrganisateur) de la compétition FIFA 2022
select m.codeMatch, m.date_M, c.paysOrganisateur, c.nomCompetition as Competition
    from match m, competition c
        where m.nomCompetition = c.nomCompetition
        and c.nomCompetition = 'FIFA_2022';

--* 5// Donner le nom du pays (nomPays) et le rang (rangInternational) des équipes qui ont joué au moins un match de la coupe FIFA 2022
select distinct nomPays, rangInternational
    from equipe , match m, competition c
        where (c.nomCompetition = m.nomCompetition)
        and (c.nomCompetition ='FIFA_2019')
        and ((codeEquipe = m.equipe1)
        or (codeEquipe = m.equipe2));

--* 6// Donner le nom du pays (nomPays) et le rang (rangInternational) des équipes qui ont gagné au moins un match de la coupe FIFA 2022
select distinct nomPays, rangInternational
    from equipe , match m, competition c 
        where (c.nomCompetition = m.nomCompetition)
        and (m.nomCompetition ='FIFA_2022')
        and ((codeEquipe = equipe1 and scoreEquipe1 > scoreEquipe2)
        or (codeEquipe = equipe2 and scoreEquipe2 > scoreEquipe1));

--* 7// Donner le nom du pays (nomPays) et le rang des équipes féminines qui sont mieux classées que leurs homologues masculins (équipes masculines du même pays)
--* le select genre est pour bien verifier que ce sont les equipes feminines
select e2.nomPays, e2.rangInternational, e2.genre
    from equipe e1, equipe e2
        where e1.nomPays = e2.nompays
        and e2.genre =('f')
        and e1.genre=('h')
        and (e2.rangInternational < e1.rangInternational);


--*8// Donner le nom du pays (nomPays) et le rang (rangInternational) des équipes qui n’ont perdu aucun match (ces équipes ont toutefois pu faire match nul

--* Sachant que dans la question 6 on a choisi les équipes qui ont au moins gagné un match, j'ai pris cette requete et j'ai enlevé les equipes qui ont perdu au moins un match (qui est just l'inverse de la premiere requête)

select distinct nomPays, rangInternational
    from equipe , match 
        where ((codeEquipe = equipe1 and scoreEquipe1 > scoreEquipe2)
        or (codeEquipe = equipe2 and scoreEquipe2 > scoreEquipe1))
                    MINUS
select distinct nomPays, rangInternational
    from equipe , match 
        where ((codeEquipe = equipe1 and scoreEquipe1 < scoreEquipe2)
        or (codeEquipe = equipe2 and scoreEquipe2 < scoreEquipe1));

--*9 // Donner le nom du pays, ainsi que le nombre de matchs remportés, des équipes (oude l’équipe) qui ont/a gagné le plus de matchs

--* Ici j'ai enlevé le distinct pour voir tous les matchs gagnés par le nomPays, puis j'effectue un count pour regrouper tous les matchs gagnés par chaque pays, finalement je rajoute la condition having() pour afficher les pays avec le plus grands nombre de matchs gagnés

select nomPays, count(nomPays) as Match_gagnes
    from equipe, match
        where (codeEquipe = equipe1 and scoreEquipe1 > scoreEquipe2)
        or (codeEquipe = equipe2 and scoreEquipe2 > scoreEquipe1)
    group by nomPays
            HAVING count(nomPays) > ALL (
                select count(nomPays) 
                    from equipe, match 
                        where (codeEquipe = equipe1 and scoreEquipe2 > scoreEquipe2) 
                        or (codeEquipe = equipe2 and scoreEquipe2> scoreEquipe1) 
                    group by nomPays);



--* le rang du maroc est  4 dans la base de données ce qui est desorientant























