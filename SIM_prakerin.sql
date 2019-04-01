/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/1/2019 7:19:46 AM                          */
/*==============================================================*/


drop table if exists TAHUN_AKADEMIK;

drop table if exists TB_ARSIP_MHS;

drop table if exists TB_ARSIP_NILAI;

drop table if exists TB_BERKAS_DOSEN;

drop table if exists TB_BERKAS_MHS;

drop table if exists TB_BERKAS_PERUSAHAAN;

drop table if exists TB_BERKAS_PILIH_PERUSAHAAN;

drop table if exists TB_DATA_KUISIONER;

drop table if exists TB_DOSEN_BIMBINGAN_MHS;

drop table if exists TB_ISI_SURAT;

drop table if exists TB_JADWAL_SEMINAR;

drop table if exists TB_JENIS_KUISIONER;

drop table if exists TB_JENIS_NILAI;

drop table if exists TB_JENIS_SURAT;

drop table if exists TB_KABUPATEN_KOTA;

drop table if exists TB_KECAMATAN;

drop table if exists TB_KELENGKAPAN;

drop table if exists TB_KERJASAMA_PERUSAHAAN;

drop table if exists TB_KONSULTASI_BIMBINGAN;

drop table if exists TB_KOP_SURAT;

drop table if exists TB_LAYOUT_SURAT;

drop table if exists TB_LEVEL;

drop table if exists TB_MAHASISWA;

drop table if exists TB_MASTER_LEVEL;

drop table if exists TB_MHS_PILIH_PERUSAHAAN;

drop table if exists TB_MONEV;

drop table if exists TB_NEGARA;

drop table if exists TB_NILAI_ISI_SURAT;

drop table if exists TB_NILAI_KOMPONEN;

drop table if exists TB_NILAI_SEMINAR;

drop table if exists TB_PANGKAT_GOLONGAN;

drop table if exists TB_PEGAWAI;

drop table if exists TB_PEMBIMBING_LAPANGAN;

drop table if exists TB_PERUSAHAAN;

drop table if exists TB_PERUSAHAAN_SEMENTARA;

drop table if exists TB_PROGRAM_STUDI;

drop table if exists TB_PROVINSI;

drop table if exists TB_RUANG_SEMINAR;

drop table if exists TB_STATUS_PKL;

drop table if exists TB_TRANSAKSI_KUISIONER_MHS;

drop table if exists TB_TRANSAKSI_KUISIONER_PEM_LAP;

drop table if exists TB_TRANSAKSI_MONEV;

drop table if exists TB_TRANSAKSI_NILAI;

drop table if exists TB_TRANSAKSI_SURAT_DOSEN;

drop table if exists TB_TRANSAKSI_SURAT_KELULUSAN;

drop table if exists TB_TRANSAKSI_SURAT_MHS;

drop table if exists TB_TTD_PIMPINAN;

drop table if exists TB_VALIDASI_NILAI;

drop table if exists TB_WAKTU_SEMINAR;

/*==============================================================*/
/* Table: TAHUN_AKADEMIK                                        */
/*==============================================================*/
create table TAHUN_AKADEMIK
(
   ID_TAHUN_AKADEMIK    varchar(50) not null,
   TAHUN_AKADEMIK       varchar(20),
   primary key (ID_TAHUN_AKADEMIK)
);

/*==============================================================*/
/* Table: TB_ARSIP_MHS                                          */
/*==============================================================*/
create table TB_ARSIP_MHS
(
   ID_ARSIP_MHS         varchar(50) not null,
   ID_TAHUN_AKADEMIK    varchar(50),
   NIM                  varchar(10),
   STATUS_MHS           varchar(25),
   KET_MHS              text,
   primary key (ID_ARSIP_MHS)
);

/*==============================================================*/
/* Table: TB_ARSIP_NILAI                                        */
/*==============================================================*/
create table TB_ARSIP_NILAI
(
   ID_ARSIP_NILAI       varchar(20) not null,
   ID_TRANSAKSI_NILAI   varchar(20),
   primary key (ID_ARSIP_NILAI)
);

/*==============================================================*/
/* Table: TB_BERKAS_DOSEN                                       */
/*==============================================================*/
create table TB_BERKAS_DOSEN
(
   ID_BERKAS_DOSEN      varchar(50) not null,
   NIP_NIK              varchar(20),
   NAMA_BERKAS_DOSEN    varchar(255),
   EXTENSI_BERKAS_DOSEN varchar(10),
   JENIS_BERKAS_DOSEN   varchar(30),
   TANGGAL_UPLOAD_DOSEN timestamp,
   primary key (ID_BERKAS_DOSEN)
);

/*==============================================================*/
/* Table: TB_BERKAS_MHS                                         */
/*==============================================================*/
create table TB_BERKAS_MHS
(
   ID_BERKAS_MHS        int not null,
   NIM                  varchar(10),
   NAMA_BERKAS_MHS      varchar(255),
   EXTENSI_BERKAS_MHS   varchar(10),
   JENIS_BERKAS_MHS     varchar(30),
   TANGGAL_UPLOAD_MHS   timestamp,
   primary key (ID_BERKAS_MHS)
);

