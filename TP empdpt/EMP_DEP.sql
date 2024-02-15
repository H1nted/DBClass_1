Drop table DEPT ;
Drop table EMP ;

Create TABLE DEPT (
    n_departement number(3),
    nom varchar(14),
    lieu varchar(13)
);
Create TABLE EMP (
    nom VARCHAR(20),
    num number(5),
    fonction VARCHAR(15),
    n_sup number(5),
    Embauche_Date date,
    salaire number(7,2),
    commision number(3),
    n_departement number(3)
);