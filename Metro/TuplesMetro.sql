prompt insertion tuples ligne

insert into ligne values ('RER_A','SNCF-RATP');
insert into ligne values ('RER_B','SNCF-RATP');
insert into ligne values ('RER_C','SNCF');
insert into ligne values ('RER_D','SNCF');
insert into ligne values ('RER_E','SNCF');
insert into ligne values ('6','RATP');
insert into ligne values ('12','RATP');
insert into ligne values ('14','RATP');
insert into ligne values ('8','RATP');

prompt insertion tuples station

insert into station values ('Pasteur','D6',1);
insert into station values ('Edgar Quinet','D6',1);
insert into station values ('Raspail','E6',1);
insert into station values ('Denfert-Rochereau','E6',1);
insert into station values ('Saint-Jacques','E7',1);
insert into station values ('Glaciere','E7',1);
insert into station values ('Corvisart','E7',1);
insert into station values ('Place d''Italie','E7',1);
insert into station values ('Nationale','F7',1);
insert into station values ('Chevaleret','F7',1);
insert into station values ('Port-Royal','E6',1);
insert into station values ('Cite-U','E7',1);
insert into station values ('Gentilly','E6',2);
insert into station values ('Laplace','E8',2);
insert into station values ('Arcueil-Cachan','E8',3);
insert into station values ('Bagneux','E8',3);



prompt insertion tuples liaison

insert into liaison values ('B1',1200,'RER_B','Bagneux','Arcueil-Cachan');
insert into liaison values ('B2',1100,'RER_B','Arcueil-Cachan','Laplace');
insert into liaison values ('B3',1000,'RER_B','Laplace','Gentilly');
insert into liaison values ('B4',800,'RER_B','Gentilly','Cite-U');
insert into liaison values ('B5',500,'RER_B','Cite-U','Denfert-Rochereau');
insert into liaison values ('B6',600,'RER_B','Denfert-Rochereau','Port-Royal');
insert into liaison values ('6-1',400,'6','Chevaleret','Nationale');
insert into liaison values ('6-2',300,'6','Nationale','Place d''Italie');
insert into liaison values ('6-3',440,'6','Place d''Italie','Corvisart');
insert into liaison values ('6-4',250,'6','Corvisart','Glaciere');
insert into liaison values ('6-5',410,'6','Glaciere','Saint-Jacques');
insert into liaison values ('6-6',320,'6','Saint-Jacques','Denfert-Rochereau');
insert into liaison values ('6-7',480,'6','Denfert-Rochereau','Raspail');
insert into liaison values ('6-8',250,'6','Raspail','Edgar Quinet');
insert into liaison values ('6-9',350,'6','Edgar Quinet','Pasteur');


