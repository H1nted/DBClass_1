
drop table Participe cascade constraints;
drop table Membre cascade constraints;
drop table Equipe cascade constraints;
--drop table Cycliste cascade constraints;
drop table Etape cascade constraints;


create table Equipe (nomE varchar(20) constraint EquipePk primary key, paysE varchar(16));

--create table Cycliste (codeC varchar(6) constraint CPk primary key, nomC varchar(20), prenomC varchar(20), paysC varchar(16), dateN date, nomEquipe varchar(20) constraint CFk references Equipe(nomE));

create table Membre (codeM varchar(6) constraint MPk primary key, nomM varchar(20), prenomM varchar(20), paysM varchar(16), dateN date, typeM varchar(10), nomEquipe varchar(20) constraint CFk references Equipe(nomE), constraint typeMembre check (typeM in ('cycliste','directeur')));

create table Etape(codeE varchar(6) constraint EPk primary key, villeDepart varchar(25), villeArrivee varchar(25), distance float, dateE date, typeEtape varchar(20), codeGagnant varchar(6) constraint EFk references Membre(codeM), constraint typeDom check (typeEtape in ('montagne','contre-la-montre','plaine')));

create table Participe(codeE varchar(6) , codeM varchar(6), constraint PPk primary key (codeE,codeM), constraint Pfk1 foreign key (codeE) references Etape(codeE), constraint Pfk2 foreign key (codeM) references Membre(codeM));

purge recyclebin;

prompt Equipe
insert into Equipe values ('MOVISTAR TEAM','Espagne');
insert into Equipe values ('TEAM SKY','Grande Bretagne');
insert into Equipe values ('LOTTO SOUDAL','Belgique');
insert into Equipe values ('TINKOFF','Russie');
insert into Equipe values ('DIMENSION DATA','Afrique du Sud');
insert into Equipe values ('AG2R LA MONDIALE','France');
insert into Equipe values ('ETIXX-QUICK STEP','Belgique');
insert into Equipe values ('GIANT ALPECIN','Allemagne');


prompt Cycliste
insert into Membre values ('16_TS1','Froome','Christopher','Grande Bretagne','20-may-1985','cycliste','TEAM SKY');
insert into Membre values ('16_TS2','Henao','Sergio Luis','Colombie','10-dec-1987','cycliste','TEAM SKY');
insert into Membre values ('16_TS3','Kiryienka','Vasili','Bielo-Russie','28-jun-1981','cycliste','TEAM SKY');
insert into Membre values ('16_TS4','Landa','Mikel','Espagne','13-dec-1989','cycliste','TEAM SKY');
insert into Membre values ('16_TS5','Nieve','Mikel','Espagne','26-may-1984','cycliste','TEAM SKY');
insert into Membre values ('16_TS6','Poels','Wouter','Pays Bas','01-oct-1987','cycliste','TEAM SKY');
insert into Membre values ('16_TS7','Rowe','Luke','Grande Bretagne','10-mar-1990','cycliste','TEAM SKY');
insert into Membre values ('16_TS8','Stannard','Ian','Grande Bretagne','25-may-1987','cycliste','TEAM SKY');
insert into Membre values ('16_TS9','Thomas','Geraint','Grande Bretagne','25-may-1986','cycliste','TEAM SKY');
--
insert into Membre values ('16_T10','T1','G1','Allemagne','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T11','T2','G2','France','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T12','T3','G3','Slovaquie','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T13','T2','G4','Australie','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T14','T2','G5','Nouvelle Zelande','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T15','T2','G6','Luxembourg','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T16','T2','G7','Danemark','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T17','T2','G8','Portugal','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T18','T2','G9','Italie','25-may-1986','cycliste','TEAM SKY');
insert into Membre values ('16_T19','T2','G10','Belgique','25-may-1986','cycliste','TEAM SKY');

