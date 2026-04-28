create database simrs_kel2;
use simrs_kel2;

/*==============================================================*/
/* Table: ASESMEN                                               */
/*==============================================================*/
create table ASESMEN
(
   ID_ASESMEN           int not null auto_increment,
   ID_PERAWAT           int not null,
   ID_ANTRIAN           int,
   ID_PASIEN            int,
   KELUHAN_UTAMA        text,
   ALERGI               varchar(50), 
   TENSI                varchar(30),
   SUHU                 decimal(4,1),
   TINGGI_BADAN         int,
   BERAT_BADAN          int,
   NADI                 int,
   RESPIRASI            int,
   CREATED_AT           timestamp null, 
   UPDATED_AT           timestamp null,
   primary key (ID_ASESMEN)
);

/*==============================================================*/
/* Table: DETAIL_E_RESEP                                        */
/*==============================================================*/
create table DETAIL_E_RESEP
(
   ID_DETAIL            int not null auto_increment,
   ID_RESEP             int not null,
   ID_OBAT              int not null, 
   DOSIS                varchar(50),
   ATURAN_PAKAI         varchar(50),
   JUMLAH               int,
   CREATED_AT           timestamp null,
   UPDATED_AT           timestamp null,
   primary key (ID_DETAIL)
);

/*==============================================================*/
/* Table: DOKTER                                                */
/*==============================================================*/
create table DOKTER
(
   ID_DOKTER            int not null auto_increment,
   ID_USER              int,
   NAMA_DOKTER          varchar(50),
   SPESIALISASI         varchar(30),
   primary key (ID_DOKTER)
);

/*==============================================================*/
/* Table: E_RESEP                                               */
/*==============================================================*/
create table E_RESEP
(
   ID_RESEP             int not null auto_increment,
   ID_RM                int not null,
   ID_DOKTER            int not null, 
   ID_ANTRIAN           int,
   ID_PASIEN            int,
   CATATAN_TAMBAHAN     text,
   STATUS_RESEP         varchar(30) default 'diterbitkan', 
   CREATED_AT           timestamp null, 
   UPDATED_AT           timestamp null,
   primary key (ID_RESEP)
);

/*==============================================================*/
/* Table: PERAWAT                                               */
/*==============================================================*/
create table PERAWAT
(
   ID_PERAWAT           int not null auto_increment,
   ID_UNIT              int,
   ID_USER              int,
   NAMA_PERAWAT         varchar(30),
   primary key (ID_PERAWAT)
);

/*==============================================================*/
/* Table: REKAM_MEDIK                                           */
/*==============================================================*/
create table REKAM_MEDIK
(
   ID_RM                int not null auto_increment,
   ID_DOKTER            int not null,
   ID_ASESMEN           int not null, 
   ID_ANTRIAN           int,
   ID_PASIEN            int,
   DIAGNOSA             text,
   KODE_ICD             varchar(20), 
   
   CREATED_AT           timestamp null, 
   UPDATED_AT           timestamp null,
   primary key (ID_RM)
);

alter table ASESMEN add constraint FK_MENGISI foreign key (ID_PERAWAT)
      references PERAWAT (ID_PERAWAT) on delete restrict on update restrict;

alter table DETAIL_E_RESEP add constraint FK_BERISI foreign key (ID_RESEP)
      references E_RESEP (ID_RESEP) on delete restrict on update cascade;

alter table E_RESEP add constraint FK_MEMBUAT foreign key (ID_DOKTER)
      references DOKTER (ID_DOKTER) on delete restrict on update cascade;

alter table E_RESEP add constraint FK_MERESEPKAN foreign key (ID_RM)
      references REKAM_MEDIK (ID_RM) on delete restrict on update cascade;

alter table REKAM_MEDIK add constraint FK_MENDIAGNOSA foreign key (ID_DOKTER)
      references DOKTER (ID_DOKTER) on delete restrict on update cascade;


alter table REKAM_MEDIK add constraint FK_BERDASARKAN_ASESMEN foreign key (ID_ASESMEN)
      references ASESMEN (ID_ASESMEN) on delete restrict on update cascade;

alter table DETAIL_TINDAKAN_RM add constraint FK_MELIPUTI_TINDAKAN foreign key (ID_RM)
      references REKAM_MEDIK (ID_RM) on delete cascade on update cascade;