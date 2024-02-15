--? Question 1
select table_name owner from all tables; --* montre 
select table_name from user_tables; 
show user; --* montre l utilisateur
desc user_tab_columns ;
select table_name, column_name, data_type from user_tab_columns;
select table_name, column_name, data_type from user_tab_columns where table_name = 'EMP';
select count(column_name) as nombreAttributs from user_tab_columns where table_name = 'EMP';

select table_name, count(*) as nombreAttributs FROM user_tab_columns group by table_name ;
select table_name, count(*) as nombreAttributs FROM user_tab_columns group by table_name having count(*) > 2;
select table_name, count(*) as nombreAttributs FROM user_tab_columns group by table_name having count(*)  >= ALL
 (select count(*) FROM user_tab_columns group by table_name);
select table_name, count(*) as nombreAttributs FROM user_tab_columns group by table_name having count(*)  = 
 (select max (count(*)) FROM user_tab_columns group by table_name);

desc user_constraints;
select constraint_name, constraint_type, table_name from user_constraints;

--? Question 5
select column_name as nom, data_type as type from cols where table_name= 'EMP';

select username, machine from v$session
col username for a20
col machine for a20
col osuser for a50
select username,osuser, machine from v$session where type = 'USER';
select username,osuser, machine from v$session where type = 'USER' and osuser like

select substr(sql_text, 1, 150) from v$sql where parsing_schema_name ='P00000009432' ;
select substr(sql_text, 1, 100) from v$sql where parsing_schema_name ='ZOE' ;

--? donner des autorisation
grant select,update on emp to public; 
grant select,update on emp to E20220000252;

--select * from 'username'.emp; ben = E20220000252

-- ? modifier un fichier commun
select * from P00000009432.emp;
update P00000009432.emp set nom = 'Wassim' where nom ='JOUBERT';
update update P00000009432.emp set set salaire = 2 where nom ='isa';
--* on va etre vrouiller si on fait pas commit
desc v$lock; --* pour voir qui bloque

--* travail en binome maguette = E20170011851  
--! toujours fait commit;
grant select,update on employe to E20170011851;
grant insert on employe to E20170011851;
revoke insert on employe from E20170011851; --* pour enlever les autorisation
update E20170011851.emp set nom ='Maguette' where fonction = 'president';

insert into E20170011851.emp values ('Wassim',12345,'MEILLEUR',NULL,'01-01-22',99999,99999,10);

select * from user_tab_privs_made;
select * from USER_TAB_PRIVS_RECD;