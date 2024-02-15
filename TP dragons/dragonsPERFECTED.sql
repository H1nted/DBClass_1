-- !  ssh -A -Y wassim.ammar@etu.umontpellier.fr@x2go.umontpellier.fr --



-- ##### mise en page du SQL sur le terminal #####
-- select * from cat ; --je vois tout
-- select * from Dragons ; -- je vois le tableau dragons
-- desc Dragons ; -- je vois la description du tableau dragons
-- purge recyclebin ; --
-- set linesize 200  -- allonger la ligne
-- col "nom du tableau" for a20 --retailler les attributs
-- start script.sql
-- Select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, SEARCH_CONDITION from user_constraints;


-- ############################################### PROJECTION ET SELECTION ###############################################
-- avec projection =  "SELECT" un elemnt "FROM" un tableau
-- selection = projection avec une condition "WHERE" ==> "SELECT" un element "FROM" un tableau "WHERE" une condition est atteinte


-- Nom des dragons qui crachent du feu je SELECTIONNE - SELECT  un element du tableau DRAGONS (from), qui crache du feu (where)
prompt montrer les dragons qui crache du feu :  ;
select Dragon from Dragons where crachefeu = 'oui' ;
-->R : Smeagol Negueth Bolong Miloch Tarak Solong

prompt ############################################################# ;

-- Q1 -Nom des dragons qui crachent du feu je SELECTIONNE - SELECT  un element du tableau DRAGONS (from), qui crache du feu (where) et mâle
prompt montrer les dragons  mâles qui crache du feu :  ;
select Dragon from Dragons where sexe = 'M' and crachefeu = 'oui'; 
--crachefeu car desc montre autre chose // PAS de commentaires sur les lignes de codes
-->R :Smeagol Bolong Miloch Solong

prompt ############################################################# ;

-- Q2 -Nom des dragons qui NE CRACHENT PAS DU FEU, et qui sont de SEXE FEMININ
prompt montrer les dragons femelles qui ne  crache pas du feu :  ;
select Dragon from DRAGONS where sexe ='F' and crachefeu = 'non' ; 
-->R : MissToc

prompt ############################################################# ;

-- Q3 -Nom des dragons qui AIME : donc je vais projeter les dragons aimant du tableau AIME
--select DragonAimant from AIME ;
--> tous les dragons premiere colone

--Q4 -Nom des Dragons qui AIME PASIOONEMENT : projection + une condition pasionnément donc je fais une selection
prompt montrer les dragons qui aiment passionnement :  ;
select DragonAimant from AIME  where AIME.Force = 'passionnement' ;
--> Smeagol

prompt ############################################################# ;

-- Q5 -Nom des Dragons appertenant à REPAS avec la condition qu'ils mangent des oeufs : donc une selection
prompt les dragons qui mangent des oeufs :  ;
select Dragon from REPAS where Produit ='oeuf' ;
--> Birduth Negueth Solong

prompt ############################################################# ;

-- ############################################### Jointure / Difference / Union / Intersection ###############################################

-- Q1 dragons pas amoureux : selection tous les dragons MOINS  la selection des dragons amoureux
prompt montrer les dragons qui ne sont pas amoureux : 
select Dragon from dragons minus select DragonAimant from AIME ; 
--> Miloch

prompt ############################################################# ;

-- Q2 Dragons qui aiment mutuellement : 
-- * avec intersection --
select DragonAimant, dragonAime
from AIME 
intersect 
select dragonAime, DragonAimant
from AIME;

-- * auto jointure --
select A1.DragonAimant, A1.dragonAime
from AIME A1, AIME A2
where A1.DragonAimant = A2.dragonAime
and A1.dragonAime = A2.DragonAimant;

--Q Dragons femelle qui ne crachent pas du feu :
--  * version 1   --
select dragon from dragons
minus select dragon from dragons where crachefeu = 'oui'
minus select dragon from dragons where sexe = 'M';

-- * version 2  --
select dragon from dragons
minus
(select dragon from dragons where crachefeu='oui' 
Union
select dragon from dragons where sexe ='M');

--Q Dragons qui ne mangent pas :

select dragon from dragons
minus
select dragon from repas;

--Q Dragons qui n'aiment pas et qui ne mangent pas
select dragon from dragons
minus
select DragonAimant from aime
minus
select dragon from repas;

--TODO not exist method --

--Q Dragons qui mangent de tout :

-- ! methode 1 --
create or replace view MangePasTout as 
select dragon, Produit from dragons, nourriture
minus
select dragon, Produit from repas;

--! table ou vue inexistente --
select dragon from dragons
minus select dragon from MangePasTout;


-- ! methode 2 --
 select dragon from dragons D 
 where not exists(select * from nourriture N where not exists (select * from repas R where R.dragon = D.dragon and R.produit = N.produit));

 select dragon from repasgroup by dragon having count (produit) = (select count(produit) from nourriture);


 --Q dragonnes aimée par tous les dragons machos --

create or replace view dragonFem as 
select dragon from dragons where sexe ='F';

create or replace view dragonMacho as
select  dragon from dragons where comportementamoureux = 'macho';

select DF.dragon, DM.dragon
from Aime, dragonFem DF, dragonMacho DM
where DF.dragon = dragonaime and DM.dragon = dragonaimant ;