/*==============================================================*/
/* Table: TB_BERKAS_PERUSAHAAN                                  */
/*==============================================================*/
create table TB_BERKAS_PERUSAHAAN
(
   ID_BERKAS_PERUSAHAAN varchar(30) not null,
   ID_PERUSAHAAN        varchar(50),
   NAMA_BERKAS_PERUSAHAAN varchar(255),
   EXTENSI_BERKAS_PERUSAHAAN varchar(10),
   JENIS_BERKAS_PERUSAHAAN varchar(30),
   TANGGAL_UPLOAD_PERUSAHAAN timestamp,
   primary key (ID_BERKAS_PERUSAHAAN)
);

/*==============================================================*/
/* Table: TB_BERKAS_PILIH_PERUSAHAAN                            */
/*==============================================================*/
create table TB_BERKAS_PILIH_PERUSAHAAN
(
   ID_BERKAS_PILIH_PERUSAHAAN varchar(30) not null,
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   NAMA_BERKAS_PILIH_PERUSAHAAN varchar(255),
   EXTENSI_BERKAS_PILIH_PERUSAHAAN varchar(10),
   JENIS_BERKAS_PILIH_PERUSAHAAN varchar(30),
   TANGGAL_UPLOAD_PILIH_PERUSAHAAN timestamp,
   primary key (ID_BERKAS_PILIH_PERUSAHAAN)
);

/*==============================================================*/
/* Table: TB_DATA_KUISIONER                                     */
/*==============================================================*/
create table TB_DATA_KUISIONER
(
   ID_DATA_KUISIONER    varchar(20) not null,
   ID_JENIS_KUISIONER   varchar(20),
   SOAL_KUISIONER       text,
   JAWABAN_KUISIONER    text,
   primary key (ID_DATA_KUISIONER)
);

/*==============================================================*/
/* Table: TB_DOSEN_BIMBINGAN_MHS                                */
/*==============================================================*/
create table TB_DOSEN_BIMBINGAN_MHS
(
   ID_DOSEN_BIMBINGAN_MHS varchar(30) not null,
   ID_TAHUN_AKADEMIK    varchar(50),
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   NIM                  varchar(10),
   NIP_NIK              varchar(20),
   JUDUL_LAPORAN_MHS    varchar(100),
   primary key (ID_DOSEN_BIMBINGAN_MHS)
);

/*==============================================================*/
/* Table: TB_ISI_SURAT                                          */
/*==============================================================*/
create table TB_ISI_SURAT
(
   ID_ISI_SURAT         varchar(20) not null,
   ID_JENIS_SURAT       varchar(20),
   NAMA_ISI_SURAT       text,
   primary key (ID_ISI_SURAT)
);

/*==============================================================*/
/* Table: TB_JADWAL_SEMINAR                                     */
/*==============================================================*/
create table TB_JADWAL_SEMINAR
(
   ID_JADWAL_SEMINAR    varchar(20) not null,
   ID_RUANG_SEMINAR     varchar(20),
   TANGGAL_SEMINAR      date,
   PENGUJI_SEMINAR_1    varchar(200),
   PENGUJI_SEMINAR_2    varchar(200),
   primary key (ID_JADWAL_SEMINAR)
);

/*==============================================================*/
/* Table: TB_JENIS_KUISIONER                                    */
/*==============================================================*/
create table TB_JENIS_KUISIONER
(
   ID_JENIS_KUISIONER   varchar(20) not null,
   ID_STATUS_PKL        varchar(30),
   JENIS_KUISIONER      varchar(100),
   KEY_API_KUISIONER    text,
   URL_KUISIONER        text,
   primary key (ID_JENIS_KUISIONER)
);

/*==============================================================*/
/* Table: TB_JENIS_NILAI                                        */
/*==============================================================*/
create table TB_JENIS_NILAI
(
   ID_JENIS_NILAI       varchar(20) not null,
   JENIS_NILAI          varchar(100),
   primary key (ID_JENIS_NILAI)
);

/*==============================================================*/
/* Table: TB_JENIS_SURAT                                        */
/*==============================================================*/
create table TB_JENIS_SURAT
(
   ID_JENIS_SURAT       varchar(20) not null,
   ID_LAYOUT_SURAT      varchar(20),
   NAMA_JENIS_SURAT     varchar(100),
   primary key (ID_JENIS_SURAT)
);

/*==============================================================*/
/* Table: TB_KABUPATEN_KOTA                                     */
/*==============================================================*/
create table TB_KABUPATEN_KOTA
(
   ID_KAB_KOTA          varchar(30) not null,
   ID_PROVINSI          varchar(30),
   NAMA_KAB_KOTA        varchar(100),
   primary key (ID_KAB_KOTA)
);

/*==============================================================*/
/* Table: TB_KECAMATAN                                          */
/*==============================================================*/
create table TB_KECAMATAN
(
   ID_KECAMATAN         varchar(30) not null,
   ID_KAB_KOTA          varchar(30),
   NAMA_KECAMATAN       varchar(100),
   primary key (ID_KECAMATAN)
);

