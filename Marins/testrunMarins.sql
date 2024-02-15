ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_TERRITORY = AMERICA;

DROP TABLE PARTICIPE cascade constraints;
DROP TABLE NAVIGATEUR cascade constraints;
DROP TABLE COURSE cascade constraints;

Create TABLE Course (
    numCourse number(3),
    libelle varchar(25),
    date_depart Date,
    lieu_depart varchar(20),
    lieu_arrivee varchar(20),
    categorie_bateau varchar(10),
    CONSTRAINT course_pk PRIMARY KEY (numCourse)
);

Create TABLE Navigateur (
    numNavigateur number(5),
    nom varchar(15),
    prenom varchar(15),
    genre varchar(1), constraint dom_genre check (genre in ('h','f')),
    dateNaissance Date,
    pays varchar(15),
    CONSTRAINT Navigateur_pk PRIMARY KEY (numNavigateur)
);

Create TABLE Participe (
    numCourse number(3),
    numNavigateur number(5),
    classement integer,
    nomBateay varchar(25),
    CONSTRAINT participe_pk1 PRIMARY KEY (numCourse, numNavigateur),
    CONSTRAINT participe_fk1 FOREIGN KEY (numCourse) 
                    REFERENCES Course (numCourse),
    CONSTRAINT participe_fk2 FOREIGN KEY (numNavigateur)
                    REFERENCES Navigateur (numNavigateur)
);

--* 1- nom prénom pays origine navigatricesss
select nom, prenom, pays from navigateur where (genre = 'f');

--* 2- libelle / date dep / categorie
select libelle, date_depart, categorie_bateau from course WHERE
(categorie_bateau='Ultime' or categorie_bateau='Class40');

--*3 nom prenom vainqueurs route rhum bateau ultime
select nom, prenom from navigateur n, participe p, course c where n.numNavigateur = p.numNavigateur 
and p.numCourse = c.numCourse and categorie_bateau = 'Ultime' and classement = 1;   

--* 4 donner le nom et le prénom des navigateurs qui n'ont pas fini au moins une course (classement non renseigné)
select nom, prenom from navigateur n, participe p where n.numNavigateur = p.numNavigateur and classement is null; 

--* 5 donner le nom et le prénom des navigateurs qui ont participé à au moins une course à laquelle à participé Loic Peyron
select n2.nom, n2.prenom from navigateur n1, participe p1, navigateur n2, participe p2  
where 
    n1.numNavigateur = p1.numNavigateur
    and n2.numNavigateur = p2.numNavigateur 
    and n1.nom='Peyron' 
    and n1.prenom ='Loick' 
    and p1.numCourse = p2.numCourse  
    and n2.nom <> 'Peyron' 
    and n2.prenom <> 'Loick' ;

--*6 donner le nombre de courses par numéro, nom et prénom de navigateur
select p.numNavigateur, nom, prenom, count(*) as participation 
from navigateur n, participe p
where   
    n.numNavigateur=p.numNavigateur
    group by p.numNavigateur, nom, prenom order by numNavigateur ;

--*7 donner le numéro, nom et prénom du ou des navigateurs qui ont participé au plus grand nombre de courses

select p.numNavigateur, nom, prenom, count(*) as participation 
from navigateur n, participe p
where   
    n.numNavigateur = p.numNavigateur
    group by p.numNavigateur, nom, prenom 
    having count(*) >= ALL (select count(*) from participe group by numNavigateur);

-- *8. donner les navigateurs qui ont couru (participé à des courses) sur toutes les catégories de bateau
select nom, prenom, n.numNavigateur 
from navigateur n, participe p, course c 
where n.numNavigateur = p.numNavigateur 
    and p.numCourse = c.numCourse 
group by n.numNavigateur, nom, prenom  
having count (distinct categorie_bateau) = 
    (select count (distinct categorie_bateau) from course);



select nom, prenom from navigateur n where not exists (
    select * from course c1 where not exists (
        select * from participe p, course c2 where               p.numNavigateur=n.numNavigateur
        and c2.numCourse = p.numCourse 
        and c1.categorie_bateau = c2.categorie_bateau )); 

