/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     4/1/2019 7:19:46 am                          */
/*==============================================================*/


drop table if exists tahun_akademik;

drop table if exists tb_arsip_mhs;

drop table if exists tb_arsip_nilai;

drop table if exists tb_berkas_dosen;

drop table if exists tb_berkas_mhs;

drop table if exists tb_berkas_perusahaan;

drop table if exists tb_berkas_pilih_perusahaan;

drop table if exists tb_data_kuisioner;

drop table if exists tb_dosen_bimbingan_mhs;

drop table if exists tb_isi_surat;

drop table if exists tb_jadwal_seminar;

drop table if exists tb_jenis_kuisioner;

drop table if exists tb_jenis_nilai;

drop table if exists tb_jenis_surat;

drop table if exists tb_kabupaten_kota;

drop table if exists tb_kecamatan;

drop table if exists tb_kelengkapan;

drop table if exists tb_kerjasama_perusahaan;

drop table if exists tb_konsultasi_bimbingan;

drop table if exists tb_kop_surat;

drop table if exists tb_layout_surat;

drop table if exists tb_level;

drop table if exists tb_mahasiswa;

drop table if exists tb_master_level;

drop table if exists tb_mhs_pilih_perusahaan;

drop table if exists tb_monev;

drop table if exists tb_negara;

drop table if exists tb_nilai_isi_surat;

drop table if exists tb_nilai_komponen;

drop table if exists tb_nilai_seminar;

drop table if exists tb_pangkat_golongan;

drop table if exists tb_pegawai;

drop table if exists tb_pembimbing_lapangan;

drop table if exists tb_perusahaan;

drop table if exists tb_perusahaan_sementara;

drop table if exists tb_program_studi;

drop table if exists tb_provinsi;

drop table if exists tb_ruang_seminar;

drop table if exists tb_status_pkl;

drop table if exists tb_transaksi_kuisioner_mhs;

drop table if exists tb_transaksi_kuisioner_pem_lap;

drop table if exists tb_transaksi_monev;

drop table if exists tb_transaksi_nilai;

drop table if exists tb_transaksi_surat_dosen;

drop table if exists tb_transaksi_surat_kelulusan;

drop table if exists tb_transaksi_surat_mhs;

drop table if exists tb_ttd_pimpinan;

drop table if exists tb_validasi_nilai;

drop table if exists tb_waktu_seminar;

/*==============================================================*/
/* table: tahun_akademik                                        */
/*==============================================================*/
create table tahun_akademik
(
   id_tahun_akademik    varchar(50) not null,
   tahun_akademik       varchar(20),
   primary key (id_tahun_akademik)
);

/*==============================================================*/
/* table: tb_arsip_mhs                                          */
/*==============================================================*/
create table tb_arsip_mhs
(
   id_arsip_mhs         varchar(50) not null,
   id_tahun_akademik    varchar(50),
   nim                  varchar(10),
   status_mhs           varchar(25),
   ket_mhs              text,
   primary key (id_arsip_mhs)
);

/*==============================================================*/
/* table: tb_arsip_nilai                                        */
/*==============================================================*/
create table tb_arsip_nilai
(
   id_arsip_nilai       varchar(20) not null,
   id_transaksi_nilai   varchar(20),
   primary key (id_arsip_nilai)
);

/*==============================================================*/
/* table: tb_berkas_dosen                                       */
/*==============================================================*/
create table tb_berkas_dosen
(
   id_berkas_dosen      varchar(50) not null,
   nip_nik              varchar(20),
   nama_berkas_dosen    varchar(255),
   extensi_berkas_dosen varchar(10),
   jenis_berkas_dosen   varchar(30),
   tanggal_upload_dosen timestamp,
   primary key (id_berkas_dosen)
);

/*==============================================================*/
/* table: tb_berkas_mhs                                         */
/*==============================================================*/
create table tb_berkas_mhs
(
   id_berkas_mhs        int not null,
   nim                  varchar(10),
   nama_berkas_mhs      varchar(255),
   extensi_berkas_mhs   varchar(10),
   jenis_berkas_mhs     varchar(30),
   tanggal_upload_mhs   timestamp,
   primary key (id_berkas_mhs)
);

