set linesize 132
col nomA heading '|nomVoyageur' for a10

ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_TERRITORY = AMERICA;

prompt suppression des tables

Drop table ligne cascade constraints;
Drop table liaison cascade constraints;
Drop table station cascade constraints;

prompt creation des tables



Create table Ligne(libelle varchar(10), nomReseau varchar(10));

Create table Station(nomStation varchar(20), localisation varchar(3), zone integer);

Create table Liaison(idLiaison varchar(5), distance float, libelleLigne varchar(10), StationDepart varchar(20), StationArrivee varchar(20));



prompt creation des contraintes
Alter table Voyageur add constraint voyag_pk primary key (nomV,prenomV);
Alter table Ligne add constraint ligne_pk primary key (libelle);
Alter table Station add constraint station_pk primary key (nomStation);
Alter table Liaison add constraint liaison_pk primary key (idLiaison);
Alter table Emprunte add constraint emprunte_pk primary key (nomV,prenomV,nomStationOrigine,nomStationFinale,dateVoyage);
Alter table Liaison add constraint liaison_fk_ligne foreign key(libelleLigne) references Ligne(libelle) on delete cascade;
Alter table Liaison add constraint liaison_fk1_station foreign key(StationDepart) references Station(nomStation);
Alter table Liaison add constraint liaison_fk2_station foreign key(StationArrivee) references Station(nomStation);
Alter table Emprunte add constraint Emprunte_fk_voyageur foreign key(nomV,prenomV) references Voyageur(nomV,prenomV) on delete cascade;
Alter table Emprunte add constraint Emprunte_fk1_station foreign key(nomStationOrigine) references Station(nomStation) on delete cascade;
Alter table Emprunte add constraint Emprunte_fk2_station foreign key(nomStationFinale) references Station(nomStation) on delete cascade;

Alter table Voyageur add constraint dom_genre check(genre in ('M','F'));
Alter table Ligne add constraint dom_nomReseau check(nomreseau in ('SNCF','RATP','SNCF-RATP'));


