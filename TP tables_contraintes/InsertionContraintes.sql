

-- * Supression des potentiels tableaux qui ont le même noms
prompt supression des tables existants qui ont le même nom;

Drop table Employe cascade CONSTRAINT;
Drop table Departement cascade CONSTRAINT;

-- * Creation des tableaux 

prompt creation des tableaux Employe et Departement ;

Create TABLE Departement (
    n_departement number(3),
    nom varchar(14),
    lieu varchar(13),
    CONSTRAINT Departement_pk PRIMARY KEY (n_departement)
);
Create TABLE Employe (
    nom VARCHAR(20),
    num number(5),
    fonction VARCHAR(15),
    n_sup number(5),
    Embauche_Date date,
    salaire number(7,2),
    commision number(3),
    n_departement number(3),
    CONSTRAINT Employe_pk PRIMARY KEY (num),
    CONSTRAINT Employe_fk FOREIGN KEY (n_departement) 
        REFERENCES Departement (n_departement)
);


--* pour les dates
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_TERRITORY = AMERICA;

update employe set nom = 'Wassim' where  num = 16712 ;-- y a deux martins
Alter table employe ADD constraint nom_u Unique(nom);

update employe set n_sup = 16712 where n_sup = 24533 ; -- numero 24533 ne correspond a aucun employe
ALter table employe ADD constraint responsable FOREIGN key(n_sup)
    REFERENCES employe (num) ;

Alter table employe ADD constraint commisonCons check (commision is not null and fonction ='commercial') or
 (commision is null and fonction <> 'commercial');

alter table employe add constraitn commission check((fonction))