/*==============================================================*/
/* table: tb_berkas_perusahaan                                  */
/*==============================================================*/
create table tb_berkas_perusahaan
(
   id_berkas_perusahaan varchar(30) not null,
   id_perusahaan        varchar(50),
   nama_berkas_perusahaan varchar(255),
   extensi_berkas_perusahaan varchar(10),
   jenis_berkas_perusahaan varchar(30),
   tanggal_upload_perusahaan timestamp,
   primary key (id_berkas_perusahaan)
);

/*==============================================================*/
/* table: tb_berkas_pilih_perusahaan                            */
/*==============================================================*/
create table tb_berkas_pilih_perusahaan
(
   id_berkas_pilih_perusahaan varchar(30) not null,
   id_mahasiswa_perusahaan varchar(30),
   nama_berkas_pilih_perusahaan varchar(255),
   extensi_berkas_pilih_perusahaan varchar(10),
   jenis_berkas_pilih_perusahaan varchar(30),
   tanggal_upload_pilih_perusahaan timestamp,
   primary key (id_berkas_pilih_perusahaan)
);

/*==============================================================*/
/* table: tb_data_kuisioner                                     */
/*==============================================================*/
create table tb_data_kuisioner
(
   id_data_kuisioner    varchar(20) not null,
   id_jenis_kuisioner   varchar(20),
   soal_kuisioner       text,
   jawaban_kuisioner    text,
   primary key (id_data_kuisioner)
);

/*==============================================================*/
/* table: tb_dosen_bimbingan_mhs                                */
/*==============================================================*/
create table tb_dosen_bimbingan_mhs
(
   id_dosen_bimbingan_mhs varchar(30) not null,
   id_tahun_akademik    varchar(50),
   id_mahasiswa_perusahaan varchar(30),
   nim                  varchar(10),
   nip_nik              varchar(20),
   judul_laporan_mhs    varchar(100),
   primary key (id_dosen_bimbingan_mhs)
);

/*==============================================================*/
/* table: tb_isi_surat                                          */
/*==============================================================*/
create table tb_isi_surat
(
   id_isi_surat         varchar(20) not null,
   id_jenis_surat       varchar(20),
   nama_isi_surat       text,
   primary key (id_isi_surat)
);

/*==============================================================*/
/* table: tb_jadwal_seminar                                     */
/*==============================================================*/
create table tb_jadwal_seminar
(
   id_jadwal_seminar    varchar(20) not null,
   id_ruang_seminar     varchar(20),
   tanggal_seminar      date,
   penguji_seminar_1    varchar(200),
   penguji_seminar_2    varchar(200),
   primary key (id_jadwal_seminar)
);

/*==============================================================*/
/* table: tb_jenis_kuisioner                                    */
/*==============================================================*/
create table tb_jenis_kuisioner
(
   id_jenis_kuisioner   varchar(20) not null,
   id_status_pkl        varchar(30),
   jenis_kuisioner      varchar(100),
   key_api_kuisioner    text,
   url_kuisioner        text,
   primary key (id_jenis_kuisioner)
);

/*==============================================================*/
/* table: tb_jenis_nilai                                        */
/*==============================================================*/
create table tb_jenis_nilai
(
   id_jenis_nilai       varchar(20) not null,
   jenis_nilai          varchar(100),
   primary key (id_jenis_nilai)
);

/*==============================================================*/
/* table: tb_jenis_surat                                        */
/*==============================================================*/
create table tb_jenis_surat
(
   id_jenis_surat       varchar(20) not null,
   id_layout_surat      varchar(20),
   nama_jenis_surat     varchar(100),
   primary key (id_jenis_surat)
);

/*==============================================================*/
/* table: tb_kabupaten_kota                                     */
/*==============================================================*/
create table tb_kabupaten_kota
(
   id_kab_kota          varchar(30) not null,
   id_provinsi          varchar(30),
   nama_kab_kota        varchar(100),
   primary key (id_kab_kota)
);

/*==============================================================*/
/* table: tb_kecamatan                                          */
/*==============================================================*/
create table tb_kecamatan
(
   id_kecamatan         varchar(30) not null,
   id_kab_kota          varchar(30),
   nama_kecamatan       varchar(100),
   primary key (id_kecamatan)
);

