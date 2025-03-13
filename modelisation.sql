--LDD
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

select *
  from table ( dbms_xplan.display_cursor(
   sql_id => 'null',
   format => 'ALLSTATS LAST'
) );

--Table DIM_Temps :
create table dim_temps (
   id_temps      int primary key,
   temps_realise timestamp
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

















--LMD
-- Insertion dans DIM_Coureur
INSERT INTO dim_coureur (num_dossard, nom_coureur, code_equipe, code_pays)
VALUES (101, 'test', 1, 33);

INSERT INTO dim_coureur (num_dossard, nom_coureur, code_equipe, code_pays)
VALUES (102, 'test', 2, 45);

INSERT INTO dim_coureur (num_dossard, nom_coureur, code_equipe, code_pays)
VALUES (103, 'test', 3, 33);

-- Insertion dans DIM_Equipe
INSERT INTO dim_equipe (code_equipe, nom_equipe, directeur)
VALUES (1, 'test', 'test');

INSERT INTO dim_equipe (code_equipe, nom_equipe, directeur)
VALUES (2, 'test', 'test');

INSERT INTO dim_equipe (code_equipe, nom_equipe, directeur)
VALUES (3, 'test', 'test');

-- Insertion dans DIM_Etape
INSERT INTO dim_etape (num_etape, date_etape, kms, ville_depart, ville_arrivee)
VALUES (1, TO_DATE('2024-07-01','YYYY-MM-DD'), 198.5, 'test', 'test');

INSERT INTO dim_etape (num_etape, date_etape, kms, ville_depart, ville_arrivee)
VALUES (2, TO_DATE('2024-07-02','YYYY-MM-DD'), 175.2, 'test', 'test');

-- Insertion dans DIM_Edition
INSERT INTO dim_edition (num_edition, date_deb, date_fin)
VALUES (110, TO_DATE('2024-07-01','YYYY-MM-DD'), TO_DATE('2024-07-28','YYYY-MM-DD'));

-- Insertion dans DIM_Temps
INSERT INTO dim_temps (id_temps, temps_realise)
VALUES (0, TO_TIMESTAMP('2024-07-01 12:00:00','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO dim_temps (id_temps, temps_realise)
VALUES (1, TO_TIMESTAMP('2024-07-01 12:15:00','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO dim_temps (id_temps, temps_realise)
VALUES (2, TO_TIMESTAMP('2024-07-01 12:30:00','YYYY-MM-DD HH24:MI:SS'));

-- Insertion dans Faits_Perfomance
INSERT INTO faits_perfomance (id_temps, num_dossard, num_etape, num_edition)
VALUES (0, 101, 1, 110);

INSERT INTO faits_perfomance (id_temps, num_dossard, num_etape, num_edition)
VALUES (1, 102, 1, 110);

INSERT INTO faits_perfomance (id_temps, num_dossard, num_etape, num_edition)
VALUES (2, 103, 1, 110);
