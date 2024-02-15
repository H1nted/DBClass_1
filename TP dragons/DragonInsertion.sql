prompt insertion des tuples

prompt DRAGONS
INSERT INTO  DRAGONS values ('Smeagol','M',152,1857,'oui','macho');
INSERT INTO  DRAGONS values ('Birduth','M',258,4787,'non','timide');
INSERT INTO  DRAGONS values ('Negueth','F',128,1581,'oui','sincere');
INSERT INTO  DRAGONS values ('MissToc','F',183,2781,'non','superflu');
INSERT INTO  DRAGONS values ('Bolong','M',213,2751,'oui','macho');
INSERT INTO  DRAGONS values ('Miloch','M',83,718,'oui','timide');
INSERT INTO  DRAGONS values ('Nessie','M',168,1721,'non','absent');
INSERT INTO  DRAGONS values ('Tarak','F',123,851,'oui','timide');
INSERT INTO  DRAGONS values ('Solong','M',173,1481,'oui','sincere');

prompt NOURRITURE
INSERT INTO NOURRITURE values ('pomme',7);
INSERT INTO NOURRITURE values ('cacahuete',10);
INSERT INTO NOURRITURE values ('orange',25);
INSERT INTO NOURRITURE values ('oeuf',15);
INSERT INTO NOURRITURE values ('ver',3);
INSERT INTO NOURRITURE values ('poisson',35);

prompt AIME
INSERT INTO AIME values ('Smeagol','Negueth','passionnement');
INSERT INTO AIME values ('Birduth','Negueth','beaucoup');
INSERT INTO AIME values ('Bolong','Negueth','a la folie');
INSERT INTO AIME values ('Negueth','Miloch','a la folie');
INSERT INTO AIME values ('Tarak','Bolong','un peu');
INSERT INTO AIME values ('Solong','Tarak','beaucoup');
INSERT INTO AIME values ('Nessie','MissToc','beaucoup');
INSERT INTO AIME values ('MissToc','Nessie','beaucoup');

prompt REPAS
INSERT INTO REPAS values ('Smeagol','cacahuete',1000);
INSERT INTO REPAS values ('Smeagol','pomme',16);
INSERT INTO REPAS values ('Birduth','oeuf',4);
INSERT INTO REPAS values ('Negueth','orange',6);
INSERT INTO REPAS values ('Negueth','oeuf',1);
INSERT INTO REPAS values ('Miloch','ver',53);
INSERT INTO REPAS values ('Miloch','cacahuete',100);
INSERT INTO REPAS values ('Nessie','poisson',20);
INSERT INTO REPAS values ('Tarak','pomme',10);
INSERT INTO REPAS values ('Tarak','orange',10);
INSERT INTO REPAS values ('Solong','oeuf',6);
INSERT INTO REPAS values ('Solong','poisson',1);
INSERT INTO REPAS values ('Solong','orange',2);
INSERT INTO REPAS values ('Solong','ver',11);
INSERT INTO REPAS values ('Solong','cacahuete',999);
INSERT INTO REPAS values ('Solong','pomme',2);

commit;