/*==============================================================*/
/* table: tb_kelengkapan                                        */
/*==============================================================*/
create table tb_kelengkapan
(
   id_kelengkapan       varchar(20) not null,
   id_berkas_mhs        int,
   draft                text,
   urlsourcecode        text,
   poster               text,
   lembar_pengesahan    text,
   primary key (id_kelengkapan)
);

/*==============================================================*/
/* table: tb_kerjasama_perusahaan                               */
/*==============================================================*/
create table tb_kerjasama_perusahaan
(
   id_kerjasama_perusahaan varchar(50) not null,
   nama_kerjasama       varchar(100),
   primary key (id_kerjasama_perusahaan)
);

/*==============================================================*/
/* table: tb_konsultasi_bimbingan                               */
/*==============================================================*/
create table tb_konsultasi_bimbingan
(
   id_konsultasi_bimbingan varchar(30) not null,
   id_dosen_bimbingan_mhs varchar(30),
   id_status_pkl        varchar(30),
   tanggal_konsultasi_bimbingan date,
   materi_konsultasi_bimbingan text,
   tanggapan_dosen      text,
   primary key (id_konsultasi_bimbingan)
);

/*==============================================================*/
/* table: tb_kop_surat                                          */
/*==============================================================*/
create table tb_kop_surat
(
   id_kop_surat         varchar(30) not null,
   nama_kop_surat       varchar(100),
   extensi_kop_surat    varchar(10),
   tanggal_upload_kop_surat timestamp,
   primary key (id_kop_surat)
);

/*==============================================================*/
/* table: tb_layout_surat                                       */
/*==============================================================*/
create table tb_layout_surat
(
   id_layout_surat      varchar(20) not null,
   jenis_layout_surat   varchar(100),
   primary key (id_layout_surat)
);

/*==============================================================*/
/* table: tb_level                                              */
/*==============================================================*/
create table tb_level
(
   id_level             int not null,
   username             varchar(100),
   id_master_level      varchar(20),
   nama_level           varchar(100),
   primary key (id_level)
);

/*==============================================================*/
/* table: tb_mahasiswa                                          */
/*==============================================================*/
create table tb_mahasiswa
(
   nim                  varchar(10) not null,
   id_tahun_akademik    varchar(50),
   id_program_studi     varchar(50),
   username             varchar(100),
   nama_mahasiswa       varchar(100),
   alamat_mhs           text,
   jenis_kelamin_mhs    varchar(15),
   email_mhs            varchar(255),
   tempat_lahir_mhs     varchar(100),
   tanggal_lahir_mhs    date,
   no_hp_mahasiswa      varchar(50),
   nama_orangtua_mhs    varchar(100),
   no_hp_orangtua_mhs   varchar(50),
   primary key (nim)
);

/*==============================================================*/
/* table: tb_master_level                                       */
/*==============================================================*/
create table tb_master_level
(
   id_master_level      varchar(20) not null,
   nama_master_level    varchar(100),
   primary key (id_master_level)
);

/*==============================================================*/
/* table: tb_mhs_pilih_perusahaan                               */
/*==============================================================*/
create table tb_mhs_pilih_perusahaan
(
   id_mahasiswa_perusahaan varchar(30) not null,
   id_transaksi_surat_mhs varchar(20),
   id_status_pkl        varchar(30),
   id_perusahaan        varchar(50),
   nim                  varchar(10),
   no_balasan_surat     varchar(50),
   tanggal_balasan_surat date,
   primary key (id_mahasiswa_perusahaan)
);

/*==============================================================*/
/* table: tb_monev                                              */
/*==============================================================*/
create table tb_monev
(
   id_monev             varchar(30) not null,
   id_dosen_bimbingan_mhs varchar(30),
   nip_nik              varchar(20),
   id_mahasiswa_perusahaan varchar(30),
   primary key (id_monev)
);

/*==============================================================*/
/* table: tb_negara                                             */
/*==============================================================*/
create table tb_negara
(
   id_negara            varchar(30) not null,
   nama_negara          varchar(100),
   primary key (id_negara)
);

/*==============================================================*/
/* table: tb_nilai_isi_surat                                    */
/*==============================================================*/
create table tb_nilai_isi_surat
(
   id_nilai_isi_surat   varchar(20) not null,
   id_isi_surat         varchar(20),
   nilai_isi_surat      text,
   primary key (id_nilai_isi_surat)
);

