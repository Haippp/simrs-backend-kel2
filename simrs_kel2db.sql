create database simrs_kel2;
use simrs_kel2;

/*==============================================================*/
/* Table: asesmen                                               */
/*==============================================================*/
create table asesmen
(
   id_asesmen           int not null auto_increment,
   id_perawat           int not null,
   id_antrian           int,
   id_pasien            int,
   keluhan_utama        text,
   alergi               varchar(50),
   tensi                varchar(30),
   suhu                 decimal(4,1),
   tinggi_badan         int,
   berat_badan          int,
   nadi                 int,
   respirasi            int,
   created_at           timestamp null,
   updated_at           timestamp null,
   primary key (id_asesmen)
);

/*==============================================================*/
/* Table: detail_e_resep                                        */
/*==============================================================*/
create table detail_e_resep
(
   id_detail            int not null auto_increment,
   id_resep             int not null,
   id_obat              int not null,
   dosis                varchar(50),
   aturan_pakai         varchar(50),
   jumlah               int,
   created_at           timestamp null,
   updated_at           timestamp null,
   primary key (id_detail)
);

/*==============================================================*/
/* Table: dokter                                                */
/*==============================================================*/
create table dokter
(
   id_dokter            int not null auto_increment,
   id_user              int,
   nama_dokter          varchar(50),
   spesialisasi         varchar(30),
   primary key (id_dokter)
);

/*==============================================================*/
/* Table: e_resep                                               */
/*==============================================================*/
create table e_resep
(
   id_resep             int not null auto_increment,
   id_rm                int not null,
   id_dokter            int not null,
   id_antrian           int,
   id_pasien            int,
   catatan_tambahan     text,
   status_resep         varchar(30) default 'diterbitkan',
   created_at           timestamp null,
   updated_at           timestamp null,
   primary key (id_resep)
);

/*==============================================================*/
/* Table: perawat                                               */
/*==============================================================*/
create table perawat
(
   id_perawat           int not null auto_increment,
   id_unit              int,
   id_user              int,
   nama_perawat         varchar(30),
   primary key (id_perawat)
);

/*==============================================================*/
/* Table: rekam_medik                                           */
/*==============================================================*/
create table rekam_medik
(
   id_rm                int not null auto_increment,
   id_dokter            int not null,
   id_asesmen           int not null,
   id_antrian           int,
   id_pasien            int,
   diagnosa             text,
   kode_icd             varchar(20),
   created_at           timestamp null,
   updated_at           timestamp null,
   primary key (id_rm)
);

/*==============================================================*/
/* Table: detail_tindakan_rm                                    */
/*==============================================================*/
create table detail_tindakan_rm
(
   id_detail_tindakan   int not null auto_increment,
   id_rm                int not null,
   id_layanan           int not null,
   jumlah               int default 1,
   catatan              text,
   created_at           timestamp null,
   updated_at           timestamp null,
   primary key (id_detail_tindakan)
);


/*==============================================================*/
/* PENAMBAHAN RELASI / FOREIGN KEY                              */
/*==============================================================*/
alter table asesmen add constraint fk_mengisi foreign key (id_perawat)
      references perawat (id_perawat) on delete restrict on update restrict;

alter table detail_e_resep add constraint fk_berisi foreign key (id_resep)
      references e_resep (id_resep) on delete restrict on update cascade;

alter table e_resep add constraint fk_membuat foreign key (id_dokter)
      references dokter (id_dokter) on delete restrict on update cascade;

alter table e_resep add constraint fk_meresepkan foreign key (id_rm)
      references rekam_medik (id_rm) on delete restrict on update cascade;

alter table rekam_medik add constraint fk_mendiagnosa foreign key (id_dokter)
      references dokter (id_dokter) on delete restrict on update cascade;

alter table rekam_medik add constraint fk_berdasarkan_asesmen foreign key (id_asesmen)
      references asesmen (id_asesmen) on delete restrict on update cascade;

alter table detail_tindakan_rm add constraint fk_meliputi_tindakan foreign key (id_rm)
      references rekam_medik (id_rm) on delete cascade on update cascade;