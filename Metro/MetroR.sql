
prompt 1 : donnez le nom et la zone des stations de metro de la base 

select nomStation, zone from station;


prompt 2 : donnez les liaisons (identifiant, nom station depart, nom Station arrivee) de la ligne 6

select IdLiaison, StationDepart, StationArrivee from Liaison where
LibelleLigne='6'; 

prompt 3 donnez les stations (nom de station et localisation) qui se situent sur la ligne 6 (attention petite subtilite pour la jointure et parenth�ses)

select distinct nomStation, localisation from station, liaison 
where libelleLigne='6' and (nomstation=StationArrivee or nomStation=StationDepart);

prompt autre solution possible

select distinct nomStation, localisation from station where
nomStation in (select StationDepart from Liaison where libelleLigne='6' UNION select StationArrivee from Liaison where libelleLigne='6');

prompt ou encore
select distinct nomStation,localisation from station ,liaison where libelleligne ='6' and nomstation in (stationdepart , stationarrivee);


prompt 4 donnez les stations (nom de station) qui se situent sur des lignes qui appartiennent entierement � la RATP (nomReseau)

select distinct nomStation 
    from station, liaison, ligne 
        where libelleLigne=libelle 
        and nomReseau='RATP' 
        and (nomstation=StationArrivee or nomStation=StationDepart);

prompt 5 donner les stations terminus (nom de station et localisation), � savoir qui ne sont pas propos�es comme stations de d�part de liaisons
select nomStation, localisation from station where nomStation not in (select stationDepart from Liaison); 


prompt 6 donner le nombre des stations qui sont situ�es dans la zone 1 
select count(nomStation) from Station where zone=1;

prompt 7 donner les informations (identifiant, stations depart et arrivee) sur la liaison qui a la plus longue distance
select idLiaison, distance, StationArrivee, StationDepart from Liaison where distance >= ALL(select distance from liaison);

prompt autre solution possible
select idLiaison, distance, StationArrivee, StationDepart from Liaison where distance =(select max(distance) from liaison);  


prompt 8 donner la distance moyenne des liaisons
select avg(distance) from Liaison;


prompt 9 donner les stations de correspondance (nom de station et localisation) 
select nomStation from Station, Liaison 
where nomStation=StationArrivee or nomStation=StationDepart
group by nomStation having count(distinct libelleLigne)>1;



prompt 10 donner les lignes qui traversent plusieurs zones
select libelleLigne, count(distinct zone) from Station, Liaison where nomStation=StationDepart or nomStation=StationArrivee group by libelleLigne having count(distinct zone)>1;

prompt 11 donner les lignes dont toutes les stations se situent dans une seule et unique zone

select libelleLigne from Station, Liaison where nomStation=StationDepart or nomStation=StationArrivee group by libelleLigne having count(distinct zone)=1;