/*==============================================================*/
/* table: tb_nilai_komponen                                     */
/*==============================================================*/
create table tb_nilai_komponen
(
   id_nilai_komponen    varchar(20) not null,
   komponen_nilai       varchar(100),
   bobot                varchar(20),
   primary key (id_nilai_komponen)
);

/*==============================================================*/
/* table: tb_nilai_seminar                                      */
/*==============================================================*/
create table tb_nilai_seminar
(
   id_nilai_seminar     varchar(20) not null,
   nilai_seminar        varchar(100),
   primary key (id_nilai_seminar)
);

/*==============================================================*/
/* table: tb_pangkat_golongan                                   */
/*==============================================================*/
create table tb_pangkat_golongan
(
   id_pangkat_golongan  varchar(30) not null,
   nama_golongan        varchar(100),
   primary key (id_pangkat_golongan)
);

/*==============================================================*/
/* table: tb_pegawai                                            */
/*==============================================================*/
create table tb_pegawai
(
   nip_nik              varchar(20) not null,
   username             varchar(100),
   id_status_pkl        varchar(30),
   id_pangkat_golongan  varchar(30),
   nama_pegawai         varchar(100),
   alamat_pegawai       text,
   jk_pegawai           varchar(20),
   email_pegawai        varchar(100),
   tempat_lahir_pegawai varchar(100),
   tanggal_lahir_pegawai date,
   no_hp_pegawai        varchar(50),
   primary key (nip_nik)
);

/*==============================================================*/
/* table: tb_pembimbing_lapangan                                */
/*==============================================================*/
create table tb_pembimbing_lapangan
(
   id_pembimbing_lapangan varchar(20) not null,
   id_status_pkl        varchar(30),
   id_perusahaan        varchar(50),
   nama_pembimbing      varchar(100),
   jabatan_pembimbing   varchar(50),
   alamat_pembimbing    text,
   telepon_pembimbing   varchar(15),
   hp_pembimbing        varchar(15),
   nama_hrd             varchar(100),
   no_hrd               varchar(20),
   primary key (id_pembimbing_lapangan)
);

/*==============================================================*/
/* table: tb_perusahaan                                         */
/*==============================================================*/
create table tb_perusahaan
(
   id_perusahaan        varchar(50) not null,
   id_negara            varchar(30),
   id_provinsi          varchar(30),
   id_kerjasama_perusahaan varchar(50),
   id_kecamatan         varchar(30),
   id_kab_kota          varchar(30),
   id_status_pkl        varchar(30),
   id_program_studi     varchar(50),
   nama_perusahaan      varchar(100),
   alamat_perusahaan    text,
   telepon_perusahaan   varchar(20),
   long_perusahaan      varchar(10),
   lat_perusahaan       varchar(10),
   kuota_pkl            int,
   primary key (id_perusahaan)
);

/*==============================================================*/
/* table: tb_perusahaan_sementara                               */
/*==============================================================*/
create table tb_perusahaan_sementara
(
   id_perusahaan_sementara varchar(30) not null,
   nim                  varchar(10),
   id_status_pkl        varchar(30),
   nama_perusahaan_sementara varchar(100),
   alamat_perusahaan_sementara text,
   telepon_perusahaan_sementara varchar(20),
   primary key (id_perusahaan_sementara)
);

/*==============================================================*/
/* table: tb_program_studi                                      */
/*==============================================================*/
create table tb_program_studi
(
   id_program_studi     varchar(50) not null,
   nama_program_studi   varchar(100),
   primary key (id_program_studi)
);

/*==============================================================*/
/* table: tb_provinsi                                           */
/*==============================================================*/
create table tb_provinsi
(
   id_provinsi          varchar(30) not null,
   id_negara            varchar(30),
   nama_provinsi        varchar(100),
   primary key (id_provinsi)
);

/*==============================================================*/
/* table: tb_ruang_seminar                                      */
/*==============================================================*/
create table tb_ruang_seminar
(
   id_ruang_seminar     varchar(20) not null,
   nama_ruang_seminar   varchar(100),
   primary key (id_ruang_seminar)
);

/*==============================================================*/
/* table: tb_status_pkl                                         */
/*==============================================================*/
create table tb_status_pkl
(
   id_status_pkl        varchar(30) not null,
   nama_status_pkl      varchar(100),
   keterangan_status_pkl varchar(100),
   primary key (id_status_pkl)
);