--
insert into Membre values ('16_LS1','Greipel','Andre','Allemagne','16-jul-1982','cycliste','LOTTO SOUDAL');
insert into Membre values ('16_LS2','Bak','Lars','Danemark','16-jan-1980','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS3','De Gendt','Thomas','Belgique','6-nov-1986','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS4','Debusschere','Jens','Belgique','28-aug-1988','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS5','Gallopin','Tony','France','24-may-1988','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS6','Hansen','Adam','Australie','11-may-1981','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS7','Henderson','Gregory','Nouvelle Zelande','10-sep-1976','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS8','Roelandts','Jurgen','Belgique','02-may-1985','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_LS9','Sieberg','Marcel','Allemagne','30-apr-1982','cycliste','LOTTO SOUDAL'); 
insert into Membre values ('16_MV1','Quintana','Nairo','Colombie','4-feb-1990','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV2','Valverde','Alejandro','Espagne','25-apr-1980','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV3','Anacona','Andrew','Colombie','11-aug-1988','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV4','Erviti','Imanol','Espagne','15-nov-1983','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV5','Herrada','Jesus','Espagne','26-jul-1990','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV6','Izaguirre','Gorka','Espagne','7-oct-1987','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV7','Izaguirre','Ion','Espagne','4-feb-1989','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV8','Moreno','Daniel','Espagne','5-sep-1981','cycliste','MOVISTAR TEAM'); 
insert into Membre values ('16_MV9','Oliveira','Nelson','Portugal','06-mar-1989','cycliste','MOVISTAR TEAM');
insert into Membre values ('16_TK1','Sagan','Peter','Slovaquie','26-jan-1990','cycliste','TINKOFF');
insert into Membre values ('16_TK2','Contador','Alberto','Espagne','6-dec-1982','cycliste','TINKOFF'); 
insert into Membre values ('16_DD1','Cavendish','Mark','Grande Bretagne','21-may-1885','cycliste','DIMENSION DATA'); 
insert into Membre values ('16_DD2','Cummings','Stephen','Grande Bretagne','19-mar-1883','cycliste','DIMENSION DATA'); 
insert into Membre values ('16_AM1','Bardet','Romain','France',' 09-nov-1990','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM2','Bakelants','Jan','Belgique','14-feb-1986','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM3','Gougeard','Alexis','France',' 05-mar-1993','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM4','Pozzovivo','Domenico','Italie','30-nov-1982','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM5','Cherel','Mikael','France',' 17-mar-1986','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM6','Dumoulin','Samuel','France','20-aug-1980','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM7','Vuillermoz','Alexis','France','01-jun-1988','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_AM8','Gastauer','Ben','Luxembourg','14-nov-1987','cycliste','AG2R LA MONDIALE'); 
insert into Membre values ('16_EQ1','Kittel','Marcel','Allemagne','11-may-1988','cycliste','ETIXX-QUICK STEP'); 
insert into Membre values ('16_GA1','Dumoulin','Tom','Pays Bas','11-nov-1990','cycliste','GIANT ALPECIN'); 

--directeurs
insert into Membre values ('16_MD1','Arrieta','Jose Luis','Espagne','','directeur','MOVISTAR TEAM'); 
insert into Membre values ('16_MD2','Garcia Acosta','Vicente','Espagne','','directeur','MOVISTAR TEAM'); 
insert into Membre values ('16_SD1','Portal','Nicolas','France','','directeur','TEAM SKY'); 
insert into Membre values ('16_AD1','Jurdie','Julien','France','','directeur','AG2R LA MONDIALE'); 



prompt Etape
insert into Etape values ('16_2','Mont-Saint-Michel','Utah Beach',188,'2-jul-2016','plaine','16_DD1');
insert into Etape values ('16_3','Saint-Lo','Cherbourg',183,'3-jul-2016','plaine','16_TK1');
insert into Etape values ('16_4','Granville','Angers',223.5,'4-jul-2016','plaine','16_DD1');
insert into Etape values ('16_5','Saumur','Limoges',237.5,'5-jul-2016','plaine','16_EQ1');
insert into Etape values ('16_6','Limoges','Le Lioran',216,'6-jul-2016','montagne','16_DD2');
insert into Etape values ('16_7','Arpajon','Montauban',190.5,'7-jul-2016','plaine','16_DD1');
insert into Etape values ('16_8','L''Isle-Jourdain','Lac de Payolle',162.5,'8-jul-2016','montagne','16_EQ1');
insert into Etape values ('16_9','Pau','Bagneres-de-Luchon',184,'9-jul-2016','montagne','16_TS1');
insert into Etape values ('16_10','Vielha Val d''Aran','Andorre Arcalis',184.5,'10-jul-2016','montagne','16_EQ1');
insert into Etape values ('16_12','Escaldes-Engordany','Revel',197,'12-jul-2016','montagne','16_GA1');
insert into Etape values ('16_13','Carcassonne','Montpellier',162.5,'13-jul-2016','plaine','16_TK1');
insert into Etape values ('16_14','Montpellier','Mont Ventoux',184,'14-jul-2016','montagne','16_GA1');
insert into Etape values ('16_15','Bourg-Saint-Andeol','La Caverne du Pont-d''Arc',37.5,'15-jul-2016','contre-la-montre','16_TS1');
insert into Etape values ('16_16','Montelimar','Villars-les-Dombes',208.5,'16-jul-2016','plaine','16_DD1');
insert into Etape values ('16_17','Bourg-en-Bresse','Culoz',160,'17-jul-2016','montagne','16_TK2');
insert into Etape values ('16_18','Moirans-en-Montagne','Berne',209,'18-jul-2016','plaine','16_TK1');
insert into Etape values ('16_20','Berne','Finhaut-Emosson',184.5,'20-jul-2016','montagne','16_MV7');
insert into Etape values ('16_21','Sallanches','Megeve',17,'21-jul-2016','contre-la-montre','16_TS1');
insert into Etape values ('16_22','Albertville','Saint-Gervais Mont Blanc',146,'22-jul-2016','montagne','16_AM1');
insert into Etape values ('16_23','Megeve','Morzine',146,'23-jul-2016','montagne','16_LS1');
insert into Etape values ('16_24','Chantilly','Paris',113,'24-jul-2016','plaine','16_LS1');

