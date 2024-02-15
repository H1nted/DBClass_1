----------------------------- FMIN111 - CORRECTION TP3 -------------------------------------------


---ecrit "contraintes" à l'écran
prompt Contraintes

--2.1 - ajout des contraintes de clé primaire et clé étrangere

--table emp
alter table emp add constraint emp_pk primary key (num);
alter table emp add constraint nom_u unique(nom);
alter table emp add constraint responsable foreign key (n_sup) references emp(num) on delete cascade;
alter table emp add constraint dept foreign key (n_dept) references dept(n_dept) on delete cascade;
alter table emp add constraint commission check ( ( comm is null and fonction !='commercial') or (comm is not null and fonction ='commercial') );

--2.2 - verification
select table_name, constraint_name from user_constraints;

--2.3 - desactiver/activer contraintes
alter table emp disable constraint commission;
alter table emp enable constraint commission;

create table rejets (row_id rowid, owner varchar2(30), table_name varchar2(30)
, constraint varchar2(30));
alter table emp enable constraint commission exceptions into rejets;

delete from emp where rowid in (select row_id from rejets);
alter table emp enable constraint commission;

--2.4 - vues dico


--2.5 - suppression contraintes
alter table emp drop constraint commission;
alter table emp drop constraint emp_pk;