/*==============================================================*/
/* table: tb_transaksi_kuisioner_mhs                            */
/*==============================================================*/
create table tb_transaksi_kuisioner_mhs
(
   id_transaksi_kuisioner_mhs varchar(20) not null,
   id_mahasiswa_perusahaan varchar(30),
   id_jenis_kuisioner   varchar(20),
   primary key (id_transaksi_kuisioner_mhs)
);

/*==============================================================*/
/* table: tb_transaksi_kuisioner_pem_lap                        */
/*==============================================================*/
create table tb_transaksi_kuisioner_pem_lap
(
   id_transaksi_kuisioner_pem_lap varchar(20) not null,
   id_mahasiswa_perusahaan varchar(30),
   id_jenis_kuisioner   varchar(20),
   primary key (id_transaksi_kuisioner_pem_lap)
);

/*==============================================================*/
/* table: tb_transaksi_monev                                    */
/*==============================================================*/
create table tb_transaksi_monev
(
   id_transaksi_monev   varchar(30) not null,
   id_monev             varchar(30),
   id_jenis_kuisioner   varchar(20),
   primary key (id_transaksi_monev)
);

/*==============================================================*/
/* table: tb_transaksi_nilai                                    */
/*==============================================================*/
create table tb_transaksi_nilai
(
   id_transaksi_nilai   varchar(20) not null,
   id_nilai_komponen    varchar(20),
   id_jenis_nilai       varchar(20),
   id_nilai_seminar     varchar(20),
   niilai_akhir         float(10),
   nilai                float(10),
   primary key (id_transaksi_nilai)
);

/*==============================================================*/
/* table: tb_transaksi_surat_dosen                              */
/*==============================================================*/
create table tb_transaksi_surat_dosen
(
   id_transaksi_surat_dosen varchar(20) not null,
   id_program_studi     varchar(50),
   nip_nik              varchar(20),
   id_jenis_surat       varchar(20),
   id_mahasiswa_perusahaan varchar(30),
   id_ttd_pimpinan      varchar(30),
   id_kop_surat         varchar(30),
   primary key (id_transaksi_surat_dosen)
);

/*==============================================================*/
/* table: tb_transaksi_surat_kelulusan                          */
/*==============================================================*/
create table tb_transaksi_surat_kelulusan
(
   id_transaksi_surat_kelulusan varchar(20) not null,
   id_jenis_surat       varchar(20),
   primary key (id_transaksi_surat_kelulusan)
);

/*==============================================================*/
/* table: tb_transaksi_surat_mhs                                */
/*==============================================================*/
create table tb_transaksi_surat_mhs
(
   id_transaksi_surat_mhs varchar(20) not null,
   id_ttd_pimpinan      varchar(30),
   id_program_studi     varchar(50),
   id_mahasiswa_perusahaan varchar(30),
   id_jenis_surat       varchar(20),
   id_kop_surat         varchar(30),
   nim                  varchar(10),
   primary key (id_transaksi_surat_mhs)
);

/*==============================================================*/
/* table: tb_ttd_pimpinan                                       */
/*==============================================================*/
create table tb_ttd_pimpinan
(
   id_ttd_pimpinan      varchar(30) not null,
   nip_nik_ttd_pimpinan varchar(50),
   nama_ttd_pimpinan    varchar(100),
   jabatan_tdd_pimpinan varchar(100),
   primary key (id_ttd_pimpinan)
);

/*==============================================================*/
/* table: tb_validasi_nilai                                     */
/*==============================================================*/
create table tb_validasi_nilai
(
   id_validasi_nilai    varchar(20) not null,
   id_transaksi_nilai   varchar(20),
   primary key (id_validasi_nilai)
);

/*==============================================================*/
/* table: tb_waktu_seminar                                      */
/*==============================================================*/
create table tb_waktu_seminar
(
   id_waktu_seminar     varchar(20) not null,
   id_ruang_seminar     varchar(20),
   waktu_seminar        varchar(100),
   primary key (id_waktu_seminar)
);

alter table tb_arsip_mhs add constraint fk_memiliki_arsip_mhs foreign key (nim)
      references tb_mahasiswa (nim) on delete restrict on update restrict;