/*==============================================================*/
/* Table: TB_KELENGKAPAN                                        */
/*==============================================================*/
create table TB_KELENGKAPAN
(
   ID_KELENGKAPAN       varchar(20) not null,
   ID_BERKAS_MHS        int,
   DRAFT                text,
   URLSOURCECODE        text,
   POSTER               text,
   LEMBAR_PENGESAHAN    text,
   primary key (ID_KELENGKAPAN)
);

/*==============================================================*/
/* Table: TB_KERJASAMA_PERUSAHAAN                               */
/*==============================================================*/
create table TB_KERJASAMA_PERUSAHAAN
(
   ID_KERJASAMA_PERUSAHAAN varchar(50) not null,
   NAMA_KERJASAMA       varchar(100),
   primary key (ID_KERJASAMA_PERUSAHAAN)
);

/*==============================================================*/
/* Table: TB_KONSULTASI_BIMBINGAN                               */
/*==============================================================*/
create table TB_KONSULTASI_BIMBINGAN
(
   ID_KONSULTASI_BIMBINGAN varchar(30) not null,
   ID_DOSEN_BIMBINGAN_MHS varchar(30),
   ID_STATUS_PKL        varchar(30),
   TANGGAL_KONSULTASI_BIMBINGAN date,
   MATERI_KONSULTASI_BIMBINGAN text,
   TANGGAPAN_DOSEN      text,
   primary key (ID_KONSULTASI_BIMBINGAN)
);

/*==============================================================*/
/* Table: TB_KOP_SURAT                                          */
/*==============================================================*/
create table TB_KOP_SURAT
(
   ID_KOP_SURAT         varchar(30) not null,
   NAMA_KOP_SURAT       varchar(100),
   EXTENSI_KOP_SURAT    varchar(10),
   TANGGAL_UPLOAD_KOP_SURAT timestamp,
   primary key (ID_KOP_SURAT)
);

/*==============================================================*/
/* Table: TB_LAYOUT_SURAT                                       */
/*==============================================================*/
create table TB_LAYOUT_SURAT
(
   ID_LAYOUT_SURAT      varchar(20) not null,
   JENIS_LAYOUT_SURAT   varchar(100),
   primary key (ID_LAYOUT_SURAT)
);

/*==============================================================*/
/* Table: TB_LEVEL                                              */
/*==============================================================*/
create table TB_LEVEL
(
   ID_LEVEL             int not null,
   USERNAME             varchar(100),
   ID_MASTER_LEVEL      varchar(20),
   NAMA_LEVEL           varchar(100),
   primary key (ID_LEVEL)
);

/*==============================================================*/
/* Table: TB_MAHASISWA                                          */
/*==============================================================*/
create table TB_MAHASISWA
(
   NIM                  varchar(10) not null,
   ID_TAHUN_AKADEMIK    varchar(50),
   ID_PROGRAM_STUDI     varchar(50),
   USERNAME             varchar(100),
   NAMA_MAHASISWA       varchar(100),
   ALAMAT_MHS           text,
   JENIS_KELAMIN_MHS    varchar(15),
   EMAIL_MHS            varchar(255),
   TEMPAT_LAHIR_MHS     varchar(100),
   TANGGAL_LAHIR_MHS    date,
   NO_HP_MAHASISWA      varchar(50),
   NAMA_ORANGTUA_MHS    varchar(100),
   NO_HP_ORANGTUA_MHS   varchar(50),
   primary key (NIM)
);

/*==============================================================*/
/* Table: TB_MASTER_LEVEL                                       */
/*==============================================================*/
create table TB_MASTER_LEVEL
(
   ID_MASTER_LEVEL      varchar(20) not null,
   NAMA_MASTER_LEVEL    varchar(100),
   primary key (ID_MASTER_LEVEL)
);

/*==============================================================*/
/* Table: TB_MHS_PILIH_PERUSAHAAN                               */
/*==============================================================*/
create table TB_MHS_PILIH_PERUSAHAAN
(
   ID_MAHASISWA_PERUSAHAAN varchar(30) not null,
   ID_TRANSAKSI_SURAT_MHS varchar(20),
   ID_STATUS_PKL        varchar(30),
   ID_PERUSAHAAN        varchar(50),
   NIM                  varchar(10),
   NO_BALASAN_SURAT     varchar(50),
   TANGGAL_BALASAN_SURAT date,
   primary key (ID_MAHASISWA_PERUSAHAAN)
);

/*==============================================================*/
/* Table: TB_MONEV                                              */
/*==============================================================*/
create table TB_MONEV
(
   ID_MONEV             varchar(30) not null,
   ID_DOSEN_BIMBINGAN_MHS varchar(30),
   NIP_NIK              varchar(20),
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   primary key (ID_MONEV)
);

/*==============================================================*/
/* Table: TB_NEGARA                                             */
/*==============================================================*/
create table TB_NEGARA
(
   ID_NEGARA            varchar(30) not null,
   NAMA_NEGARA          varchar(100),
   primary key (ID_NEGARA)
);

/*==============================================================*/
/* Table: TB_NILAI_ISI_SURAT                                    */
/*==============================================================*/
create table TB_NILAI_ISI_SURAT
(
   ID_NILAI_ISI_SURAT   varchar(20) not null,
   ID_ISI_SURAT         varchar(20),
   NILAI_ISI_SURAT      text,
   primary key (ID_NILAI_ISI_SURAT)
);

