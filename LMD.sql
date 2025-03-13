-- Insertion dans DIM_Coureur :
insert into dim_coureur (
   num_dossard,
   nom_coureur,
   code_equipe,
   code_pays
) values ( 101,
           'test',
           1,
           33 ),( 102,
                  'test',
                  2,
                  45 ),( 103,
                         'test',
                         3,
                         33 );


-- Insertion dans DIM_Equipe:
insert into dim_equipe (
   code_equipe,
   nom_equipe,
   directeur
) values ( 1,
           'test',
           'test' ),( 2,
                      'test',
                      'test' ),( 3,
                                 'test',
                                 'test' );


-- Insertion dans DIM_Etape
insert into dim_etape (
   num_etape,
   date_etape,
   kms,
   ville_depart,
   ville_arrivee
) values ( 1,
           '2024-07-01',
           198.5,
           'test',
           'test' ),( 2,
                      '2024-07-02',
                      175.2,
                      'test',
                      'test' );


-- Insertion dans DIM_Edition
insert into dim_edition (
   num_edition,
   date_deb,
   date_fin
) values ( 110,
           '2024-07-01',
           '2024-07-28' );


-- Insertion dans DIM_Temps
insert into dim_temps (
   id_temps,
   temps_realise
) values ( 0,
           '2024-07-01' ),( 1,
                            '2024-07-01' ),( 2,
                                             '2024-07-01' );

-- Insertion dans Faits_Perfomance
insert into faits_perfomance (
   id_temps,
   num_dossard,
   num_etape,
   num_edition
) values ( 0,
           101,
           1,
           110 ),( 1,
                   102,
                   1,
                   110 ),( 2,
                           103,
                           1,
                           110 );