alter table tb_arsip_mhs add constraint fk_memiliki_arsip_tajaran foreign key (id_tahun_akademik)
      references tahun_akademik (id_tahun_akademik) on delete restrict on update restrict;

alter table tb_arsip_nilai add constraint fk_memiliki_arsip_nilai foreign key (id_transaksi_nilai)
      references tb_transaksi_nilai (id_transaksi_nilai) on delete restrict on update restrict;

alter table tb_berkas_dosen add constraint fk_mempunyai_berkas_dosen foreign key (nip_nik)
      references tb_pegawai (nip_nik) on delete restrict on update restrict;

alter table tb_berkas_mhs add constraint fk_mempunyai_berkas_mhs foreign key (nim)
      references tb_mahasiswa (nim) on delete restrict on update restrict;

alter table tb_berkas_perusahaan add constraint fk_memiliki_berkas_perusahaan foreign key (id_perusahaan)
      references tb_perusahaan (id_perusahaan) on delete restrict on update restrict;

alter table tb_berkas_pilih_perusahaan add constraint fk_memiliki_berkas_pilih_perusahaan foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_data_kuisioner add constraint fk_memiliki_jenis_kuisioner_ke_soal foreign key (id_jenis_kuisioner)
      references tb_jenis_kuisioner (id_jenis_kuisioner) on delete restrict on update restrict;

alter table tb_dosen_bimbingan_mhs add constraint fk_memiliki_dosen_bimbingan_mhs foreign key (id_tahun_akademik)
      references tahun_akademik (id_tahun_akademik) on delete restrict on update restrict;

alter table tb_dosen_bimbingan_mhs add constraint fk_memiliki_dosen_dosen_pembimbing_mhs foreign key (nip_nik)
      references tb_pegawai (nip_nik) on delete restrict on update restrict;

alter table tb_dosen_bimbingan_mhs add constraint fk_memiliki_mhs_dosen_pembimbing_mhs foreign key (nim)
      references tb_mahasiswa (nim) on delete restrict on update restrict;

alter table tb_dosen_bimbingan_mhs add constraint fk_memiliki_pilih_perusahaan_dosen_pembimbing foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_isi_surat add constraint fk_memiliki_isi_surat foreign key (id_jenis_surat)
      references tb_jenis_surat (id_jenis_surat) on delete restrict on update restrict;

alter table tb_jadwal_seminar add constraint fk_memiliki_jadwal_seminar foreign key (id_ruang_seminar)
      references tb_ruang_seminar (id_ruang_seminar) on delete restrict on update restrict;

alter table tb_jenis_kuisioner add constraint fk_memiliki_ststus_pkl_jenis_kuisioner foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_jenis_surat add constraint fk_memiliki foreign key (id_layout_surat)
      references tb_layout_surat (id_layout_surat) on delete restrict on update restrict;

alter table tb_kabupaten_kota add constraint fk_memiliki_kabupaten_kota foreign key (id_provinsi)
      references tb_provinsi (id_provinsi) on delete restrict on update restrict;

alter table tb_kecamatan add constraint fk_memiliki_kecamatan foreign key (id_kab_kota)
      references tb_kabupaten_kota (id_kab_kota) on delete restrict on update restrict;

alter table tb_kelengkapan add constraint fk_memiliki_berkas_mhs foreign key (id_berkas_mhs)
      references tb_berkas_mhs (id_berkas_mhs) on delete restrict on update restrict;

alter table tb_konsultasi_bimbingan add constraint fk_memiliki_konsultasi_bimbingan_dosen_mhs foreign key (id_dosen_bimbingan_mhs)
      references tb_dosen_bimbingan_mhs (id_dosen_bimbingan_mhs) on delete restrict on update restrict;

alter table tb_konsultasi_bimbingan add constraint fk_memiliki_status_konsultasi_bimbingan foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_level add constraint fk_mempunyai_master_level foreign key (id_master_level)
      references tb_master_level (id_master_level) on delete restrict on update restrict;

alter table tb_mahasiswa add constraint fk_memiliki_mhs_ps foreign key (id_program_studi)
      references tb_program_studi (id_program_studi) on delete restrict on update restrict;

alter table tb_mahasiswa add constraint fk_mempunyai_mhs foreign key (id_tahun_akademik)
      references tahun_akademik (id_tahun_akademik) on delete restrict on update restrict;