/*==============================================================*/
/* Table: TB_NILAI_KOMPONEN                                     */
/*==============================================================*/
create table TB_NILAI_KOMPONEN
(
   ID_NILAI_KOMPONEN    varchar(20) not null,
   KOMPONEN_NILAI       varchar(100),
   BOBOT                varchar(20),
   primary key (ID_NILAI_KOMPONEN)
);

/*==============================================================*/
/* Table: TB_NILAI_SEMINAR                                      */
/*==============================================================*/
create table TB_NILAI_SEMINAR
(
   ID_NILAI_SEMINAR     varchar(20) not null,
   NILAI_SEMINAR        varchar(100),
   primary key (ID_NILAI_SEMINAR)
);

/*==============================================================*/
/* Table: TB_PANGKAT_GOLONGAN                                   */
/*==============================================================*/
create table TB_PANGKAT_GOLONGAN
(
   ID_PANGKAT_GOLONGAN  varchar(30) not null,
   NAMA_GOLONGAN        varchar(100),
   primary key (ID_PANGKAT_GOLONGAN)
);

/*==============================================================*/
/* Table: TB_PEGAWAI                                            */
/*==============================================================*/
create table TB_PEGAWAI
(
   NIP_NIK              varchar(20) not null,
   USERNAME             varchar(100),
   ID_STATUS_PKL        varchar(30),
   ID_PANGKAT_GOLONGAN  varchar(30),
   NAMA_PEGAWAI         varchar(100),
   ALAMAT_PEGAWAI       text,
   JK_PEGAWAI           varchar(20),
   EMAIL_PEGAWAI        varchar(100),
   TEMPAT_LAHIR_PEGAWAI varchar(100),
   TANGGAL_LAHIR_PEGAWAI date,
   NO_HP_PEGAWAI        varchar(50),
   primary key (NIP_NIK)
);

/*==============================================================*/
/* Table: TB_PEMBIMBING_LAPANGAN                                */
/*==============================================================*/
create table TB_PEMBIMBING_LAPANGAN
(
   ID_PEMBIMBING_LAPANGAN varchar(20) not null,
   ID_STATUS_PKL        varchar(30),
   ID_PERUSAHAAN        varchar(50),
   NAMA_PEMBIMBING      varchar(100),
   JABATAN_PEMBIMBING   varchar(50),
   ALAMAT_PEMBIMBING    text,
   TELEPON_PEMBIMBING   varchar(15),
   HP_PEMBIMBING        varchar(15),
   NAMA_HRD             varchar(100),
   NO_HRD               varchar(20),
   primary key (ID_PEMBIMBING_LAPANGAN)
);

/*==============================================================*/
/* Table: TB_PERUSAHAAN                                         */
/*==============================================================*/
create table TB_PERUSAHAAN
(
   ID_PERUSAHAAN        varchar(50) not null,
   ID_NEGARA            varchar(30),
   ID_PROVINSI          varchar(30),
   ID_KERJASAMA_PERUSAHAAN varchar(50),
   ID_KECAMATAN         varchar(30),
   ID_KAB_KOTA          varchar(30),
   ID_STATUS_PKL        varchar(30),
   ID_PROGRAM_STUDI     varchar(50),
   NAMA_PERUSAHAAN      varchar(100),
   ALAMAT_PERUSAHAAN    text,
   TELEPON_PERUSAHAAN   varchar(20),
   LONG_PERUSAHAAN      varchar(10),
   LAT_PERUSAHAAN       varchar(10),
   KUOTA_PKL            int,
   primary key (ID_PERUSAHAAN)
);

/*==============================================================*/
/* Table: TB_PERUSAHAAN_SEMENTARA                               */
/*==============================================================*/
create table TB_PERUSAHAAN_SEMENTARA
(
   ID_PERUSAHAAN_SEMENTARA varchar(30) not null,
   NIM                  varchar(10),
   ID_STATUS_PKL        varchar(30),
   NAMA_PERUSAHAAN_SEMENTARA varchar(100),
   ALAMAT_PERUSAHAAN_SEMENTARA text,
   TELEPON_PERUSAHAAN_SEMENTARA varchar(20),
   primary key (ID_PERUSAHAAN_SEMENTARA)
);

/*==============================================================*/
/* Table: TB_PROGRAM_STUDI                                      */
/*==============================================================*/
create table TB_PROGRAM_STUDI
(
   ID_PROGRAM_STUDI     varchar(50) not null,
   NAMA_PROGRAM_STUDI   varchar(100),
   primary key (ID_PROGRAM_STUDI)
);

/*==============================================================*/
/* Table: TB_PROVINSI                                           */
/*==============================================================*/
create table TB_PROVINSI
(
   ID_PROVINSI          varchar(30) not null,
   ID_NEGARA            varchar(30),
   NAMA_PROVINSI        varchar(100),
   primary key (ID_PROVINSI)
);

