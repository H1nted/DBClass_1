-- !  ssh -A -Y wassim.ammar@etu.umontpellier.fr@x2go.umontpellier.fr --



-- ##### mise en page du SQL sur le terminal #####
-- select * from cat ; --je vois tout
-- select * from Dragons ; -- je vois le tableau dragons
-- desc Dragons ; -- je vois la description du tableau dragons
-- purge recyclebin ; --
-- set linesize 200  -- allonger la ligne
-- col "nom du tableau" for a20 --retailler les attributs



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
--> tous les dragone premiere colone

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
select dragonaimant , dragonaime  
from aime 
where dragonaimant = dragonaime and dragonaimant = dragonaime ;
 
insert into aime