alter table tb_mhs_pilih_perusahaan add constraint fk_memilih_mhs_perusahaan foreign key (nim)
      references tb_mahasiswa (nim) on delete restrict on update restrict;

alter table tb_mhs_pilih_perusahaan add constraint fk_memiliki_perusahaan_mhs foreign key (id_perusahaan)
      references tb_perusahaan (id_perusahaan) on delete restrict on update restrict;

alter table tb_mhs_pilih_perusahaan add constraint fk_memiliki_pilihan_perusahaan foreign key (id_transaksi_surat_mhs)
      references tb_transaksi_surat_mhs (id_transaksi_surat_mhs) on delete restrict on update restrict;

alter table tb_mhs_pilih_perusahaan add constraint fk_memiliki_pilih_ststus_perusahaan foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_monev add constraint fk_memiliki_dosen_bimbingan_mhs_monev foreign key (id_dosen_bimbingan_mhs)
      references tb_dosen_bimbingan_mhs (id_dosen_bimbingan_mhs) on delete restrict on update restrict;

alter table tb_monev add constraint fk_memiliki_dosen_monev foreign key (nip_nik)
      references tb_pegawai (nip_nik) on delete restrict on update restrict;

alter table tb_monev add constraint fk_memiliki_mhs_pilih_perusahaan foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_nilai_isi_surat add constraint fk_memiliki_nilai_isi_surat foreign key (id_isi_surat)
      references tb_isi_surat (id_isi_surat) on delete restrict on update restrict;

alter table tb_pegawai add constraint fk_memiliki_pangkat_golongan foreign key (id_pangkat_golongan)
      references tb_pangkat_golongan (id_pangkat_golongan) on delete restrict on update restrict;

alter table tb_pegawai add constraint fk_memiliki_status_pegawai foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_pembimbing_lapangan add constraint fk_memiliki_pembimbing foreign key (id_perusahaan)
      references tb_perusahaan (id_perusahaan) on delete restrict on update restrict;

alter table tb_pembimbing_lapangan add constraint fk_memiliki_pembimbing_lapangan_status foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_kab_kota foreign key (id_kab_kota)
      references tb_kabupaten_kota (id_kab_kota) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_kecamatan_kota foreign key (id_kecamatan)
      references tb_kecamatan (id_kecamatan) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_kerjasama_perusahaan foreign key (id_kerjasama_perusahaan)
      references tb_kerjasama_perusahaan (id_kerjasama_perusahaan) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_negara foreign key (id_negara)
      references tb_negara (id_negara) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_provinsi_negara foreign key (id_provinsi)
      references tb_provinsi (id_provinsi) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_ps_perusahaan foreign key (id_program_studi)
      references tb_program_studi (id_program_studi) on delete restrict on update restrict;

alter table tb_perusahaan add constraint fk_memiliki_status_perusahaan foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_perusahaan_sementara add constraint fk_memiliki_perusahaan_sementara foreign key (nim)
      references tb_mahasiswa (nim) on delete restrict on update restrict;

alter table tb_perusahaan_sementara add constraint fk_memiliki_status_perusahaan_sementara foreign key (id_status_pkl)
      references tb_status_pkl (id_status_pkl) on delete restrict on update restrict;

alter table tb_provinsi add constraint fk_memiliki_provinsi foreign key (id_negara)
      references tb_negara (id_negara) on delete restrict on update restrict;

alter table tb_transaksi_kuisioner_mhs add constraint fk_memiliki_pilih_mhs_transaksi_kuisioner_mhs foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_transaksi_kuisioner_mhs add constraint fk_memiliki_transaksi_kuisioner_mhs foreign key (id_jenis_kuisioner)
      references tb_jenis_kuisioner (id_jenis_kuisioner) on delete restrict on update restrict;

alter table tb_transaksi_kuisioner_pem_lap add constraint fk_memiliki_jenis_transaksi_kuisioner_pem_lap foreign key (id_jenis_kuisioner)
      references tb_jenis_kuisioner (id_jenis_kuisioner) on delete restrict on update restrict;