insert into participe values ('16_2','16_DD1');
insert into participe values ('16_3','16_DD1');
insert into participe values ('16_4','16_DD1');
insert into participe values ('16_5','16_DD1');
insert into participe values ('16_6','16_DD1');
insert into participe values ('16_7','16_DD1');
insert into participe values ('16_8','16_DD1');
insert into participe values ('16_9','16_DD1');
insert into participe values ('16_10','16_DD1');
insert into participe values ('16_12','16_DD1');
insert into participe values ('16_13','16_DD1');
insert into participe values ('16_14','16_DD1');
insert into participe values ('16_15','16_DD1');
insert into participe values ('16_16','16_DD1');
insert into participe values ('16_17','16_DD1');
insert into participe values ('16_18','16_DD1');
insert into participe values ('16_20','16_DD1');
insert into participe values ('16_21','16_DD1');
insert into participe values ('16_22','16_DD1');
insert into participe values ('16_23','16_DD1');
insert into participe values ('16_24','16_DD1');

insert into participe values ('16_2','16_TS3');
insert into participe values ('16_3','16_TS3');
insert into participe values ('16_4','16_TS3');
insert into participe values ('16_5','16_TS3');
insert into participe values ('16_6','16_TS3');
insert into participe values ('16_7','16_TS3');
insert into participe values ('16_8','16_TS3');

commit;


-- donner les cyclistes (nom, prenom, date de naissance) espagnols ou portugais (dont le pays est l'Espagne ou le Portugal)
select nomC, prenomC, dateN from Cycliste where paysC in ('Espagne','Portugal');

-- donner les cyclistes (nom, prenom) qui sont du même pays que l'équipe pour laquelle ils courent
select nomC, prenomC, paysC, nomE from Cycliste, Equipe 
where nomE = nomEquipe 
and paysC = paysE;

-- donner le nombre d'étapes de montagne
select count(*) as NbreEtapesMontagne from Etape where typeEtape ='montagne';
-- donner la distance de l'étape la plus longue, la plus courte, la distance moyenne des étapes et le nombre total de kilomètres parcourus 
select max(distance) as PlusLongue, min(distance) as PlusCourte, avg(distance) as Moyenne, sum(distance) as Total from Etape;
-- donner le nom et le prénom des cyclistes qui ont gagné au moins une étape
select nomC, prenomC from Cycliste, Etape where codeC = codeGagnant;
-- donner le nom des cyclistes qui ont participé au Tour de France mais qui n'ont gagné aucune étape
--attention ne fonctionne pas quand il y a des valeurs non renseignées pour codeGagnant
select nomC from cycliste where codeC not in (select codeGagnant from Etape);
select nomC from cycliste where codeC not in (select nvl(codeGagnant,'A') from Etape);
-- la c'est ok
select nomC from cycliste where not exists (select * from Etape where codeC=codeGagnant);


-- donner pour les cyclistes qui ont gagné au moins une étape de plaine, leur nom mais aussi le nom de leur équipe et le pays d'origine de leur équipe
select nomC, nomEquipe, paysE 
    from Cycliste, Equipe, Etape 
        where typeEtape ='plaine' 
        and codeC = codeGagnant 
        and nomEquipe = nomE;
-- donner le nombre de victoires par équipe (tous cyclistes de l'équipe confondus)
select nomEquipe, count(*) as victoires from Cycliste, Etape where codeC = codeGagnant group by nomEquipe;
-- donner l'équipe qui a remporté le plus de victoires (tous cyclistes de l'équipe confondus)
select nomEquipe, count(*) as victoires from Cycliste, Etape where codeC = codeGagnant group by nomEquipe having count(*) >= ALL(select count(*) from Cycliste, Etape where codeC = codeGagnant group by nomEquipe);
-- donner le cycliste qui a gagné toutes les étapes de course contre la montre 
select codeGagnant from Etape where typeEtape='contre-la-montre' group by codeGagnant having count(*) = (select count(*) from Etape where typeEtape='contre-la-montre');
-- autres possibilités
create or replace view NsTsContreLaMontre as select e1.codeGagnant, e2.codeE from etape e1, etape e2 where e2.typeEtape = 'contre-la-montre' minus select codeGagnant, codeE from etape where typeEtape='contre-la-montre';

select codeGagnant from etape where typeEtape = 'contre-la-montre' minus  
select codeGagnant from NsTsContreLaMontre;

--
select codeC, nomC, prenomC from Cycliste C where not exists (select * from Etape E1 where typeEtape ='contre-la-montre' and
not exists (select * from Etape E2 where E1.codeE = E2.codeE and C.codeC = E2.codeGagnant));


--donner les vainqueurs par type d'étape (cyclistes qui ont le plus grand nombre de victoires par type d'étape donné)

select codeGagnant, typeEtape, count(*) as nbreEtapes from etape E1
group by codeGagnant,typeEtape
having count(*) >= ALL (select  count(*) from etape E2 where E1.typeEtape=E2.typeEtape
group by codeGagnant, typeEtape);

