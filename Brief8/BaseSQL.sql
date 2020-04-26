/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  26/04/2020 02:46:32                      */
/*==============================================================*/

create database voyg1
use voyg1

drop table if exists Client;

drop table if exists Employe;

drop table if exists Lieu;

drop table if exists Reservation;

drop table if exists Tournee;

drop table if exists Voyage;

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   idC                  int not null,
   nomC                 varchar(20),
   prenomC              varchar(20),
   numPass              int,
   adressC              varchar(35),
   telC                 int,
   primary key (idC)
);

/*==============================================================*/
/* Table : Employe                                              */
/*==============================================================*/
create table Employe
(
   idE                  int not null,
   nomE                 varchar(20),
   primary key (idE)
);

/*==============================================================*/
/* Table : Lieu                                                 */
/*==============================================================*/
create table Lieu
(
   idL                  int not null,
   nomL                 varchar(20),
   ville                varchar(25),
   primary key (idL)
);

/*==============================================================*/
/* Table : Voyage                                               */
/*==============================================================*/
create table Voyage
(
   idV                  int not null,
   libelleV             varchar(30),
   prixV                float,
   dateDebutV           datetime,
   dateFinV             datetime,
   primary key (idV)
);

/*==============================================================*/
/* Table : Reservation                                          */
/*==============================================================*/
create table Reservation
(
   numR                 int not null,
   idC                  int,
   idV                  int,
   dateR                datetime,
   primary key (numR)
);

/*==============================================================*/
/* Table : Tournee                                              */
/*==============================================================*/
create table Tournee
(
   idV                  int,
   idL                  int,
   idTr                 int not null,
   idE                  int,
   libelleTr            varchar(25),
   dateDepartTr         datetime,
   dateRetourTr         datetime,
   primary key (idTr)
);



alter table Reservation add constraint FK_concernce foreign key (idV)
      references Voyage (idV) on delete cascade on update cascade;

alter table Reservation add constraint FK_effectuePar foreign key (idC)
      references Client (idC) on delete cascade on update cascade;

alter table Tournee add constraint FK_concerne foreign key (idL)
      references Lieu (idL) on delete cascade on update cascade;

alter table Tournee add constraint FK_contient foreign key (idV)
      references Voyage (idV) on delete cascade on update cascade;

alter table Tournee add constraint FK_guid foreign key (idE)
      references Employe (idE) on delete cascade on update cascade;



/*==============================================================*/
/* Insertion                                                    */
/*==============================================================*/

insert into Client values(1,'Ouchad','Houssni',88888,'Safi maroc',266)
insert into Client values(2,'adil','adil',88888,'Safi maroc',266)
insert into Client values(3,'anonyme','anonyme',88888,'maroc',266)
select * from Client

/**************/

insert into Employe values(1,'GuidSaid')
insert into Employe values(2,'GuidAdil')
select * from Employe

/**************/

insert into Lieu values(1,'Sidi Bouzid','Safi')
insert into Lieu values(2,'Menara','Marrakech')
insert into Lieu values(3,'Jamae Elfna','Marrakech')
select Lieu.nomL from Lieu where Lieu.ville='Marrakech'

/**************/

insert into Voyage values(1,'VoyageMaroc',12000,'17/12/2020','27/12/2020')
insert into Voyage values(2,'VoyageParis',9000,'17/12/2020','21/12/2020')
insert into Voyage values(3,'VoyageMadrid',7000,'17/12/2020','21/12/2020')
select * from Voyage

/**************/

insert into Reservation values(1,2,1,GETDATE())
insert into Reservation values(2,1,3,GETDATE())
select * from Reservation
select Client.telC from Client,Reservation where Client.idC=Reservation.idC

/**************/

insert into Tournee values(1,1,1,2,'visiteMenara','19/12/2020','20/12/2020')
select Employe.nomE from Employe,Tournee where Employe.idE=Tournee.idE
select * from Tournee


/*==============================================================*/
/* Suppression                                                  */
/*==============================================================*/

delete from Client where idC=3


/*==============================================================*/
/* Modification                                                 */
/*==============================================================*/

update Client set numPass=9999 where idC=1

select * from Client