alter table tb_transaksi_kuisioner_pem_lap add constraint fk_memiliki_mhs_pilih_transaksi_kuisioner_pem_lap foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_transaksi_monev add constraint fk_memiliki_hasil_monev foreign key (id_monev)
      references tb_monev (id_monev) on delete restrict on update restrict;

alter table tb_transaksi_monev add constraint fk_memiliki_jenis_transaksi_kuisioner foreign key (id_jenis_kuisioner)
      references tb_jenis_kuisioner (id_jenis_kuisioner) on delete restrict on update restrict;

alter table tb_transaksi_nilai add constraint fk_memiliki_jenis_nilai foreign key (id_jenis_nilai)
      references tb_jenis_nilai (id_jenis_nilai) on delete restrict on update restrict;

alter table tb_transaksi_nilai add constraint fk_memiliki_komponen_nilai foreign key (id_nilai_komponen)
      references tb_nilai_komponen (id_nilai_komponen) on delete restrict on update restrict;

alter table tb_transaksi_nilai add constraint fk_memiliki_nilai_seminar foreign key (id_nilai_seminar)
      references tb_nilai_seminar (id_nilai_seminar) on delete restrict on update restrict;

alter table tb_transaksi_surat_dosen add constraint fk_memiliki_jenis_surat_dsn foreign key (id_jenis_surat)
      references tb_jenis_surat (id_jenis_surat) on delete restrict on update restrict;

alter table tb_transaksi_surat_dosen add constraint fk_memiliki_kop_surat_dosen foreign key (id_kop_surat)
      references tb_kop_surat (id_kop_surat) on delete restrict on update restrict;

alter table tb_transaksi_surat_dosen add constraint fk_memiliki_pilihan_perusahaan_dsn foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_transaksi_surat_dosen add constraint fk_memiliki_transaksi_surat foreign key (nip_nik)
      references tb_pegawai (nip_nik) on delete restrict on update restrict;

alter table tb_transaksi_surat_dosen add constraint fk_memiliki_transaksi_surat_dosen foreign key (id_program_studi)
      references tb_program_studi (id_program_studi) on delete restrict on update restrict;

alter table tb_transaksi_surat_dosen add constraint fk_memiliki_ttd_pemimpin foreign key (id_ttd_pimpinan)
      references tb_ttd_pimpinan (id_ttd_pimpinan) on delete restrict on update restrict;

alter table tb_transaksi_surat_kelulusan add constraint fk_memiliki_jenis_surat_lls foreign key (id_jenis_surat)
      references tb_jenis_surat (id_jenis_surat) on delete restrict on update restrict;

alter table tb_transaksi_surat_mhs add constraint fk_memiliki_jenis_surat_mhs foreign key (id_jenis_surat)
      references tb_jenis_surat (id_jenis_surat) on delete restrict on update restrict;

alter table tb_transaksi_surat_mhs add constraint fk_memiliki_kop_surat_mhs foreign key (id_kop_surat)
      references tb_kop_surat (id_kop_surat) on delete restrict on update restrict;

alter table tb_transaksi_surat_mhs add constraint fk_memiliki_pilihan_perusahaan2 foreign key (id_mahasiswa_perusahaan)
      references tb_mhs_pilih_perusahaan (id_mahasiswa_perusahaan) on delete restrict on update restrict;

alter table tb_transaksi_surat_mhs add constraint fk_memiliki_program_studi_mhs foreign key (id_program_studi)
      references tb_program_studi (id_program_studi) on delete restrict on update restrict;

alter table tb_transaksi_surat_mhs add constraint fk_memiliki_transaksi_surat_mhs foreign key (nim)
      references tb_mahasiswa (nim) on delete restrict on update restrict;

alter table tb_transaksi_surat_mhs add constraint fk_memiliki_ttd_pimpinan_mhs foreign key (id_ttd_pimpinan)
      references tb_ttd_pimpinan (id_ttd_pimpinan) on delete restrict on update restrict;

alter table tb_validasi_nilai add constraint fk_memiliki_validasi_nilai foreign key (id_transaksi_nilai)
      references tb_transaksi_nilai (id_transaksi_nilai) on delete restrict on update restrict;

alter table tb_waktu_seminar add constraint fk_memiliki_ruang_waktu_seminar foreign key (id_ruang_seminar)
      references tb_ruang_seminar (id_ruang_seminar) on delete restrict on update restrict;