/*==============================================================*/
/* Table: TB_RUANG_SEMINAR                                      */
/*==============================================================*/
create table TB_RUANG_SEMINAR
(
   ID_RUANG_SEMINAR     varchar(20) not null,
   NAMA_RUANG_SEMINAR   varchar(100),
   primary key (ID_RUANG_SEMINAR)
);

/*==============================================================*/
/* Table: TB_STATUS_PKL                                         */
/*==============================================================*/
create table TB_STATUS_PKL
(
   ID_STATUS_PKL        varchar(30) not null,
   NAMA_STATUS_PKL      varchar(100),
   KETERANGAN_STATUS_PKL varchar(100),
   primary key (ID_STATUS_PKL)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_KUISIONER_MHS                            */
/*==============================================================*/
create table TB_TRANSAKSI_KUISIONER_MHS
(
   ID_TRANSAKSI_KUISIONER_MHS varchar(20) not null,
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   ID_JENIS_KUISIONER   varchar(20),
   primary key (ID_TRANSAKSI_KUISIONER_MHS)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_KUISIONER_PEM_LAP                        */
/*==============================================================*/
create table TB_TRANSAKSI_KUISIONER_PEM_LAP
(
   ID_TRANSAKSI_KUISIONER_PEM_LAP varchar(20) not null,
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   ID_JENIS_KUISIONER   varchar(20),
   primary key (ID_TRANSAKSI_KUISIONER_PEM_LAP)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_MONEV                                    */
/*==============================================================*/
create table TB_TRANSAKSI_MONEV
(
   ID_TRANSAKSI_MONEV   varchar(30) not null,
   ID_MONEV             varchar(30),
   ID_JENIS_KUISIONER   varchar(20),
   primary key (ID_TRANSAKSI_MONEV)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_NILAI                                    */
/*==============================================================*/
create table TB_TRANSAKSI_NILAI
(
   ID_TRANSAKSI_NILAI   varchar(20) not null,
   ID_NILAI_KOMPONEN    varchar(20),
   ID_JENIS_NILAI       varchar(20),
   ID_NILAI_SEMINAR     varchar(20),
   NIILAI_AKHIR         float(10),
   NILAI                float(10),
   primary key (ID_TRANSAKSI_NILAI)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_SURAT_DOSEN                              */
/*==============================================================*/
create table TB_TRANSAKSI_SURAT_DOSEN
(
   ID_TRANSAKSI_SURAT_DOSEN varchar(20) not null,
   ID_PROGRAM_STUDI     varchar(50),
   NIP_NIK              varchar(20),
   ID_JENIS_SURAT       varchar(20),
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   ID_TTD_PIMPINAN      varchar(30),
   ID_KOP_SURAT         varchar(30),
   primary key (ID_TRANSAKSI_SURAT_DOSEN)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_SURAT_KELULUSAN                          */
/*==============================================================*/
create table TB_TRANSAKSI_SURAT_KELULUSAN
(
   ID_TRANSAKSI_SURAT_KELULUSAN varchar(20) not null,
   ID_JENIS_SURAT       varchar(20),
   primary key (ID_TRANSAKSI_SURAT_KELULUSAN)
);

/*==============================================================*/
/* Table: TB_TRANSAKSI_SURAT_MHS                                */
/*==============================================================*/
create table TB_TRANSAKSI_SURAT_MHS
(
   ID_TRANSAKSI_SURAT_MHS varchar(20) not null,
   ID_TTD_PIMPINAN      varchar(30),
   ID_PROGRAM_STUDI     varchar(50),
   ID_MAHASISWA_PERUSAHAAN varchar(30),
   ID_JENIS_SURAT       varchar(20),
   ID_KOP_SURAT         varchar(30),
   NIM                  varchar(10),
   primary key (ID_TRANSAKSI_SURAT_MHS)
);

/*==============================================================*/
/* Table: TB_TTD_PIMPINAN                                       */
/*==============================================================*/
create table TB_TTD_PIMPINAN
(
   ID_TTD_PIMPINAN      varchar(30) not null,
   NIP_NIK_TTD_PIMPINAN varchar(50),
   NAMA_TTD_PIMPINAN    varchar(100),
   JABATAN_TDD_PIMPINAN varchar(100),
   primary key (ID_TTD_PIMPINAN)
);

/*==============================================================*/
/* Table: TB_VALIDASI_NILAI                                     */
/*==============================================================*/
create table TB_VALIDASI_NILAI
(
   ID_VALIDASI_NILAI    varchar(20) not null,
   ID_TRANSAKSI_NILAI   varchar(20),
   primary key (ID_VALIDASI_NILAI)
);

/*==============================================================*/
/* Table: TB_WAKTU_SEMINAR                                      */
/*==============================================================*/
create table TB_WAKTU_SEMINAR
(
   ID_WAKTU_SEMINAR     varchar(20) not null,
   ID_RUANG_SEMINAR     varchar(20),
   WAKTU_SEMINAR        varchar(100),
   primary key (ID_WAKTU_SEMINAR)
);

alter table TB_ARSIP_MHS add constraint FK_MEMILIKI_ARSIP_MHS foreign key (NIM)
      references TB_MAHASISWA (NIM) on delete restrict on update restrict;

alter table TB_ARSIP_MHS add constraint FK_MEMILIKI_ARSIP_TAJARAN foreign key (ID_TAHUN_AKADEMIK)
      references TAHUN_AKADEMIK (ID_TAHUN_AKADEMIK) on delete restrict on update restrict;

alter table TB_ARSIP_NILAI add constraint FK_MEMILIKI_ARSIP_NILAI foreign key (ID_TRANSAKSI_NILAI)
      references TB_TRANSAKSI_NILAI (ID_TRANSAKSI_NILAI) on delete restrict on update restrict;

alter table TB_BERKAS_DOSEN add constraint FK_MEMPUNYAI_BERKAS_DOSEN foreign key (NIP_NIK)
      references TB_PEGAWAI (NIP_NIK) on delete restrict on update restrict;

alter table TB_BERKAS_MHS add constraint FK_MEMPUNYAI_BERKAS_MHS foreign key (NIM)
      references TB_MAHASISWA (NIM) on delete restrict on update restrict;

alter table TB_BERKAS_PERUSAHAAN add constraint FK_MEMILIKI_BERKAS_PERUSAHAAN foreign key (ID_PERUSAHAAN)
      references TB_PERUSAHAAN (ID_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_BERKAS_PILIH_PERUSAHAAN add constraint FK_MEMILIKI_BERKAS_PILIH_PERUSAHAAN foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_DATA_KUISIONER add constraint FK_MEMILIKI_JENIS_KUISIONER_KE_SOAL foreign key (ID_JENIS_KUISIONER)
      references TB_JENIS_KUISIONER (ID_JENIS_KUISIONER) on delete restrict on update restrict;

alter table TB_DOSEN_BIMBINGAN_MHS add constraint FK_MEMILIKI_DOSEN_BIMBINGAN_MHS foreign key (ID_TAHUN_AKADEMIK)
      references TAHUN_AKADEMIK (ID_TAHUN_AKADEMIK) on delete restrict on update restrict;

alter table TB_DOSEN_BIMBINGAN_MHS add constraint FK_MEMILIKI_DOSEN_DOSEN_PEMBIMBING_MHS foreign key (NIP_NIK)
      references TB_PEGAWAI (NIP_NIK) on delete restrict on update restrict;

alter table TB_DOSEN_BIMBINGAN_MHS add constraint FK_MEMILIKI_MHS_DOSEN_PEMBIMBING_MHS foreign key (NIM)
      references TB_MAHASISWA (NIM) on delete restrict on update restrict;

alter table TB_DOSEN_BIMBINGAN_MHS add constraint FK_MEMILIKI_PILIH_PERUSAHAAN_DOSEN_PEMBIMBING foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_ISI_SURAT add constraint FK_MEMILIKI_ISI_SURAT foreign key (ID_JENIS_SURAT)
      references TB_JENIS_SURAT (ID_JENIS_SURAT) on delete restrict on update restrict;

alter table TB_JADWAL_SEMINAR add constraint FK_MEMILIKI_JADWAL_SEMINAR foreign key (ID_RUANG_SEMINAR)
      references TB_RUANG_SEMINAR (ID_RUANG_SEMINAR) on delete restrict on update restrict;

alter table TB_JENIS_KUISIONER add constraint FK_MEMILIKI_STSTUS_PKL_JENIS_KUISIONER foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_JENIS_SURAT add constraint FK_MEMILIKI foreign key (ID_LAYOUT_SURAT)
      references TB_LAYOUT_SURAT (ID_LAYOUT_SURAT) on delete restrict on update restrict;

alter table TB_KABUPATEN_KOTA add constraint FK_MEMILIKI_KABUPATEN_KOTA foreign key (ID_PROVINSI)
      references TB_PROVINSI (ID_PROVINSI) on delete restrict on update restrict;

alter table TB_KECAMATAN add constraint FK_MEMILIKI_KECAMATAN foreign key (ID_KAB_KOTA)
      references TB_KABUPATEN_KOTA (ID_KAB_KOTA) on delete restrict on update restrict;

alter table TB_KELENGKAPAN add constraint FK_MEMILIKI_BERKAS_MHS foreign key (ID_BERKAS_MHS)
      references TB_BERKAS_MHS (ID_BERKAS_MHS) on delete restrict on update restrict;

alter table TB_KONSULTASI_BIMBINGAN add constraint FK_MEMILIKI_KONSULTASI_BIMBINGAN_DOSEN_MHS foreign key (ID_DOSEN_BIMBINGAN_MHS)
      references TB_DOSEN_BIMBINGAN_MHS (ID_DOSEN_BIMBINGAN_MHS) on delete restrict on update restrict;

alter table TB_KONSULTASI_BIMBINGAN add constraint FK_MEMILIKI_STATUS_KONSULTASI_BIMBINGAN foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_LEVEL add constraint FK_MEMPUNYAI_MASTER_LEVEL foreign key (ID_MASTER_LEVEL)
      references TB_MASTER_LEVEL (ID_MASTER_LEVEL) on delete restrict on update restrict;

alter table TB_MAHASISWA add constraint FK_MEMILIKI_MHS_PS foreign key (ID_PROGRAM_STUDI)
      references TB_PROGRAM_STUDI (ID_PROGRAM_STUDI) on delete restrict on update restrict;

alter table TB_MAHASISWA add constraint FK_MEMPUNYAI_MHS foreign key (ID_TAHUN_AKADEMIK)
      references TAHUN_AKADEMIK (ID_TAHUN_AKADEMIK) on delete restrict on update restrict;

alter table TB_MHS_PILIH_PERUSAHAAN add constraint FK_MEMILIH_MHS_PERUSAHAAN foreign key (NIM)
      references TB_MAHASISWA (NIM) on delete restrict on update restrict;

alter table TB_MHS_PILIH_PERUSAHAAN add constraint FK_MEMILIKI_PERUSAHAAN_MHS foreign key (ID_PERUSAHAAN)
      references TB_PERUSAHAAN (ID_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_MHS_PILIH_PERUSAHAAN add constraint FK_MEMILIKI_PILIHAN_PERUSAHAAN foreign key (ID_TRANSAKSI_SURAT_MHS)
      references TB_TRANSAKSI_SURAT_MHS (ID_TRANSAKSI_SURAT_MHS) on delete restrict on update restrict;

alter table TB_MHS_PILIH_PERUSAHAAN add constraint FK_MEMILIKI_PILIH_STSTUS_PERUSAHAAN foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_MONEV add constraint FK_MEMILIKI_DOSEN_BIMBINGAN_MHS_MONEV foreign key (ID_DOSEN_BIMBINGAN_MHS)
      references TB_DOSEN_BIMBINGAN_MHS (ID_DOSEN_BIMBINGAN_MHS) on delete restrict on update restrict;

alter table TB_MONEV add constraint FK_MEMILIKI_DOSEN_MONEV foreign key (NIP_NIK)
      references TB_PEGAWAI (NIP_NIK) on delete restrict on update restrict;

alter table TB_MONEV add constraint FK_MEMILIKI_MHS_PILIH_PERUSAHAAN foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_NILAI_ISI_SURAT add constraint FK_MEMILIKI_NILAI_ISI_SURAT foreign key (ID_ISI_SURAT)
      references TB_ISI_SURAT (ID_ISI_SURAT) on delete restrict on update restrict;

alter table TB_PEGAWAI add constraint FK_MEMILIKI_PANGKAT_GOLONGAN foreign key (ID_PANGKAT_GOLONGAN)
      references TB_PANGKAT_GOLONGAN (ID_PANGKAT_GOLONGAN) on delete restrict on update restrict;

alter table TB_PEGAWAI add constraint FK_MEMILIKI_STATUS_PEGAWAI foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_PEMBIMBING_LAPANGAN add constraint FK_MEMILIKI_PEMBIMBING foreign key (ID_PERUSAHAAN)
      references TB_PERUSAHAAN (ID_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_PEMBIMBING_LAPANGAN add constraint FK_MEMILIKI_PEMBIMBING_LAPANGAN_STATUS foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_KAB_KOTA foreign key (ID_KAB_KOTA)
      references TB_KABUPATEN_KOTA (ID_KAB_KOTA) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_KECAMATAN_KOTA foreign key (ID_KECAMATAN)
      references TB_KECAMATAN (ID_KECAMATAN) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_KERJASAMA_PERUSAHAAN foreign key (ID_KERJASAMA_PERUSAHAAN)
      references TB_KERJASAMA_PERUSAHAAN (ID_KERJASAMA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_NEGARA foreign key (ID_NEGARA)
      references TB_NEGARA (ID_NEGARA) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_PROVINSI_NEGARA foreign key (ID_PROVINSI)
      references TB_PROVINSI (ID_PROVINSI) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_PS_PERUSAHAAN foreign key (ID_PROGRAM_STUDI)
      references TB_PROGRAM_STUDI (ID_PROGRAM_STUDI) on delete restrict on update restrict;

alter table TB_PERUSAHAAN add constraint FK_MEMILIKI_STATUS_PERUSAHAAN foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_PERUSAHAAN_SEMENTARA add constraint FK_MEMILIKI_PERUSAHAAN_SEMENTARA foreign key (NIM)
      references TB_MAHASISWA (NIM) on delete restrict on update restrict;

alter table TB_PERUSAHAAN_SEMENTARA add constraint FK_MEMILIKI_STATUS_PERUSAHAAN_SEMENTARA foreign key (ID_STATUS_PKL)
      references TB_STATUS_PKL (ID_STATUS_PKL) on delete restrict on update restrict;

alter table TB_PROVINSI add constraint FK_MEMILIKI_PROVINSI foreign key (ID_NEGARA)
      references TB_NEGARA (ID_NEGARA) on delete restrict on update restrict;

alter table TB_TRANSAKSI_KUISIONER_MHS add constraint FK_MEMILIKI_PILIH_MHS_TRANSAKSI_KUISIONER_MHS foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_TRANSAKSI_KUISIONER_MHS add constraint FK_MEMILIKI_TRANSAKSI_KUISIONER_MHS foreign key (ID_JENIS_KUISIONER)
      references TB_JENIS_KUISIONER (ID_JENIS_KUISIONER) on delete restrict on update restrict;

alter table TB_TRANSAKSI_KUISIONER_PEM_LAP add constraint FK_MEMILIKI_JENIS_TRANSAKSI_KUISIONER_PEM_LAP foreign key (ID_JENIS_KUISIONER)
      references TB_JENIS_KUISIONER (ID_JENIS_KUISIONER) on delete restrict on update restrict;

alter table TB_TRANSAKSI_KUISIONER_PEM_LAP add constraint FK_MEMILIKI_MHS_PILIH_TRANSAKSI_KUISIONER_PEM_LAP foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_TRANSAKSI_MONEV add constraint FK_MEMILIKI_HASIL_MONEV foreign key (ID_MONEV)
      references TB_MONEV (ID_MONEV) on delete restrict on update restrict;

alter table TB_TRANSAKSI_MONEV add constraint FK_MEMILIKI_JENIS_TRANSAKSI_KUISIONER foreign key (ID_JENIS_KUISIONER)
      references TB_JENIS_KUISIONER (ID_JENIS_KUISIONER) on delete restrict on update restrict;

alter table TB_TRANSAKSI_NILAI add constraint FK_MEMILIKI_JENIS_NILAI foreign key (ID_JENIS_NILAI)
      references TB_JENIS_NILAI (ID_JENIS_NILAI) on delete restrict on update restrict;

alter table TB_TRANSAKSI_NILAI add constraint FK_MEMILIKI_KOMPONEN_NILAI foreign key (ID_NILAI_KOMPONEN)
      references TB_NILAI_KOMPONEN (ID_NILAI_KOMPONEN) on delete restrict on update restrict;

alter table TB_TRANSAKSI_NILAI add constraint FK_MEMILIKI_NILAI_SEMINAR foreign key (ID_NILAI_SEMINAR)
      references TB_NILAI_SEMINAR (ID_NILAI_SEMINAR) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_DOSEN add constraint FK_MEMILIKI_JENIS_SURAT_DSN foreign key (ID_JENIS_SURAT)
      references TB_JENIS_SURAT (ID_JENIS_SURAT) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_DOSEN add constraint FK_MEMILIKI_KOP_SURAT_DOSEN foreign key (ID_KOP_SURAT)
      references TB_KOP_SURAT (ID_KOP_SURAT) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_DOSEN add constraint FK_MEMILIKI_PILIHAN_PERUSAHAAN_DSN foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_DOSEN add constraint FK_MEMILIKI_TRANSAKSI_SURAT foreign key (NIP_NIK)
      references TB_PEGAWAI (NIP_NIK) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_DOSEN add constraint FK_MEMILIKI_TRANSAKSI_SURAT_DOSEN foreign key (ID_PROGRAM_STUDI)
      references TB_PROGRAM_STUDI (ID_PROGRAM_STUDI) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_DOSEN add constraint FK_MEMILIKI_TTD_PEMIMPIN foreign key (ID_TTD_PIMPINAN)
      references TB_TTD_PIMPINAN (ID_TTD_PIMPINAN) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_KELULUSAN add constraint FK_MEMILIKI_JENIS_SURAT_LLS foreign key (ID_JENIS_SURAT)
      references TB_JENIS_SURAT (ID_JENIS_SURAT) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_MHS add constraint FK_MEMILIKI_JENIS_SURAT_MHS foreign key (ID_JENIS_SURAT)
      references TB_JENIS_SURAT (ID_JENIS_SURAT) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_MHS add constraint FK_MEMILIKI_KOP_SURAT_MHS foreign key (ID_KOP_SURAT)
      references TB_KOP_SURAT (ID_KOP_SURAT) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_MHS add constraint FK_MEMILIKI_PILIHAN_PERUSAHAAN2 foreign key (ID_MAHASISWA_PERUSAHAAN)
      references TB_MHS_PILIH_PERUSAHAAN (ID_MAHASISWA_PERUSAHAAN) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_MHS add constraint FK_MEMILIKI_PROGRAM_STUDI_MHS foreign key (ID_PROGRAM_STUDI)
      references TB_PROGRAM_STUDI (ID_PROGRAM_STUDI) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_MHS add constraint FK_MEMILIKI_TRANSAKSI_SURAT_MHS foreign key (NIM)
      references TB_MAHASISWA (NIM) on delete restrict on update restrict;

alter table TB_TRANSAKSI_SURAT_MHS add constraint FK_MEMILIKI_TTD_PIMPINAN_MHS foreign key (ID_TTD_PIMPINAN)
      references TB_TTD_PIMPINAN (ID_TTD_PIMPINAN) on delete restrict on update restrict;

alter table TB_VALIDASI_NILAI add constraint FK_MEMILIKI_VALIDASI_NILAI foreign key (ID_TRANSAKSI_NILAI)
      references TB_TRANSAKSI_NILAI (ID_TRANSAKSI_NILAI) on delete restrict on update restrict;

alter table TB_WAKTU_SEMINAR add constraint FK_MEMILIKI_RUANG_WAKTU_SEMINAR foreign key (ID_RUANG_SEMINAR)
      references TB_RUANG_SEMINAR (ID_RUANG_SEMINAR) on delete restrict on update restrict;

