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

Select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, SEARCH_CONDITION from user_constraints WHERE (TABLE_name = 'EQUIPE' OR table_name ='CYCLISTE' OR table_name ='ETAPE');

ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_TERRITORY = AMERICA;

-- Suppression des tables
Drop table Equipe cascade constraints;
Drop table Cycliste cascade constraints;
Drop table Etape cascade constraints;

-- creation des tables
Create TABLE Equipe (
    nomE varchar(20) CONSTRAINT equipe_pk PRIMARY KEY,
    paysE varchar(16)
);

Create TABLE Cycliste (
    codeC varchar(6) CONSTRAINT cycliste_pk PRIMARY KEY,
    nomC varchar(20),
    prenomC varchar (20),
    paysC varchar(16),
    dateN date,
    nomEquipe varchar(20),
    CONSTRAINT Cycliste_fk FOREIGN KEY (nomEquipe) 
                    REFERENCES Equipe(nomE)
);

Create TABLE Etape (
    codeE varchar(6) CONSTRAINT etape_pk PRIMARY KEY,
    villeDepart varchar(25),
    villeArrivee varchar(25),
    distance float,
    dateE date,
    typeEtape varchar(20),
    codeGagnant varchar(6),
    CONSTRAINT etape_fk FOREIGN KEY (codeGagnant) 
                    REFERENCES Cycliste(codeC)
);

--* 1 les cyclistes (nom, prenom, date de naissance) Espagnols ou Portugais (dont le pays est l’Espagne ou le Portugal)

select nomC, prenomC, dateN 
    from Cycliste 
        where paysC = 'Espagne'
        or paysC = 'Portugal';

--* 2  les cyclistes (nom, prenom) qui sont du mˆeme pays que l’´equipe pour laquelle ils courent

select nomC, prenomC, paysc, nome
    from Cycliste, Equipe
    where nomEquipe = nomE
    AND paysC = paysE;

--* 3  le nombre d’etapes de montagne

select count(typeEtape) 
    from Etape
        where typeEtape='montagne';

--* 4  la distance de l’etape la plus longue, la plus courte, la distance moyenne des ´etapes et le nombre total de kilometres parcourus

select sum(distance) as Somme, avg(distance) as Moyenne, max(distance) as Longue,min(distance) as Courte
    from etape;

--* 5  le nom et le prenom des cyclistes qui ont gagne au moins une ´etape

select nomC, prenomC
    from cycliste, etape
        where codeGagnant=codeC;

--* 6 le code des cyclistes qui n’ont gagne aucune etape

Select prenomC, codeC
    from cycliste
    where codeC not in (select codeGagnant from etape);

--* 7 pour les cyclistes qui ont gagne au moins une etape de plaine, leur nom mais aussi le nom de leur equipe et le pays d’origine de leur equipe

select nomC, prenomC, nomE, paysE
    from cycliste, etape, equipe
        where codeGagnant = codeC
        AND nomE = nomEquipe
        AND typeEtape ='plaine';

--*8 le nombre de victoires par equipe (tous cyclistes de l´equipe confondus)

select nomEquipe, count(*) as victoires 
    from Cycliste, Etape 
    where codeC = codeGagnant
    group by nomEquipe;

--*9 l’equipe qui a remporte le plus de victoires (tous cyclistes de l’equipe confondus)
select nomEquipe, count(*) as victoires 
    from Cycliste, Etape 
    where codeC = codeGagnant 
        group by nomEquipe 
            having count(*) >= ALL(select count(*) from Cycliste, Etape where codeC = codeGagnant group by nomEquipe);


select codeGagnant 
    from Etape
        where typeEtape='contre-la-montre' 
        group by codeGagnant 
        having count(*) = (select count(*) from Etape where typeEtape='contre-la-montre');