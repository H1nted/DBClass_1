


Drop table Ligne cascade constraints;
Drop table Station cascade constraints;
Drop table Liaison cascade constraints;


Create TABLE Ligne (
    libelle varchar(10) CONSTRAINT ligne_pk PRIMARY KEY,
    nomReseau varchar(20)
);

Create TABLE Station (
    nomStation varchar(20) CONSTRAINT Station_pk PRIMARY KEY,
    localisation varchar(3),
    zone integer
);

Create TABLE Liaison (
    idLiaison varchar(5) CONSTRAINT Liaison_pk PRIMARY KEY,
    distance float,
    libelleLigne varchar(10),
    StationDepart varchar(20),
    StationArrivee varchar(20),
    CONSTRAINT Liaison_fk1 FOREIGN KEY (libelleLigne) 
    REFERENCES Ligne(libelle),
    CONSTRAINT Liaison_fk2 FOREIGN KEY (StationDepart) 
    REFERENCES Station(nomStation),    
    CONSTRAINT Liaison_fk3 FOREIGN KEY (StationArrivee) 
    REFERENCES Station(nomStation)
);

--* 1 le nom et la zone des stations de la base
select nomstation, zone 
    from station ;

--*2 e nombre des stations qui sont situ ́ees dans la zone 1
select count(*) 
    from station
        where zone = 1;

--* 3les liaisons (identifiant, nom station d ́epart, nom Station arriv ́ee) de la ligne 6

select idLiaison, stationDepart, stationarrivee 
    from liaison 
        where libelleLigne = '6';

--*4  la distance moyenne des liaisons
select avg(distance) from Liaison;
select sum(distance)/count(distance) from liaison;

--*5 les informations (identifiant, stations de depart et d’arrivee) sur la liaison qui a la plus longue distance
select idLiaison, stationDepart, stationarrivee 
    from liaison
        where distance = (select max(distance) from liaison);

select idLiaison, stationDepart, stationarrivee 
    from liaison
        order by distance desc
        fetch first 1 row only;

--*6 Donnez les stations (nom de station et localisation) qui se situent sur la ligne 6

select nomstation, localisation
    from station , liaison 
        where stationDepart = nomStation
        and libelleLigne='6';

--* 7 Donnez les stations (nom de station) qui se situent sur des lignes qui appartiennent entierement a la RATP (nomReseau)

select distinct nomstation 
from station, liaison, ligne
    where (stationDepart = nomStation or stationArrivee = nomStation)
    AND libelleLigne = libelle
    AND nomReseau ='RATP';

--*8 les stations terminus (nom de station et localisation) (par rapport aux tuples), a savoir, qui ne sont pas proposees comme stations de depart de liaisons
select nomStation, localisation 
    from station 
    where nomStation not in (select stationDepart from Liaison); 


--*9 les stations de correspondance (nom de station et localisation), a savoir, qui sont partagees par plusieurs lignes

select nomStation 
    from Station, Liaison 
        where nomStation=StationArrivee or nomStation=StationDepart
        group by nomStation having count(distinct libelleLigne)>1;
