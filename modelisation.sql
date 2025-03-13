
--Table DIM_Equipe:
create table dim_equipe (
   code_equipe int primary key,
   nom_equipe  varchar(100),
   directeur   varchar(100)
);

--Table DIM_Etape:
create table dim_etape (
   num_etape     int primary key,
   date_etape    date,
   kms           float,
   ville_depart  varchar(100),
   ville_arrivee varchar(100)
);

--Table DIM_Edition:
create table dim_edition (
   num_edition int primary key,
   date_deb    date,
   date_fin    date
);

select * from table(dbms_xplan.display_cursor(sql_id=>'null', format=>'ALLSTATS LAST'));



--Table DIM_Temps :
create table dim_temps (
   id_temps      int primary key,
   temps_realise TIMESTAMP
);


--Table DIM_Coureur 
create table dim_coureur (
   num_dossard int primary key,
   nom_coureur varchar(100),
   code_equipe int,
   code_pays   int,
   foreign key ( code_equipe )
      references dim_equipe ( code_equipe )
);


--Table de faits Perfomance :
create table faits_perfomance (
   id_temps    int,
   num_dossard int,
   num_etape   int,
   num_edition int,
   foreign key ( id_temps )
      references dim_temps ( id_temps ),
   foreign key ( num_dossard )
      references dim_coureur ( num_dossard ),
   foreign key ( num_etape )
      references dim_etape ( num_etape ),
   foreign key ( num_edition )
      references dim_edition ( num_edition )
);


