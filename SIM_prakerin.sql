-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: apiprakerin
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `all_access` tinyint(1) NOT NULL DEFAULT '0',
  `controller` varchar(50) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keys`
--

DROP TABLE IF EXISTS `keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keys`
--

LOCK TABLES `keys` WRITE;
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
INSERT INTO `keys` VALUES (1,0,'4kscs444gok004kswwk0g4kkgs8kososcw8sc8gc',11,1,0,NULL,0);
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(40) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` enum('get','post','options','put','patch','delete') NOT NULL,
  `params` text,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (20190324233029);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tahun_akademik`
--

DROP TABLE IF EXISTS `tahun_akademik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tahun_akademik` (
  `id_tahun_akademik` varchar(50) NOT NULL,
  `tahun_akademik` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tahun_akademik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahun_akademik`
--

LOCK TABLES `tahun_akademik` WRITE;
/*!40000 ALTER TABLE `tahun_akademik` DISABLE KEYS */;
/*!40000 ALTER TABLE `tahun_akademik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_arsip_mhs`
--

DROP TABLE IF EXISTS `tb_arsip_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_arsip_mhs` (
  `id_arsip_mhs` varchar(50) NOT NULL,
  `id_tahun_akademik` varchar(50) DEFAULT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `status_mhs` varchar(25) DEFAULT NULL,
  `ket_mhs` text,
  PRIMARY KEY (`id_arsip_mhs`),
  KEY `fk_memiliki_arsip_mhs` (`nim`),
  KEY `fk_memiliki_arsip_tajaran` (`id_tahun_akademik`),
  CONSTRAINT `fk_memiliki_arsip_mhs` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`),
  CONSTRAINT `fk_memiliki_arsip_tajaran` FOREIGN KEY (`id_tahun_akademik`) REFERENCES `tahun_akademik` (`id_tahun_akademik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_arsip_mhs`
--

LOCK TABLES `tb_arsip_mhs` WRITE;
/*!40000 ALTER TABLE `tb_arsip_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_arsip_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_arsip_nilai`
--

DROP TABLE IF EXISTS `tb_arsip_nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_arsip_nilai` (
  `id_arsip_nilai` varchar(20) NOT NULL,
  `id_transaksi_nilai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_arsip_nilai`),
  KEY `fk_memiliki_arsip_nilai` (`id_transaksi_nilai`),
  CONSTRAINT `fk_memiliki_arsip_nilai` FOREIGN KEY (`id_transaksi_nilai`) REFERENCES `tb_transaksi_nilai` (`id_transaksi_nilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_arsip_nilai`
--

LOCK TABLES `tb_arsip_nilai` WRITE;
/*!40000 ALTER TABLE `tb_arsip_nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_arsip_nilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_berkas_dosen`
--

DROP TABLE IF EXISTS `tb_berkas_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_berkas_dosen` (
  `id_berkas_dosen` varchar(50) NOT NULL,
  `nip_nik` varchar(20) DEFAULT NULL,
  `nama_berkas_dosen` varchar(255) DEFAULT NULL,
  `extensi_berkas_dosen` varchar(10) DEFAULT NULL,
  `jenis_berkas_dosen` varchar(30) DEFAULT NULL,
  `tanggal_upload_dosen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_berkas_dosen`),
  KEY `fk_mempunyai_berkas_dosen` (`nip_nik`),
  CONSTRAINT `fk_mempunyai_berkas_dosen` FOREIGN KEY (`nip_nik`) REFERENCES `tb_pegawai` (`nip_nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_berkas_dosen`
--

LOCK TABLES `tb_berkas_dosen` WRITE;
/*!40000 ALTER TABLE `tb_berkas_dosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_berkas_dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_berkas_mhs`
--

DROP TABLE IF EXISTS `tb_berkas_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_berkas_mhs` (
  `id_berkas_mhs` int(11) NOT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `nama_berkas_mhs` varchar(255) DEFAULT NULL,
  `extensi_berkas_mhs` varchar(10) DEFAULT NULL,
  `jenis_berkas_mhs` varchar(30) DEFAULT NULL,
  `tanggal_upload_mhs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_berkas_mhs`),
  KEY `fk_mempunyai_berkas_mhs` (`nim`),
  CONSTRAINT `fk_mempunyai_berkas_mhs` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_berkas_mhs`
--

LOCK TABLES `tb_berkas_mhs` WRITE;
/*!40000 ALTER TABLE `tb_berkas_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_berkas_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_berkas_perusahaan`
--

DROP TABLE IF EXISTS `tb_berkas_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_berkas_perusahaan` (
  `id_berkas_perusahaan` varchar(30) NOT NULL,
  `id_perusahaan` varchar(50) DEFAULT NULL,
  `nama_berkas_perusahaan` varchar(255) DEFAULT NULL,
  `extensi_berkas_perusahaan` varchar(10) DEFAULT NULL,
  `jenis_berkas_perusahaan` varchar(30) DEFAULT NULL,
  `tanggal_upload_perusahaan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_berkas_perusahaan`),
  KEY `fk_memiliki_berkas_perusahaan` (`id_perusahaan`),
  CONSTRAINT `fk_memiliki_berkas_perusahaan` FOREIGN KEY (`id_perusahaan`) REFERENCES `tb_perusahaan` (`id_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_berkas_perusahaan`
--

LOCK TABLES `tb_berkas_perusahaan` WRITE;
/*!40000 ALTER TABLE `tb_berkas_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_berkas_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_berkas_pilih_perusahaan`
--

DROP TABLE IF EXISTS `tb_berkas_pilih_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_berkas_pilih_perusahaan` (
  `id_berkas_pilih_perusahaan` varchar(30) NOT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  `nama_berkas_pilih_perusahaan` varchar(255) DEFAULT NULL,
  `extensi_berkas_pilih_perusahaan` varchar(10) DEFAULT NULL,
  `jenis_berkas_pilih_perusahaan` varchar(30) DEFAULT NULL,
  `tanggal_upload_pilih_perusahaan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_berkas_pilih_perusahaan`),
  KEY `fk_memiliki_berkas_pilih_perusahaan` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_berkas_pilih_perusahaan` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_berkas_pilih_perusahaan`
--

LOCK TABLES `tb_berkas_pilih_perusahaan` WRITE;
/*!40000 ALTER TABLE `tb_berkas_pilih_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_berkas_pilih_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data_kuisioner`
--

DROP TABLE IF EXISTS `tb_data_kuisioner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data_kuisioner` (
  `id_data_kuisioner` varchar(20) NOT NULL,
  `id_jenis_kuisioner` varchar(20) DEFAULT NULL,
  `soal_kuisioner` text,
  `jawaban_kuisioner` text,
  PRIMARY KEY (`id_data_kuisioner`),
  KEY `fk_memiliki_jenis_kuisioner_ke_soal` (`id_jenis_kuisioner`),
  CONSTRAINT `fk_memiliki_jenis_kuisioner_ke_soal` FOREIGN KEY (`id_jenis_kuisioner`) REFERENCES `tb_jenis_kuisioner` (`id_jenis_kuisioner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data_kuisioner`
--

LOCK TABLES `tb_data_kuisioner` WRITE;
/*!40000 ALTER TABLE `tb_data_kuisioner` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_data_kuisioner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dosen_bimbingan_mhs`
--

DROP TABLE IF EXISTS `tb_dosen_bimbingan_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dosen_bimbingan_mhs` (
  `id_dosen_bimbingan_mhs` varchar(30) NOT NULL,
  `id_tahun_akademik` varchar(50) DEFAULT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `nip_nik` varchar(20) DEFAULT NULL,
  `judul_laporan_mhs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_dosen_bimbingan_mhs`),
  KEY `fk_memiliki_dosen_bimbingan_mhs` (`id_tahun_akademik`),
  KEY `fk_memiliki_dosen_dosen_pembimbing_mhs` (`nip_nik`),
  KEY `fk_memiliki_mhs_dosen_pembimbing_mhs` (`nim`),
  KEY `fk_memiliki_pilih_perusahaan_dosen_pembimbing` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_dosen_bimbingan_mhs` FOREIGN KEY (`id_tahun_akademik`) REFERENCES `tahun_akademik` (`id_tahun_akademik`),
  CONSTRAINT `fk_memiliki_dosen_dosen_pembimbing_mhs` FOREIGN KEY (`nip_nik`) REFERENCES `tb_pegawai` (`nip_nik`),
  CONSTRAINT `fk_memiliki_mhs_dosen_pembimbing_mhs` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`),
  CONSTRAINT `fk_memiliki_pilih_perusahaan_dosen_pembimbing` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dosen_bimbingan_mhs`
--

LOCK TABLES `tb_dosen_bimbingan_mhs` WRITE;
/*!40000 ALTER TABLE `tb_dosen_bimbingan_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dosen_bimbingan_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_isi_surat`
--

DROP TABLE IF EXISTS `tb_isi_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_isi_surat` (
  `id_isi_surat` varchar(20) NOT NULL,
  `id_jenis_surat` varchar(20) DEFAULT NULL,
  `nama_isi_surat` text,
  PRIMARY KEY (`id_isi_surat`),
  KEY `fk_memiliki_isi_surat` (`id_jenis_surat`),
  CONSTRAINT `fk_memiliki_isi_surat` FOREIGN KEY (`id_jenis_surat`) REFERENCES `tb_jenis_surat` (`id_jenis_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_isi_surat`
--

LOCK TABLES `tb_isi_surat` WRITE;
/*!40000 ALTER TABLE `tb_isi_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_isi_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jadwal_seminar`
--

DROP TABLE IF EXISTS `tb_jadwal_seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_jadwal_seminar` (
  `id_jadwal_seminar` varchar(20) NOT NULL,
  `id_ruang_seminar` varchar(20) DEFAULT NULL,
  `tanggal_seminar` date DEFAULT NULL,
  `penguji_seminar_1` varchar(200) DEFAULT NULL,
  `penguji_seminar_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_seminar`),
  KEY `fk_memiliki_jadwal_seminar` (`id_ruang_seminar`),
  CONSTRAINT `fk_memiliki_jadwal_seminar` FOREIGN KEY (`id_ruang_seminar`) REFERENCES `tb_ruang_seminar` (`id_ruang_seminar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jadwal_seminar`
--

LOCK TABLES `tb_jadwal_seminar` WRITE;
/*!40000 ALTER TABLE `tb_jadwal_seminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jadwal_seminar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jenis_kuisioner`
--

DROP TABLE IF EXISTS `tb_jenis_kuisioner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_jenis_kuisioner` (
  `id_jenis_kuisioner` varchar(20) NOT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `jenis_kuisioner` varchar(100) DEFAULT NULL,
  `key_api_kuisioner` text,
  `url_kuisioner` text,
  PRIMARY KEY (`id_jenis_kuisioner`),
  KEY `fk_memiliki_ststus_pkl_jenis_kuisioner` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_ststus_pkl_jenis_kuisioner` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jenis_kuisioner`
--

LOCK TABLES `tb_jenis_kuisioner` WRITE;
/*!40000 ALTER TABLE `tb_jenis_kuisioner` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jenis_kuisioner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jenis_nilai`
--

DROP TABLE IF EXISTS `tb_jenis_nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_jenis_nilai` (
  `id_jenis_nilai` varchar(20) NOT NULL,
  `jenis_nilai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_nilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jenis_nilai`
--

LOCK TABLES `tb_jenis_nilai` WRITE;
/*!40000 ALTER TABLE `tb_jenis_nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jenis_nilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jenis_surat`
--

DROP TABLE IF EXISTS `tb_jenis_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_jenis_surat` (
  `id_jenis_surat` varchar(20) NOT NULL,
  `id_layout_surat` varchar(20) DEFAULT NULL,
  `nama_jenis_surat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_surat`),
  KEY `fk_memiliki` (`id_layout_surat`),
  CONSTRAINT `fk_memiliki` FOREIGN KEY (`id_layout_surat`) REFERENCES `tb_layout_surat` (`id_layout_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jenis_surat`
--

LOCK TABLES `tb_jenis_surat` WRITE;
/*!40000 ALTER TABLE `tb_jenis_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jenis_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kabupaten_kota`
--

DROP TABLE IF EXISTS `tb_kabupaten_kota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kabupaten_kota` (
  `id_kab_kota` varchar(30) NOT NULL,
  `id_provinsi` varchar(30) DEFAULT NULL,
  `nama_kab_kota` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kab_kota`),
  KEY `fk_memiliki_kabupaten_kota` (`id_provinsi`),
  CONSTRAINT `fk_memiliki_kabupaten_kota` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kabupaten_kota`
--

LOCK TABLES `tb_kabupaten_kota` WRITE;
/*!40000 ALTER TABLE `tb_kabupaten_kota` DISABLE KEYS */;
INSERT INTO `tb_kabupaten_kota` VALUES ('1101','11','KABUPATEN SIMEULUE'),('1102','11','KABUPATEN ACEH SINGKIL'),('1103','11','KABUPATEN ACEH SELATAN'),('1104','11','KABUPATEN ACEH TENGGARA'),('1105','11','KABUPATEN ACEH TIMUR'),('1106','11','KABUPATEN ACEH TENGAH'),('1107','11','KABUPATEN ACEH BARAT'),('1108','11','KABUPATEN ACEH BESAR'),('1109','11','KABUPATEN PIDIE'),('1110','11','KABUPATEN BIREUEN'),('1111','11','KABUPATEN ACEH UTARA'),('1112','11','KABUPATEN ACEH BARAT DAYA'),('1113','11','KABUPATEN GAYO LUES'),('1114','11','KABUPATEN ACEH TAMIANG'),('1115','11','KABUPATEN NAGAN RAYA'),('1116','11','KABUPATEN ACEH JAYA'),('1117','11','KABUPATEN BENER MERIAH'),('1118','11','KABUPATEN PIDIE JAYA'),('1171','11','KOTA BANDA ACEH'),('1172','11','KOTA SABANG'),('1173','11','KOTA LANGSA'),('1174','11','KOTA LHOKSEUMAWE'),('1175','11','KOTA SUBULUSSALAM'),('1201','12','KABUPATEN NIAS'),('1202','12','KABUPATEN MANDAILING NATAL'),('1203','12','KABUPATEN TAPANULI SELATAN'),('1204','12','KABUPATEN TAPANULI TENGAH'),('1205','12','KABUPATEN TAPANULI UTARA'),('1206','12','KABUPATEN TOBA SAMOSIR'),('1207','12','KABUPATEN LABUHAN BATU'),('1208','12','KABUPATEN ASAHAN'),('1209','12','KABUPATEN SIMALUNGUN'),('1210','12','KABUPATEN DAIRI'),('1211','12','KABUPATEN KARO'),('1212','12','KABUPATEN DELI SERDANG'),('1213','12','KABUPATEN LANGKAT'),('1214','12','KABUPATEN NIAS SELATAN'),('1215','12','KABUPATEN HUMBANG HASUNDUTAN'),('1216','12','KABUPATEN PAKPAK BHARAT'),('1217','12','KABUPATEN SAMOSIR'),('1218','12','KABUPATEN SERDANG BEDAGAI'),('1219','12','KABUPATEN BATU BARA'),('1220','12','KABUPATEN PADANG LAWAS UTARA'),('1221','12','KABUPATEN PADANG LAWAS'),('1222','12','KABUPATEN LABUHAN BATU SELATAN'),('1223','12','KABUPATEN LABUHAN BATU UTARA'),('1224','12','KABUPATEN NIAS UTARA'),('1225','12','KABUPATEN NIAS BARAT'),('1271','12','KOTA SIBOLGA'),('1272','12','KOTA TANJUNG BALAI'),('1273','12','KOTA PEMATANG SIANTAR'),('1274','12','KOTA TEBING TINGGI'),('1275','12','KOTA MEDAN'),('1276','12','KOTA BINJAI'),('1277','12','KOTA PADANGSIDIMPUAN'),('1278','12','KOTA GUNUNGSITOLI'),('1301','13','KABUPATEN KEPULAUAN MENTAWAI'),('1302','13','KABUPATEN PESISIR SELATAN'),('1303','13','KABUPATEN SOLOK'),('1304','13','KABUPATEN SIJUNJUNG'),('1305','13','KABUPATEN TANAH DATAR'),('1306','13','KABUPATEN PADANG PARIAMAN'),('1307','13','KABUPATEN AGAM'),('1308','13','KABUPATEN LIMA PULUH KOTA'),('1309','13','KABUPATEN PASAMAN'),('1310','13','KABUPATEN SOLOK SELATAN'),('1311','13','KABUPATEN DHARMASRAYA'),('1312','13','KABUPATEN PASAMAN BARAT'),('1371','13','KOTA PADANG'),('1372','13','KOTA SOLOK'),('1373','13','KOTA SAWAH LUNTO'),('1374','13','KOTA PADANG PANJANG'),('1375','13','KOTA BUKITTINGGI'),('1376','13','KOTA PAYAKUMBUH'),('1377','13','KOTA PARIAMAN'),('1401','14','KABUPATEN KUANTAN SINGINGI'),('1402','14','KABUPATEN INDRAGIRI HULU'),('1403','14','KABUPATEN INDRAGIRI HILIR'),('1404','14','KABUPATEN PELALAWAN'),('1405','14','KABUPATEN S I A K'),('1406','14','KABUPATEN KAMPAR'),('1407','14','KABUPATEN ROKAN HULU'),('1408','14','KABUPATEN BENGKALIS'),('1409','14','KABUPATEN ROKAN HILIR'),('1410','14','KABUPATEN KEPULAUAN MERANTI'),('1471','14','KOTA PEKANBARU'),('1473','14','KOTA D U M A I'),('1501','15','KABUPATEN KERINCI'),('1502','15','KABUPATEN MERANGIN'),('1503','15','KABUPATEN SAROLANGUN'),('1504','15','KABUPATEN BATANG HARI'),('1505','15','KABUPATEN MUARO JAMBI'),('1506','15','KABUPATEN TANJUNG JABUNG TIMUR'),('1507','15','KABUPATEN TANJUNG JABUNG BARAT'),('1508','15','KABUPATEN TEBO'),('1509','15','KABUPATEN BUNGO'),('1571','15','KOTA JAMBI'),('1572','15','KOTA SUNGAI PENUH'),('1601','16','KABUPATEN OGAN KOMERING ULU'),('1602','16','KABUPATEN OGAN KOMERING ILIR'),('1603','16','KABUPATEN MUARA ENIM'),('1604','16','KABUPATEN LAHAT'),('1605','16','KABUPATEN MUSI RAWAS'),('1606','16','KABUPATEN MUSI BANYUASIN'),('1607','16','KABUPATEN BANYU ASIN'),('1608','16','KABUPATEN OGAN KOMERING ULU SELATAN'),('1609','16','KABUPATEN OGAN KOMERING ULU TIMUR'),('1610','16','KABUPATEN OGAN ILIR'),('1611','16','KABUPATEN EMPAT LAWANG'),('1612','16','KABUPATEN PENUKAL ABAB LEMATANG ILIR'),('1613','16','KABUPATEN MUSI RAWAS UTARA'),('1671','16','KOTA PALEMBANG'),('1672','16','KOTA PRABUMULIH'),('1673','16','KOTA PAGAR ALAM'),('1674','16','KOTA LUBUKLINGGAU'),('1701','17','KABUPATEN BENGKULU SELATAN'),('1702','17','KABUPATEN REJANG LEBONG'),('1703','17','KABUPATEN BENGKULU UTARA'),('1704','17','KABUPATEN KAUR'),('1705','17','KABUPATEN SELUMA'),('1706','17','KABUPATEN MUKOMUKO'),('1707','17','KABUPATEN LEBONG'),('1708','17','KABUPATEN KEPAHIANG'),('1709','17','KABUPATEN BENGKULU TENGAH'),('1771','17','KOTA BENGKULU'),('1801','18','KABUPATEN LAMPUNG BARAT'),('1802','18','KABUPATEN TANGGAMUS'),('1803','18','KABUPATEN LAMPUNG SELATAN'),('1804','18','KABUPATEN LAMPUNG TIMUR'),('1805','18','KABUPATEN LAMPUNG TENGAH'),('1806','18','KABUPATEN LAMPUNG UTARA'),('1807','18','KABUPATEN WAY KANAN'),('1808','18','KABUPATEN TULANGBAWANG'),('1809','18','KABUPATEN PESAWARAN'),('1810','18','KABUPATEN PRINGSEWU'),('1811','18','KABUPATEN MESUJI'),('1812','18','KABUPATEN TULANG BAWANG BARAT'),('1813','18','KABUPATEN PESISIR BARAT'),('1871','18','KOTA BANDAR LAMPUNG'),('1872','18','KOTA METRO'),('1901','19','KABUPATEN BANGKA'),('1902','19','KABUPATEN BELITUNG'),('1903','19','KABUPATEN BANGKA BARAT'),('1904','19','KABUPATEN BANGKA TENGAH'),('1905','19','KABUPATEN BANGKA SELATAN'),('1906','19','KABUPATEN BELITUNG TIMUR'),('1971','19','KOTA PANGKAL PINANG'),('2101','21','KABUPATEN KARIMUN'),('2102','21','KABUPATEN BINTAN'),('2103','21','KABUPATEN NATUNA'),('2104','21','KABUPATEN LINGGA'),('2105','21','KABUPATEN KEPULAUAN ANAMBAS'),('2171','21','KOTA B A T A M'),('2172','21','KOTA TANJUNG PINANG'),('3101','31','KABUPATEN KEPULAUAN SERIBU'),('3171','31','KOTA JAKARTA SELATAN'),('3172','31','KOTA JAKARTA TIMUR'),('3173','31','KOTA JAKARTA PUSAT'),('3174','31','KOTA JAKARTA BARAT'),('3175','31','KOTA JAKARTA UTARA'),('3201','32','KABUPATEN BOGOR'),('3202','32','KABUPATEN SUKABUMI'),('3203','32','KABUPATEN CIANJUR'),('3204','32','KABUPATEN BANDUNG'),('3205','32','KABUPATEN GARUT'),('3206','32','KABUPATEN TASIKMALAYA'),('3207','32','KABUPATEN CIAMIS'),('3208','32','KABUPATEN KUNINGAN'),('3209','32','KABUPATEN CIREBON'),('3210','32','KABUPATEN MAJALENGKA'),('3211','32','KABUPATEN SUMEDANG'),('3212','32','KABUPATEN INDRAMAYU'),('3213','32','KABUPATEN SUBANG'),('3214','32','KABUPATEN PURWAKARTA'),('3215','32','KABUPATEN KARAWANG'),('3216','32','KABUPATEN BEKASI'),('3217','32','KABUPATEN BANDUNG BARAT'),('3218','32','KABUPATEN PANGANDARAN'),('3271','32','KOTA BOGOR'),('3272','32','KOTA SUKABUMI'),('3273','32','KOTA BANDUNG'),('3274','32','KOTA CIREBON'),('3275','32','KOTA BEKASI'),('3276','32','KOTA DEPOK'),('3277','32','KOTA CIMAHI'),('3278','32','KOTA TASIKMALAYA'),('3279','32','KOTA BANJAR'),('3301','33','KABUPATEN CILACAP'),('3302','33','KABUPATEN BANYUMAS'),('3303','33','KABUPATEN PURBALINGGA'),('3304','33','KABUPATEN BANJARNEGARA'),('3305','33','KABUPATEN KEBUMEN'),('3306','33','KABUPATEN PURWOREJO'),('3307','33','KABUPATEN WONOSOBO'),('3308','33','KABUPATEN MAGELANG'),('3309','33','KABUPATEN BOYOLALI'),('3310','33','KABUPATEN KLATEN'),('3311','33','KABUPATEN SUKOHARJO'),('3312','33','KABUPATEN WONOGIRI'),('3313','33','KABUPATEN KARANGANYAR'),('3314','33','KABUPATEN SRAGEN'),('3315','33','KABUPATEN GROBOGAN'),('3316','33','KABUPATEN BLORA'),('3317','33','KABUPATEN REMBANG'),('3318','33','KABUPATEN PATI'),('3319','33','KABUPATEN KUDUS'),('3320','33','KABUPATEN JEPARA'),('3321','33','KABUPATEN DEMAK'),('3322','33','KABUPATEN SEMARANG'),('3323','33','KABUPATEN TEMANGGUNG'),('3324','33','KABUPATEN KENDAL'),('3325','33','KABUPATEN BATANG'),('3326','33','KABUPATEN PEKALONGAN'),('3327','33','KABUPATEN PEMALANG'),('3328','33','KABUPATEN TEGAL'),('3329','33','KABUPATEN BREBES'),('3371','33','KOTA MAGELANG'),('3372','33','KOTA SURAKARTA'),('3373','33','KOTA SALATIGA'),('3374','33','KOTA SEMARANG'),('3375','33','KOTA PEKALONGAN'),('3376','33','KOTA TEGAL'),('3401','34','KABUPATEN KULON PROGO'),('3402','34','KABUPATEN BANTUL'),('3403','34','KABUPATEN GUNUNG KIDUL'),('3404','34','KABUPATEN SLEMAN'),('3471','34','KOTA YOGYAKARTA'),('3501','35','KABUPATEN PACITAN'),('3502','35','KABUPATEN PONOROGO'),('3503','35','KABUPATEN TRENGGALEK'),('3504','35','KABUPATEN TULUNGAGUNG'),('3505','35','KABUPATEN BLITAR'),('3506','35','KABUPATEN KEDIRI'),('3507','35','KABUPATEN MALANG'),('3508','35','KABUPATEN LUMAJANG'),('3509','35','KABUPATEN JEMBER'),('3510','35','KABUPATEN BANYUWANGI'),('3511','35','KABUPATEN BONDOWOSO'),('3512','35','KABUPATEN SITUBONDO'),('3513','35','KABUPATEN PROBOLINGGO'),('3514','35','KABUPATEN PASURUAN'),('3515','35','KABUPATEN SIDOARJO'),('3516','35','KABUPATEN MOJOKERTO'),('3517','35','KABUPATEN JOMBANG'),('3518','35','KABUPATEN NGANJUK'),('3519','35','KABUPATEN MADIUN'),('3520','35','KABUPATEN MAGETAN'),('3521','35','KABUPATEN NGAWI'),('3522','35','KABUPATEN BOJONEGORO'),('3523','35','KABUPATEN TUBAN'),('3524','35','KABUPATEN LAMONGAN'),('3525','35','KABUPATEN GRESIK'),('3526','35','KABUPATEN BANGKALAN'),('3527','35','KABUPATEN SAMPANG'),('3528','35','KABUPATEN PAMEKASAN'),('3529','35','KABUPATEN SUMENEP'),('3571','35','KOTA KEDIRI'),('3572','35','KOTA BLITAR'),('3573','35','KOTA MALANG'),('3574','35','KOTA PROBOLINGGO'),('3575','35','KOTA PASURUAN'),('3576','35','KOTA MOJOKERTO'),('3577','35','KOTA MADIUN'),('3578','35','KOTA SURABAYA'),('3579','35','KOTA BATU'),('3601','36','KABUPATEN PANDEGLANG'),('3602','36','KABUPATEN LEBAK'),('3603','36','KABUPATEN TANGERANG'),('3604','36','KABUPATEN SERANG'),('3671','36','KOTA TANGERANG'),('3672','36','KOTA CILEGON'),('3673','36','KOTA SERANG'),('3674','36','KOTA TANGERANG SELATAN'),('5101','51','KABUPATEN JEMBRANA'),('5102','51','KABUPATEN TABANAN'),('5103','51','KABUPATEN BADUNG'),('5104','51','KABUPATEN GIANYAR'),('5105','51','KABUPATEN KLUNGKUNG'),('5106','51','KABUPATEN BANGLI'),('5107','51','KABUPATEN KARANG ASEM'),('5108','51','KABUPATEN BULELENG'),('5171','51','KOTA DENPASAR'),('5201','52','KABUPATEN LOMBOK BARAT'),('5202','52','KABUPATEN LOMBOK TENGAH'),('5203','52','KABUPATEN LOMBOK TIMUR'),('5204','52','KABUPATEN SUMBAWA'),('5205','52','KABUPATEN DOMPU'),('5206','52','KABUPATEN BIMA'),('5207','52','KABUPATEN SUMBAWA BARAT'),('5208','52','KABUPATEN LOMBOK UTARA'),('5271','52','KOTA MATARAM'),('5272','52','KOTA BIMA'),('5301','53','KABUPATEN SUMBA BARAT'),('5302','53','KABUPATEN SUMBA TIMUR'),('5303','53','KABUPATEN KUPANG'),('5304','53','KABUPATEN TIMOR TENGAH SELATAN'),('5305','53','KABUPATEN TIMOR TENGAH UTARA'),('5306','53','KABUPATEN BELU'),('5307','53','KABUPATEN ALOR'),('5308','53','KABUPATEN LEMBATA'),('5309','53','KABUPATEN FLORES TIMUR'),('5310','53','KABUPATEN SIKKA'),('5311','53','KABUPATEN ENDE'),('5312','53','KABUPATEN NGADA'),('5313','53','KABUPATEN MANGGARAI'),('5314','53','KABUPATEN ROTE NDAO'),('5315','53','KABUPATEN MANGGARAI BARAT'),('5316','53','KABUPATEN SUMBA TENGAH'),('5317','53','KABUPATEN SUMBA BARAT DAYA'),('5318','53','KABUPATEN NAGEKEO'),('5319','53','KABUPATEN MANGGARAI TIMUR'),('5320','53','KABUPATEN SABU RAIJUA'),('5321','53','KABUPATEN MALAKA'),('5371','53','KOTA KUPANG'),('6101','61','KABUPATEN SAMBAS'),('6102','61','KABUPATEN BENGKAYANG'),('6103','61','KABUPATEN LANDAK'),('6104','61','KABUPATEN MEMPAWAH'),('6105','61','KABUPATEN SANGGAU'),('6106','61','KABUPATEN KETAPANG'),('6107','61','KABUPATEN SINTANG'),('6108','61','KABUPATEN KAPUAS HULU'),('6109','61','KABUPATEN SEKADAU'),('6110','61','KABUPATEN MELAWI'),('6111','61','KABUPATEN KAYONG UTARA'),('6112','61','KABUPATEN KUBU RAYA'),('6171','61','KOTA PONTIANAK'),('6172','61','KOTA SINGKAWANG'),('6201','62','KABUPATEN KOTAWARINGIN BARAT'),('6202','62','KABUPATEN KOTAWARINGIN TIMUR'),('6203','62','KABUPATEN KAPUAS'),('6204','62','KABUPATEN BARITO SELATAN'),('6205','62','KABUPATEN BARITO UTARA'),('6206','62','KABUPATEN SUKAMARA'),('6207','62','KABUPATEN LAMANDAU'),('6208','62','KABUPATEN SERUYAN'),('6209','62','KABUPATEN KATINGAN'),('6210','62','KABUPATEN PULANG PISAU'),('6211','62','KABUPATEN GUNUNG MAS'),('6212','62','KABUPATEN BARITO TIMUR'),('6213','62','KABUPATEN MURUNG RAYA'),('6271','62','KOTA PALANGKA RAYA'),('6301','63','KABUPATEN TANAH LAUT'),('6302','63','KABUPATEN KOTA BARU'),('6303','63','KABUPATEN BANJAR'),('6304','63','KABUPATEN BARITO KUALA'),('6305','63','KABUPATEN TAPIN'),('6306','63','KABUPATEN HULU SUNGAI SELATAN'),('6307','63','KABUPATEN HULU SUNGAI TENGAH'),('6308','63','KABUPATEN HULU SUNGAI UTARA'),('6309','63','KABUPATEN TABALONG'),('6310','63','KABUPATEN TANAH BUMBU'),('6311','63','KABUPATEN BALANGAN'),('6371','63','KOTA BANJARMASIN'),('6372','63','KOTA BANJAR BARU'),('6401','64','KABUPATEN PASER'),('6402','64','KABUPATEN KUTAI BARAT'),('6403','64','KABUPATEN KUTAI KARTANEGARA'),('6404','64','KABUPATEN KUTAI TIMUR'),('6405','64','KABUPATEN BERAU'),('6409','64','KABUPATEN PENAJAM PASER UTARA'),('6411','64','KABUPATEN MAHAKAM HULU'),('6471','64','KOTA BALIKPAPAN'),('6472','64','KOTA SAMARINDA'),('6474','64','KOTA BONTANG'),('6501','65','KABUPATEN MALINAU'),('6502','65','KABUPATEN BULUNGAN'),('6503','65','KABUPATEN TANA TIDUNG'),('6504','65','KABUPATEN NUNUKAN'),('6571','65','KOTA TARAKAN'),('7101','71','KABUPATEN BOLAANG MONGONDOW'),('7102','71','KABUPATEN MINAHASA'),('7103','71','KABUPATEN KEPULAUAN SANGIHE'),('7104','71','KABUPATEN KEPULAUAN TALAUD'),('7105','71','KABUPATEN MINAHASA SELATAN'),('7106','71','KABUPATEN MINAHASA UTARA'),('7107','71','KABUPATEN BOLAANG MONGONDOW UTARA'),('7108','71','KABUPATEN SIAU TAGULANDANG BIARO'),('7109','71','KABUPATEN MINAHASA TENGGARA'),('7110','71','KABUPATEN BOLAANG MONGONDOW SELATAN'),('7111','71','KABUPATEN BOLAANG MONGONDOW TIMUR'),('7171','71','KOTA MANADO'),('7172','71','KOTA BITUNG'),('7173','71','KOTA TOMOHON'),('7174','71','KOTA KOTAMOBAGU'),('7201','72','KABUPATEN BANGGAI KEPULAUAN'),('7202','72','KABUPATEN BANGGAI'),('7203','72','KABUPATEN MOROWALI'),('7204','72','KABUPATEN POSO'),('7205','72','KABUPATEN DONGGALA'),('7206','72','KABUPATEN TOLI-TOLI'),('7207','72','KABUPATEN BUOL'),('7208','72','KABUPATEN PARIGI MOUTONG'),('7209','72','KABUPATEN TOJO UNA-UNA'),('7210','72','KABUPATEN SIGI'),('7211','72','KABUPATEN BANGGAI LAUT'),('7212','72','KABUPATEN MOROWALI UTARA'),('7271','72','KOTA PALU'),('7301','73','KABUPATEN KEPULAUAN SELAYAR'),('7302','73','KABUPATEN BULUKUMBA'),('7303','73','KABUPATEN BANTAENG'),('7304','73','KABUPATEN JENEPONTO'),('7305','73','KABUPATEN TAKALAR'),('7306','73','KABUPATEN GOWA'),('7307','73','KABUPATEN SINJAI'),('7308','73','KABUPATEN MAROS'),('7309','73','KABUPATEN PANGKAJENE DAN KEPULAUAN'),('7310','73','KABUPATEN BARRU'),('7311','73','KABUPATEN BONE'),('7312','73','KABUPATEN SOPPENG'),('7313','73','KABUPATEN WAJO'),('7314','73','KABUPATEN SIDENRENG RAPPANG'),('7315','73','KABUPATEN PINRANG'),('7316','73','KABUPATEN ENREKANG'),('7317','73','KABUPATEN LUWU'),('7318','73','KABUPATEN TANA TORAJA'),('7322','73','KABUPATEN LUWU UTARA'),('7325','73','KABUPATEN LUWU TIMUR'),('7326','73','KABUPATEN TORAJA UTARA'),('7371','73','KOTA MAKASSAR'),('7372','73','KOTA PAREPARE'),('7373','73','KOTA PALOPO'),('7401','74','KABUPATEN BUTON'),('7402','74','KABUPATEN MUNA'),('7403','74','KABUPATEN KONAWE'),('7404','74','KABUPATEN KOLAKA'),('7405','74','KABUPATEN KONAWE SELATAN'),('7406','74','KABUPATEN BOMBANA'),('7407','74','KABUPATEN WAKATOBI'),('7408','74','KABUPATEN KOLAKA UTARA'),('7409','74','KABUPATEN BUTON UTARA'),('7410','74','KABUPATEN KONAWE UTARA'),('7411','74','KABUPATEN KOLAKA TIMUR'),('7412','74','KABUPATEN KONAWE KEPULAUAN'),('7413','74','KABUPATEN MUNA BARAT'),('7414','74','KABUPATEN BUTON TENGAH'),('7415','74','KABUPATEN BUTON SELATAN'),('7471','74','KOTA KENDARI'),('7472','74','KOTA BAUBAU'),('7501','75','KABUPATEN BOALEMO'),('7502','75','KABUPATEN GORONTALO'),('7503','75','KABUPATEN POHUWATO'),('7504','75','KABUPATEN BONE BOLANGO'),('7505','75','KABUPATEN GORONTALO UTARA'),('7571','75','KOTA GORONTALO'),('7601','76','KABUPATEN MAJENE'),('7602','76','KABUPATEN POLEWALI MANDAR'),('7603','76','KABUPATEN MAMASA'),('7604','76','KABUPATEN MAMUJU'),('7605','76','KABUPATEN MAMUJU UTARA'),('7606','76','KABUPATEN MAMUJU TENGAH'),('8101','81','KABUPATEN MALUKU TENGGARA BARAT'),('8102','81','KABUPATEN MALUKU TENGGARA'),('8103','81','KABUPATEN MALUKU TENGAH'),('8104','81','KABUPATEN BURU'),('8105','81','KABUPATEN KEPULAUAN ARU'),('8106','81','KABUPATEN SERAM BAGIAN BARAT'),('8107','81','KABUPATEN SERAM BAGIAN TIMUR'),('8108','81','KABUPATEN MALUKU BARAT DAYA'),('8109','81','KABUPATEN BURU SELATAN'),('8171','81','KOTA AMBON'),('8172','81','KOTA TUAL'),('8201','82','KABUPATEN HALMAHERA BARAT'),('8202','82','KABUPATEN HALMAHERA TENGAH'),('8203','82','KABUPATEN KEPULAUAN SULA'),('8204','82','KABUPATEN HALMAHERA SELATAN'),('8205','82','KABUPATEN HALMAHERA UTARA'),('8206','82','KABUPATEN HALMAHERA TIMUR'),('8207','82','KABUPATEN PULAU MOROTAI'),('8208','82','KABUPATEN PULAU TALIABU'),('8271','82','KOTA TERNATE'),('8272','82','KOTA TIDORE KEPULAUAN'),('9101','91','KABUPATEN FAKFAK'),('9102','91','KABUPATEN KAIMANA'),('9103','91','KABUPATEN TELUK WONDAMA'),('9104','91','KABUPATEN TELUK BINTUNI'),('9105','91','KABUPATEN MANOKWARI'),('9106','91','KABUPATEN SORONG SELATAN'),('9107','91','KABUPATEN SORONG'),('9108','91','KABUPATEN RAJA AMPAT'),('9109','91','KABUPATEN TAMBRAUW'),('9110','91','KABUPATEN MAYBRAT'),('9111','91','KABUPATEN MANOKWARI SELATAN'),('9112','91','KABUPATEN PEGUNUNGAN ARFAK'),('9171','91','KOTA SORONG'),('9401','94','KABUPATEN MERAUKE'),('9402','94','KABUPATEN JAYAWIJAYA'),('9403','94','KABUPATEN JAYAPURA'),('9404','94','KABUPATEN NABIRE'),('9408','94','KABUPATEN KEPULAUAN YAPEN'),('9409','94','KABUPATEN BIAK NUMFOR'),('9410','94','KABUPATEN PANIAI'),('9411','94','KABUPATEN PUNCAK JAYA'),('9412','94','KABUPATEN MIMIKA'),('9413','94','KABUPATEN BOVEN DIGOEL'),('9414','94','KABUPATEN MAPPI'),('9415','94','KABUPATEN ASMAT'),('9416','94','KABUPATEN YAHUKIMO'),('9417','94','KABUPATEN PEGUNUNGAN BINTANG'),('9418','94','KABUPATEN TOLIKARA'),('9419','94','KABUPATEN SARMI'),('9420','94','KABUPATEN KEEROM'),('9426','94','KABUPATEN WAROPEN'),('9427','94','KABUPATEN SUPIORI'),('9428','94','KABUPATEN MAMBERAMO RAYA'),('9429','94','KABUPATEN NDUGA'),('9430','94','KABUPATEN LANNY JAYA'),('9431','94','KABUPATEN MAMBERAMO TENGAH'),('9432','94','KABUPATEN YALIMO'),('9433','94','KABUPATEN PUNCAK'),('9434','94','KABUPATEN DOGIYAI'),('9435','94','KABUPATEN INTAN JAYA'),('9436','94','KABUPATEN DEIYAI'),('9471','94','KOTA JAYAPURA');
/*!40000 ALTER TABLE `tb_kabupaten_kota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kecamatan`
--

DROP TABLE IF EXISTS `tb_kecamatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kecamatan` (
  `id_kecamatan` varchar(30) NOT NULL,
  `id_kab_kota` varchar(30) DEFAULT NULL,
  `nama_kecamatan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kecamatan`),
  KEY `fk_memiliki_kecamatan` (`id_kab_kota`),
  CONSTRAINT `fk_memiliki_kecamatan` FOREIGN KEY (`id_kab_kota`) REFERENCES `tb_kabupaten_kota` (`id_kab_kota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kecamatan`
--

LOCK TABLES `tb_kecamatan` WRITE;
/*!40000 ALTER TABLE `tb_kecamatan` DISABLE KEYS */;
INSERT INTO `tb_kecamatan` VALUES ('1101010','1101','TEUPAH SELATAN'),('1101020','1101','SIMEULUE TIMUR'),('1101021','1101','TEUPAH BARAT'),('1101022','1101','TEUPAH TENGAH'),('1101030','1101','SIMEULUE TENGAH'),('1101031','1101','TELUK DALAM'),('1101032','1101','SIMEULUE CUT'),('1101040','1101','SALANG'),('1101050','1101','SIMEULUE BARAT'),('1101051','1101','ALAFAN'),('1102010','1102','PULAU BANYAK'),('1102011','1102','PULAU BANYAK BARAT'),('1102020','1102','SINGKIL'),('1102021','1102','SINGKIL UTARA'),('1102022','1102','KUALA BARU'),('1102030','1102','SIMPANG KANAN'),('1102031','1102','GUNUNG MERIAH'),('1102032','1102','DANAU PARIS'),('1102033','1102','SURO'),('1102042','1102','SINGKOHOR'),('1102043','1102','KOTA BAHARU'),('1103010','1103','TRUMON'),('1103011','1103','TRUMON TIMUR'),('1103012','1103','TRUMON TENGAH'),('1103020','1103','BAKONGAN'),('1103021','1103','BAKONGAN TIMUR'),('1103022','1103','KOTA BAHAGIA'),('1103030','1103','KLUET SELATAN'),('1103031','1103','KLUET TIMUR'),('1103040','1103','KLUET UTARA'),('1103041','1103','PASIE RAJA'),('1103042','1103','KLUET TENGAH'),('1103050','1103','TAPAK TUAN'),('1103060','1103','SAMA DUA'),('1103070','1103','SAWANG'),('1103080','1103','MEUKEK'),('1103090','1103','LABUHAN HAJI'),('1103091','1103','LABUHAN HAJI TIMUR'),('1103092','1103','LABUHAN HAJI BARAT'),('1104010','1104','LAWE ALAS'),('1104011','1104','BABUL RAHMAH'),('1104012','1104','TANOH ALAS'),('1104020','1104','LAWE SIGALA-GALA'),('1104021','1104','BABUL MAKMUR'),('1104022','1104','SEMADAM'),('1104023','1104','LEUSER'),('1104030','1104','BAMBEL'),('1104031','1104','BUKIT TUSAM'),('1104032','1104','LAWE SUMUR'),('1104040','1104','BABUSSALAM'),('1104041','1104','LAWE BULAN'),('1104050','1104','BADAR'),('1104051','1104','DARUL HASANAH'),('1104052','1104','KETAMBE'),('1104053','1104','DELENG POKHKISEN'),('1105080','1105','SERBA JADI'),('1105081','1105','SIMPANG JERNIH'),('1105082','1105','PEUNARON'),('1105090','1105','BIREM BAYEUN'),('1105100','1105','RANTAU SELAMAT'),('1105101','1105','SUNGAI RAYA'),('1105110','1105','PEUREULAK'),('1105111','1105','PEUREULAK TIMUR'),('1105112','1105','PEUREULAK BARAT'),('1105120','1105','RANTO PEUREULAK'),('1105130','1105','IDI RAYEUK'),('1105131','1105','PEUDAWA'),('1105132','1105','BANDA ALAM'),('1105133','1105','IDI TUNONG'),('1105134','1105','DARUL IHSAN'),('1105135','1105','IDI TIMUR'),('1105140','1105','DARUL AMAN'),('1105150','1105','NURUSSALAM'),('1105151','1105','DARUL FALAH'),('1105160','1105','JULOK'),('1105161','1105','INDRA MAKMUR'),('1105170','1105','PANTE BIDARI'),('1105180','1105','SIMPANG ULIM'),('1105181','1105','MADAT'),('1106010','1106','LINGE'),('1106011','1106','ATU LINTANG'),('1106012','1106','JAGONG JEGET'),('1106020','1106','BINTANG'),('1106031','1106','LUT TAWAR'),('1106032','1106','KEBAYAKAN'),('1106040','1106','PEGASING'),('1106041','1106','BIES'),('1106050','1106','BEBESEN'),('1106051','1106','KUTE PANANG'),('1106060','1106','SILIH NARA'),('1106061','1106','KETOL'),('1106062','1106','CELALA'),('1106063','1106','RUSIP ANTARA'),('1107050','1107','JOHAN PAHLAWAN'),('1107060','1107','SAMATIGA'),('1107061','1107','BUBON'),('1107062','1107','ARONGAN LAMBALEK'),('1107070','1107','WOYLA'),('1107071','1107','WOYLA BARAT'),('1107072','1107','WOYLA TIMUR'),('1107080','1107','KAWAY XVI'),('1107081','1107','MEUREUBO'),('1107082','1107','PANTAI CEUREMEN'),('1107083','1107','PANTON REU'),('1107090','1107','SUNGAI MAS'),('1108010','1108','LHOONG'),('1108020','1108','LHOKNGA'),('1108021','1108','LEUPUNG'),('1108030','1108','INDRAPURI'),('1108031','1108','KUTA COT GLIE'),('1108040','1108','SEULIMEUM'),('1108041','1108','KOTA JANTHO'),('1108042','1108','LEMBAH SEULAWAH'),('1108050','1108','MESJID RAYA'),('1108060','1108','DARUSSALAM'),('1108061','1108','BAITUSSALAM'),('1108070','1108','KUTA BARO'),('1108080','1108','MONTASIK'),('1108081','1108','BLANG BINTANG'),('1108090','1108','INGIN JAYA'),('1108091','1108','KRUENG BARONA JAYA'),('1108100','1108','SUKA MAKMUR'),('1108101','1108','KUTA MALAKA'),('1108102','1108','SIMPANG TIGA'),('1108110','1108','DARUL IMARAH'),('1108111','1108','DARUL KAMAL'),('1108120','1108','PEUKAN BADA'),('1108130','1108','PULO ACEH'),('1109010','1109','GEUMPANG'),('1109011','1109','MANE'),('1109070','1109','GLUMPANG TIGA'),('1109071','1109','GLUMPANG BARO'),('1109080','1109','MUTIARA'),('1109081','1109','MUTIARA TIMUR'),('1109090','1109','TIRO/TRUSEB'),('1109100','1109','TANGSE'),('1109111','1109','KEUMALA'),('1109112','1109','TITEUE'),('1109120','1109','SAKTI'),('1109130','1109','MILA'),('1109140','1109','PADANG TIJI'),('1109150','1109','DELIMA'),('1109151','1109','GRONG GRONG'),('1109160','1109','INDRAJAYA'),('1109170','1109','PEUKAN BARO'),('1109180','1109','KEMBANG TANJONG'),('1109190','1109','SIMPANG TIGA'),('1109200','1109','KOTA SIGLI'),('1109210','1109','PIDIE'),('1109220','1109','BATEE'),('1109230','1109','MUARA TIGA'),('1110010','1110','SAMALANGA'),('1110011','1110','SIMPANG MAMPLAM'),('1110020','1110','PANDRAH'),('1110030','1110','JEUNIEB'),('1110031','1110','PEULIMBANG'),('1110040','1110','PEUDADA'),('1110050','1110','JULI'),('1110060','1110','JEUMPA'),('1110061','1110','KOTA JUANG'),('1110062','1110','KUALA'),('1110070','1110','JANGKA'),('1110080','1110','PEUSANGAN'),('1110081','1110','PEUSANGAN SELATAN'),('1110082','1110','PEUSANGAN SIBLAH KRUENG'),('1110090','1110','MAKMUR'),('1110100','1110','GANDA PURA'),('1110101','1110','KUTA BLANG'),('1111010','1111','SAWANG'),('1111020','1111','NISAM'),('1111021','1111','NISAM ANTARA'),('1111022','1111','BANDA BARO'),('1111030','1111','KUTA MAKMUR'),('1111031','1111','SIMPANG KERAMAT'),('1111040','1111','SYAMTALIRA BAYU'),('1111041','1111','GEUREUDONG PASE'),('1111050','1111','MEURAH MULIA'),('1111060','1111','MATANGKULI'),('1111061','1111','PAYA BAKONG'),('1111062','1111','PIRAK TIMU'),('1111070','1111','COT GIREK'),('1111080','1111','TANAH JAMBO AYE'),('1111081','1111','LANGKAHAN'),('1111090','1111','SEUNUDDON'),('1111100','1111','BAKTIYA'),('1111101','1111','BAKTIYA BARAT'),('1111110','1111','LHOKSUKON'),('1111120','1111','TANAH LUAS'),('1111121','1111','NIBONG'),('1111130','1111','SAMUDERA'),('1111140','1111','SYAMTALIRA ARON'),('1111150','1111','TANAH PASIR'),('1111151','1111','LAPANG'),('1111160','1111','MUARA BATU'),('1111170','1111','DEWANTARA'),('1112010','1112','MANGGENG'),('1112011','1112','LEMBAH SABIL'),('1112020','1112','TANGAN-TANGAN'),('1112021','1112','SETIA'),('1112030','1112','BLANG PIDIE'),('1112031','1112','JEUMPA'),('1112040','1112','SUSOH'),('1112050','1112','KUALA BATEE'),('1112060','1112','BABAH ROT'),('1113010','1113','KUTA PANJANG'),('1113011','1113','BLANG JERANGO'),('1113020','1113','BLANGKEJEREN'),('1113021','1113','PUTRI BETUNG'),('1113022','1113','DABUN GELANG'),('1113023','1113','BLANG PEGAYON'),('1113030','1113','PINING'),('1113040','1113','RIKIT GAIB'),('1113041','1113','PANTAN CUACA'),('1113050','1113','TERANGUN'),('1113051','1113','TRIPE JAYA'),('1114010','1114','TAMIANG HULU'),('1114011','1114','BANDAR PUSAKA'),('1114020','1114','KEJURUAN MUDA'),('1114021','1114','TENGGULUN'),('1114030','1114','RANTAU'),('1114040','1114','KOTA KUALA SIMPANG'),('1114050','1114','SERUWAY'),('1114060','1114','BENDAHARA'),('1114061','1114','BANDA MULIA'),('1114070','1114','KARANG BARU'),('1114071','1114','SEKERAK'),('1114080','1114','MANYAK PAYED'),('1115010','1115','DARUL MAKMUR'),('1115011','1115','TRIPA MAKMUR'),('1115020','1115','KUALA'),('1115021','1115','KUALA PESISIR'),('1115022','1115','TADU RAYA'),('1115030','1115','BEUTONG'),('1115031','1115','BEUTONG ATEUH BANGGALANG'),('1115040','1115','SEUNAGAN'),('1115041','1115','SUKA MAKMUE'),('1115050','1115','SEUNAGAN TIMUR'),('1116010','1116','TEUNOM'),('1116011','1116','PASIE RAYA'),('1116020','1116','PANGA'),('1116030','1116','KRUENG SABEE'),('1116040','1116','SETIA BAKTI'),('1116050','1116','SAMPOINIET'),('1116051','1116','DARUL HIKMAH'),('1116060','1116','JAYA'),('1116061','1116','INDRA JAYA'),('1117010','1117','TIMANG GAJAH'),('1117011','1117','GAJAH PUTIH'),('1117020','1117','PINTU RIME GAYO'),('1117030','1117','BUKIT'),('1117040','1117','WIH PESAM'),('1117050','1117','BANDAR'),('1117051','1117','BENER KELIPAH'),('1117060','1117','SYIAH UTAMA'),('1117061','1117','MESIDAH'),('1117070','1117','PERMATA'),('1118010','1118','MEUREUDU'),('1118020','1118','MEURAH DUA'),('1118030','1118','BANDAR DUA'),('1118040','1118','JANGKA BUYA'),('1118050','1118','ULIM'),('1118060','1118','TRIENGGADENG'),('1118070','1118','PANTERAJA'),('1118080','1118','BANDAR BARU'),('1171010','1171','MEURAXA'),('1171011','1171','JAYA BARU'),('1171012','1171','BANDA RAYA'),('1171020','1171','BAITURRAHMAN'),('1171021','1171','LUENG BATA'),('1171030','1171','KUTA ALAM'),('1171031','1171','KUTA RAJA'),('1171040','1171','SYIAH KUALA'),('1171041','1171','ULEE KARENG'),('1172010','1172','SUKAJAYA'),('1172020','1172','SUKAKARYA'),('1173010','1173','LANGSA TIMUR'),('1173011','1173','LANGSA LAMA'),('1173020','1173','LANGSA BARAT'),('1173021','1173','LANGSA BARO'),('1173030','1173','LANGSA KOTA'),('1174010','1174','BLANG MANGAT'),('1174020','1174','MUARA DUA'),('1174021','1174','MUARA SATU'),('1174030','1174','BANDA SAKTI'),('1175010','1175','SIMPANG KIRI'),('1175020','1175','PENANGGALAN'),('1175030','1175','RUNDENG'),('1175040','1175','SULTAN DAULAT'),('1175050','1175','LONGKIB'),('1201060','1201','IDANO GAWO'),('1201061','1201','BAWOLATO'),('1201062','1201','ULUGAWO'),('1201070','1201','GIDO'),('1201071','1201','SOGAEADU'),('1201081','1201','MA U'),('1201082','1201','SOMOLO - MOLO'),('1201130','1201','HILIDUHO'),('1201131','1201','HILI SERANGKAI'),('1201132','1201','BOTOMUZOI'),('1202010','1202','BATAHAN'),('1202011','1202','SINUNUKAN'),('1202020','1202','BATANG NATAL'),('1202021','1202','LINGGA BAYU'),('1202022','1202','RANTO BAEK'),('1202030','1202','KOTANOPAN'),('1202031','1202','ULU PUNGKUT'),('1202032','1202','TAMBANGAN'),('1202033','1202','LEMBAH SORIK MARAPI'),('1202034','1202','PUNCAK SORIK MARAPI'),('1202040','1202','MUARA SIPONGI'),('1202041','1202','PAKANTAN'),('1202050','1202','PANYABUNGAN'),('1202051','1202','PANYABUNGAN SELATAN'),('1202052','1202','PANYABUNGAN BARAT'),('1202053','1202','PANYABUNGAN UTARA'),('1202054','1202','PANYABUNGAN TIMUR'),('1202055','1202','HUTA BARGOT'),('1202060','1202','NATAL'),('1202070','1202','MUARA BATANG GADIS'),('1202080','1202','SIABU'),('1202081','1202','BUKIT MALINTANG'),('1202082','1202','NAGA JUANG'),('1203010','1203','BATANG ANGKOLA'),('1203011','1203','SAYUR MATINGGI'),('1203012','1203','TANO TOMBANGAN ANGKOLA'),('1203070','1203','ANGKOLA TIMUR'),('1203080','1203','ANGKOLA SELATAN'),('1203090','1203','ANGKOLA  BARAT'),('1203091','1203','ANGKOLA SANGKUNUR'),('1203100','1203','BATANG TORU'),('1203101','1203','MARANCAR'),('1203102','1203','MUARA BATANG TORU'),('1203110','1203','SIPIROK'),('1203120','1203','ARSE'),('1203160','1203','SAIPAR DOLOK HOLE'),('1203161','1203','AEK BILAH'),('1204010','1204','PINANG SORI'),('1204011','1204','BADIRI'),('1204020','1204','SIBABANGUN'),('1204021','1204','LUMUT'),('1204022','1204','SUKABANGUN'),('1204030','1204','PANDAN'),('1204031','1204','TUKKA'),('1204032','1204','SARUDIK'),('1204040','1204','TAPIAN NAULI'),('1204041','1204','SITAHUIS'),('1204050','1204','KOLANG'),('1204060','1204','SORKAM'),('1204061','1204','SORKAM BARAT'),('1204062','1204','PASARIBU TOBING'),('1204070','1204','BARUS'),('1204071','1204','SOSOR GADONG'),('1204072','1204','ANDAM DEWI'),('1204073','1204','BARUS UTARA'),('1204080','1204','MANDUAMAS'),('1204081','1204','SIRANDORUNG'),('1205030','1205','PARMONANGAN'),('1205040','1205','ADIANKOTING'),('1205050','1205','SIPOHOLON'),('1205060','1205','TARUTUNG'),('1205061','1205','SIATAS BARITA'),('1205070','1205','PAHAE JULU'),('1205080','1205','PAHAE JAE'),('1205081','1205','PURBATUA'),('1205082','1205','SIMANGUMBAN'),('1205090','1205','PANGARIBUAN'),('1205100','1205','GAROGA'),('1205110','1205','SIPAHUTAR'),('1205120','1205','SIBORONGBORONG'),('1205130','1205','PAGARAN'),('1205180','1205','MUARA'),('1206030','1206','BALIGE'),('1206031','1206','TAMPAHAN'),('1206040','1206','LAGUBOTI'),('1206050','1206','HABINSARAN'),('1206051','1206','BORBOR'),('1206052','1206','NASSAU'),('1206060','1206','SILAEN'),('1206061','1206','SIGUMPAR'),('1206070','1206','PORSEA'),('1206071','1206','PINTU POHAN MERANTI'),('1206072','1206','SIANTAR NARUMONDA'),('1206073','1206','PARMAKSIAN'),('1206080','1206','LUMBAN JULU'),('1206081','1206','ULUAN'),('1206082','1206','AJIBATA'),('1206083','1206','BONATUA LUNASI'),('1207050','1207','BILAH HULU'),('1207070','1207','PANGKATAN'),('1207080','1207','BILAH BARAT'),('1207130','1207','BILAH HILIR'),('1207140','1207','PANAI HULU'),('1207150','1207','PANAI TENGAH'),('1207160','1207','PANAI HILIR'),('1207210','1207','RANTAU SELATAN'),('1207220','1207','RANTAU UTARA'),('1208010','1208','BANDAR PASIR MANDOGE'),('1208020','1208','BANDAR PULAU'),('1208021','1208','AEK SONGSONGAN'),('1208022','1208','RAHUNING'),('1208030','1208','PULAU RAKYAT'),('1208031','1208','AEK KUASAN'),('1208032','1208','AEK LEDONG'),('1208040','1208','SEI KEPAYANG'),('1208041','1208','SEI KEPAYANG BARAT'),('1208042','1208','SEI KEPAYANG TIMUR'),('1208050','1208','TANJUNG BALAI'),('1208060','1208','SIMPANG EMPAT'),('1208061','1208','TELUK DALAM'),('1208070','1208','AIR BATU'),('1208071','1208','SEI DADAP'),('1208080','1208','BUNTU PANE'),('1208081','1208','TINGGI RAJA'),('1208082','1208','SETIA JANJI'),('1208090','1208','MERANTI'),('1208091','1208','PULO BANDRING'),('1208092','1208','RAWANG PANCA ARGA'),('1208100','1208','AIR JOMAN'),('1208101','1208','SILAU LAUT'),('1208160','1208','KISARAN BARAT'),('1208170','1208','KISARAN TIMUR'),('1209010','1209','SILIMAKUTA'),('1209011','1209','PEMATANG SILIMAHUTA'),('1209020','1209','PURBA'),('1209021','1209','HARANGGAOL HORISON'),('1209040','1209','SIDAMANIK'),('1209041','1209','PEMATANG SIDAMANIK'),('1209050','1209','GIRSANG SIPANGAN BOLON'),('1209060','1209','TANAH JAWA'),('1209061','1209','HATONDUHAN'),('1209070','1209','DOLOK PANRIBUAN'),('1209080','1209','JORLANG HATARAN'),('1209090','1209','PANEI'),('1209091','1209','PANOMBEAN PANEI'),('1209100','1209','RAYA'),('1209101','1209','DOLOG MASAGAL'),('1209110','1209','DOLOK SILAU'),('1209120','1209','SILAU KAHEAN'),('1209130','1209','RAYA KAHEAN'),('1209140','1209','TAPIAN DOLOK'),('1209150','1209','DOLOK BATU NANGGAR'),('1209160','1209','SIANTAR'),('1209161','1209','GUNUNG MALELA'),('1209162','1209','GUNUNG MALIGAS'),('1209170','1209','HUTABAYU RAJA'),('1209171','1209','JAWA MARAJA BAH JAMBI'),('1209180','1209','PEMATANG BANDAR'),('1209181','1209','BANDAR HULUAN'),('1209190','1209','BANDAR'),('1209191','1209','BANDAR MASILAM'),('1209200','1209','BOSAR MALIGAS'),('1209210','1209','UJUNG PADANG'),('1210030','1210','SIDIKALANG'),('1210031','1210','BERAMPU'),('1210032','1210','SITINJO'),('1210040','1210','PARBULUAN'),('1210050','1210','SUMBUL'),('1210051','1210','SILAHISABUNGAN'),('1210060','1210','SILIMA PUNGGA-PUNGGA'),('1210061','1210','LAE PARIRA'),('1210070','1210','SIEMPAT NEMPU'),('1210080','1210','SIEMPAT NEMPU HULU'),('1210090','1210','SIEMPAT NEMPU HILIR'),('1210100','1210','TIGA LINGGA'),('1210101','1210','GUNUNG SITEMBER'),('1210110','1210','PEGAGAN HILIR'),('1210120','1210','TANAH PINEM'),('1211010','1211','MARDINGDING'),('1211020','1211','LAUBALENG'),('1211030','1211','TIGA BINANGA'),('1211040','1211','JUHAR'),('1211050','1211','MUNTE'),('1211060','1211','KUTA BULUH'),('1211070','1211','PAYUNG'),('1211071','1211','TIGANDERKET'),('1211080','1211','SIMPANG EMPAT'),('1211081','1211','NAMAN TERAN'),('1211082','1211','MERDEKA'),('1211090','1211','KABANJAHE'),('1211100','1211','BERASTAGI'),('1211110','1211','TIGAPANAH'),('1211111','1211','DOLAT RAYAT'),('1211120','1211','MEREK'),('1211130','1211','BARUSJAHE'),('1212010','1212','GUNUNG MERIAH'),('1212020','1212','SINEMBAH TANJUNG MUDA HULU'),('1212030','1212','SIBOLANGIT'),('1212040','1212','KUTALIMBARU'),('1212050','1212','PANCUR BATU'),('1212060','1212','NAMO RAMBE'),('1212070','1212','BIRU-BIRU'),('1212080','1212','SINEMBAH TANJUNG MUDA HILIR'),('1212090','1212','BANGUN PURBA'),('1212190','1212','GALANG'),('1212200','1212','TANJUNG MORAWA'),('1212210','1212','PATUMBAK'),('1212220','1212','DELI TUA'),('1212230','1212','SUNGGAL'),('1212240','1212','HAMPARAN PERAK'),('1212250','1212','LABUHAN DELI'),('1212260','1212','PERCUT SEI TUAN'),('1212270','1212','BATANG KUIS'),('1212280','1212','PANTAI LABU'),('1212290','1212','BERINGIN'),('1212300','1212','LUBUK PAKAM'),('1212310','1212','PAGAR MERBAU'),('1213010','1213','BOHOROK'),('1213011','1213','SIRAPIT'),('1213020','1213','SALAPIAN'),('1213021','1213','KUTAMBARU'),('1213030','1213','SEI BINGAI'),('1213040','1213','KUALA'),('1213050','1213','SELESAI'),('1213060','1213','BINJAI'),('1213070','1213','STABAT'),('1213080','1213','WAMPU'),('1213090','1213','BATANG SERANGAN'),('1213100','1213','SAWIT SEBERANG'),('1213110','1213','PADANG TUALANG'),('1213120','1213','HINAI'),('1213130','1213','SECANGGANG'),('1213140','1213','TANJUNG PURA'),('1213150','1213','GEBANG'),('1213160','1213','BABALAN'),('1213170','1213','SEI LEPAN'),('1213180','1213','BRANDAN BARAT'),('1213190','1213','BESITANG'),('1213200','1213','PANGKALAN SUSU'),('1213201','1213','PEMATANG JAYA'),('1214010','1214','HIBALA'),('1214011','1214','TANAH MASA'),('1214020','1214','PULAU-PULAU BATU'),('1214021','1214','PULAU-PULAU BATU TIMUR'),('1214022','1214','SIMUK'),('1214023','1214','PULAU-PULAU BATU BARAT'),('1214024','1214','PULAU-PULAU BATU UTARA'),('1214030','1214','TELUK DALAM'),('1214031','1214','FANAYAMA'),('1214032','1214','TOMA'),('1214033','1214','MANIAMOLO'),('1214034','1214','MAZINO'),('1214035','1214','LUAHAGUNDRE MANIAMOLO'),('1214036','1214','ONOLALU'),('1214040','1214','AMANDRAYA'),('1214041','1214','ARAMO'),('1214042','1214','ULUSUSUA'),('1214050','1214','LAHUSA'),('1214051','1214','SIDUAORI'),('1214052','1214','SOMAMBAWA'),('1214060','1214','GOMO'),('1214061','1214','SUSUA'),('1214062','1214','MAZO'),('1214063','1214','UMBUNASI'),('1214064','1214','IDANOTAE'),('1214065','1214','ULUIDANOTAE'),('1214066','1214','BORONADU'),('1214070','1214','LOLOMATUA'),('1214071','1214','ULUNOYO'),('1214072','1214','HURUNA'),('1214080','1214','LOLOWA\'U'),('1214081','1214','HILIMEGAI'),('1214082','1214','OOU'),('1214083','1214','ONOHAZUMBA'),('1214084','1214','HILISALAWAAHE'),('1215010','1215','PAKKAT'),('1215020','1215','ONAN GANJANG'),('1215030','1215','SIJAMA POLANG'),('1215040','1215','DOLOK SANGGUL'),('1215050','1215','LINTONG NIHUTA'),('1215060','1215','PARANGINAN'),('1215070','1215','BAKTI RAJA'),('1215080','1215','POLLUNG'),('1215090','1215','PARLILITAN'),('1215100','1215','TARA BINTANG'),('1216010','1216','SALAK'),('1216011','1216','SITELLU TALI URANG JEHE'),('1216012','1216','PAGINDAR'),('1216013','1216','SITELLU TALI URANG JULU'),('1216014','1216','PERGETTENG-GETTENG SENGKUT'),('1216020','1216','KERAJAAN'),('1216021','1216','TINADA'),('1216022','1216','SIEMPAT RUBE'),('1217010','1217','SIANJUR MULA MULA'),('1217020','1217','HARIAN'),('1217030','1217','SITIO-TIO'),('1217040','1217','ONAN RUNGGU'),('1217050','1217','NAINGGOLAN'),('1217060','1217','PALIPI'),('1217070','1217','RONGGUR NIHUTA'),('1217080','1217','PANGURURAN'),('1217090','1217','SIMANINDO'),('1218010','1218','KOTARIH'),('1218011','1218','SILINDA'),('1218012','1218','BINTANG BAYU'),('1218020','1218','DOLOK MASIHUL'),('1218021','1218','SERBAJADI'),('1218030','1218','SIPISPIS'),('1218040','1218','DOLOK MERAWAN'),('1218050','1218','TEBINGTINGGI'),('1218051','1218','TEBING SYAHBANDAR'),('1218060','1218','BANDAR KHALIPAH'),('1218070','1218','TANJUNG BERINGIN'),('1218080','1218','SEI RAMPAH'),('1218081','1218','SEI BAMBAN'),('1218090','1218','TELUK MENGKUDU'),('1218100','1218','PERBAUNGAN'),('1218101','1218','PEGAJAHAN'),('1218110','1218','PANTAI CERMIN'),('1219010','1219','SEI BALAI'),('1219020','1219','TANJUNG TIRAM'),('1219021','1219','NIBUNG HANGUS'),('1219030','1219','TALAWI'),('1219031','1219','DATUK TANAH DATAR'),('1219040','1219','LIMAPULUH'),('1219041','1219','LIMA PULUH PESISIR'),('1219042','1219','DATUK LIMA PULUH'),('1219050','1219','AIR PUTIH'),('1219060','1219','SEI SUKA'),('1219061','1219','LAUT TADOR'),('1219070','1219','MEDANG DERAS'),('1220010','1220','BATANG ONANG'),('1220020','1220','PADANG BOLAK JULU'),('1220030','1220','PORTIBI'),('1220040','1220','PADANG BOLAK'),('1220041','1220','PADANG BOLAK TENGGARA'),('1220050','1220','SIMANGAMBAT'),('1220051','1220','UJUNG BATU'),('1220060','1220','HALONGONAN'),('1220061','1220','HALONGONAN TIMUR'),('1220070','1220','DOLOK'),('1220080','1220','DOLOK SIGOMPULON'),('1220090','1220','HULU SIHAPAS'),('1221010','1221','SOSOPAN'),('1221020','1221','ULU BARUMUN'),('1221030','1221','BARUMUN'),('1221031','1221','BARUMUN SELATAN'),('1221040','1221','LUBUK BARUMUN'),('1221050','1221','SOSA'),('1221060','1221','BATANG LUBU SUTAM'),('1221070','1221','HUTA RAJA TINGGI'),('1221080','1221','HURISTAK'),('1221090','1221','BARUMUN TENGAH'),('1221091','1221','AEK NABARA BARUMUN'),('1221092','1221','SIHAPAS BARUMUN'),('1222010','1222','SUNGAI KANAN'),('1222020','1222','TORGAMBA'),('1222030','1222','KOTA PINANG'),('1222040','1222','SILANGKITANG'),('1222050','1222','KAMPUNG RAKYAT'),('1223010','1223','NA IX-X'),('1223020','1223','MARBAU'),('1223030','1223','AEK KUO'),('1223040','1223','AEK NATAS'),('1223050','1223','KUALUH SELATAN'),('1223060','1223','KUALUH HILIR'),('1223070','1223','KUALUH HULU'),('1223080','1223','KUALUH LEIDONG'),('1224010','1224','TUGALA OYO'),('1224020','1224','ALASA'),('1224030','1224','ALASA TALU MUZOI'),('1224040','1224','NAMOHALU ESIWA'),('1224050','1224','SITOLU ORI'),('1224060','1224','TUHEMBERUA'),('1224070','1224','SAWO'),('1224080','1224','LOTU'),('1224090','1224','LAHEWA TIMUR'),('1224100','1224','AFULU'),('1224110','1224','LAHEWA'),('1225010','1225','SIROMBU'),('1225020','1225','LAHOMI'),('1225030','1225','ULU MORO O'),('1225040','1225','LOLOFITU MOI'),('1225050','1225','MANDREHE UTARA'),('1225060','1225','MANDREHE'),('1225070','1225','MANDREHE BARAT'),('1225080','1225','MORO O'),('1271010','1271','SIBOLGA UTARA'),('1271020','1271','SIBOLGA KOTA'),('1271030','1271','SIBOLGA SELATAN'),('1271031','1271','SIBOLGA SAMBAS'),('1272010','1272','DATUK BANDAR'),('1272011','1272','DATUK BANDAR TIMUR'),('1272020','1272','TANJUNG BALAI SELATAN'),('1272030','1272','TANJUNG BALAI UTARA'),('1272040','1272','SEI TUALANG RASO'),('1272050','1272','TELUK NIBUNG'),('1273010','1273','SIANTAR MARIHAT'),('1273011','1273','SIANTAR MARIMBUN'),('1273020','1273','SIANTAR SELATAN'),('1273030','1273','SIANTAR BARAT'),('1273040','1273','SIANTAR UTARA'),('1273050','1273','SIANTAR TIMUR'),('1273060','1273','SIANTAR MARTOBA'),('1273061','1273','SIANTAR SITALASARI'),('1274010','1274','PADANG HULU'),('1274011','1274','TEBING TINGGI KOTA'),('1274020','1274','RAMBUTAN'),('1274021','1274','BAJENIS'),('1274030','1274','PADANG HILIR'),('1275010','1275','MEDAN TUNTUNGAN'),('1275020','1275','MEDAN JOHOR'),('1275030','1275','MEDAN AMPLAS'),('1275040','1275','MEDAN DENAI'),('1275050','1275','MEDAN AREA'),('1275060','1275','MEDAN KOTA'),('1275070','1275','MEDAN MAIMUN'),('1275080','1275','MEDAN POLONIA'),('1275090','1275','MEDAN BARU'),('1275100','1275','MEDAN SELAYANG'),('1275110','1275','MEDAN SUNGGAL'),('1275120','1275','MEDAN HELVETIA'),('1275130','1275','MEDAN PETISAH'),('1275140','1275','MEDAN BARAT'),('1275150','1275','MEDAN TIMUR'),('1275160','1275','MEDAN PERJUANGAN'),('1275170','1275','MEDAN TEMBUNG'),('1275180','1275','MEDAN DELI'),('1275190','1275','MEDAN LABUHAN'),('1275200','1275','MEDAN MARELAN'),('1275210','1275','MEDAN BELAWAN'),('1276010','1276','BINJAI SELATAN'),('1276020','1276','BINJAI KOTA'),('1276030','1276','BINJAI TIMUR'),('1276040','1276','BINJAI UTARA'),('1276050','1276','BINJAI BARAT'),('1277010','1277','PADANGSIDIMPUAN TENGGARA'),('1277020','1277','PADANGSIDIMPUAN SELATAN'),('1277030','1277','PADANGSIDIMPUAN BATUNADUA'),('1277040','1277','PADANGSIDIMPUAN UTARA'),('1277050','1277','PADANGSIDIMPUAN HUTAIMBARU'),('1277051','1277','PADANGSIDIMPUAN ANGKOLA JULU'),('1278010','1278','GUNUNGSITOLI IDANOI'),('1278020','1278','GUNUNGSITOLI SELATAN'),('1278030','1278','GUNUNGSITOLI BARAT'),('1278040','1278','GUNUNG SITOLI'),('1278050','1278','GUNUNGSITOLI ALO OA'),('1278060','1278','GUNUNGSITOLI UTARA'),('1301011','1301','PAGAI SELATAN'),('1301012','1301','SIKAKAP'),('1301013','1301','PAGAI UTARA'),('1301021','1301','SIPORA SELATAN'),('1301022','1301','SIPORA UTARA'),('1301030','1301','SIBERUT SELATAN'),('1301031','1301','SEBERUT BARAT DAYA'),('1301032','1301','SIBERUT TENGAH'),('1301040','1301','SIBERUT UTARA'),('1301041','1301','SIBERUT BARAT'),('1302011','1302','SILAUT'),('1302012','1302','LUNANG'),('1302020','1302','BASA AMPEK BALAI TAPAN'),('1302021','1302','RANAH AMPEK HULU TAPAN'),('1302030','1302','PANCUNG SOAL'),('1302031','1302','AIRPURA'),('1302040','1302','LINGGO SARI BAGANTI'),('1302050','1302','RANAH PESISIR'),('1302060','1302','LENGAYANG'),('1302070','1302','SUTERA'),('1302080','1302','BATANG KAPAS'),('1302090','1302','IV JURAI'),('1302100','1302','BAYANG'),('1302101','1302','IV  NAGARI BAYANG UTARA'),('1302110','1302','KOTO XI TARUSAN'),('1303040','1303','PANTAI CERMIN'),('1303050','1303','LEMBAH GUMANTI'),('1303051','1303','HILIRAN GUMANTI'),('1303060','1303','PAYUNG SEKAKI'),('1303061','1303','TIGO LURAH'),('1303070','1303','LEMBANG JAYA'),('1303071','1303','DANAU KEMBAR'),('1303080','1303','GUNUNG TALANG'),('1303090','1303','BUKIT SUNDI'),('1303100','1303','IX KOTO SUNGAI LASI'),('1303110','1303','KUBUNG'),('1303120','1303','X KOTO DIATAS'),('1303130','1303','X KOTO SINGKARAK'),('1303140','1303','JUNJUNG SIRIH'),('1304050','1304','KAMANG BARU'),('1304060','1304','TANJUNG GADANG'),('1304070','1304','SIJUNJUNG'),('1304071','1304','LUBUK TAROK'),('1304080','1304','IV NAGARI'),('1304090','1304','KUPITAN'),('1304100','1304','KOTO TUJUH'),('1304110','1304','SUMPUR KUDUS'),('1305010','1305','SEPULUH KOTO'),('1305020','1305','BATIPUH'),('1305021','1305','BATIPUH SELATAN'),('1305030','1305','PARIANGAN'),('1305040','1305','RAMBATAN'),('1305050','1305','LIMA KAUM'),('1305060','1305','TANJUNG EMAS'),('1305070','1305','PADANG GANTING'),('1305080','1305','LINTAU BUO'),('1305081','1305','LINTAU BUO UTARA'),('1305090','1305','SUNGAYANG'),('1305100','1305','SUNGAI TARAB'),('1305110','1305','SALIMPAUNG'),('1305111','1305','TANJUNG BARU'),('1306010','1306','BATANG ANAI'),('1306020','1306','LUBUK ALUNG'),('1306021','1306','SINTUK TOBOH GADANG'),('1306030','1306','ULAKAN TAPAKIS'),('1306040','1306','NAN SABARIS'),('1306050','1306','2 X 11 ENAM LINGKUNG'),('1306051','1306','ENAM LINGKUNG'),('1306052','1306','2 X 11 KAYU TANAM'),('1306060','1306','VII KOTO SUNGAI SARIAK'),('1306061','1306','PATAMUAN'),('1306062','1306','PADANG SAGO'),('1306070','1306','V KOTO KP DALAM'),('1306071','1306','V KOTO TIMUR'),('1306080','1306','SUNGAI LIMAU'),('1306081','1306','BATANG GASAN'),('1306090','1306','SUNGAI GERINGGING'),('1306100','1306','IV KOTO AUR MALINTANG'),('1307010','1307','TANJUNG MUTIARA'),('1307020','1307','LUBUK BASUNG'),('1307021','1307','AMPEK NAGARI'),('1307030','1307','TANJUNG RAYA'),('1307040','1307','MATUR'),('1307050','1307','IV KOTO'),('1307051','1307','MALALAK'),('1307061','1307','BANUHAMPU'),('1307062','1307','SUNGAI PUA'),('1307070','1307','AMPEK ANGKEK'),('1307071','1307','CANDUANG'),('1307080','1307','BASO'),('1307090','1307','TILATANG KAMANG'),('1307091','1307','KAMANG MAGEK'),('1307100','1307','PALEMBAYAN'),('1307110','1307','PALUPUH'),('1308010','1308','PAYAKUMBUH'),('1308011','1308','AKABILURU'),('1308020','1308','LUAK'),('1308021','1308','LAREH SAGO HALABAN'),('1308022','1308','SITUJUAH LIMO NAGARI'),('1308030','1308','HARAU'),('1308040','1308','GUGUAK'),('1308041','1308','MUNGKA'),('1308050','1308','SULIKI'),('1308051','1308','BUKIK BARISAN'),('1308060','1308','GUNUANG OMEH'),('1308070','1308','KAPUR IX'),('1308080','1308','PANGKALAN KOTO BARU'),('1309070','1309','BONJOL'),('1309071','1309','TIGO NAGARI'),('1309072','1309','SIMPANG ALAHAN MATI'),('1309080','1309','LUBUK SIKAPING'),('1309100','1309','DUA KOTO'),('1309110','1309','PANTI'),('1309111','1309','PADANG GELUGUR'),('1309121','1309','RAO'),('1309122','1309','MAPAT TUNGGUL'),('1309123','1309','MAPAT TUNGGUL SELATAN'),('1309124','1309','RAO SELATAN'),('1309125','1309','RAO UTARA'),('1310010','1310','SANGIR'),('1310020','1310','SANGIR JUJUAN'),('1310021','1310','SANGIR BALAI JANGGO'),('1310030','1310','SANGIR BATANG HARI'),('1310040','1310','SUNGAI PAGU'),('1310041','1310','PAUAH DUO'),('1310050','1310','KOTO PARIK GADANG DIATEH'),('1311010','1311','SUNGAI RUMBAI'),('1311011','1311','KOTO BESAR'),('1311012','1311','ASAM JUJUHAN'),('1311020','1311','KOTO BARU'),('1311021','1311','KOTO SALAK'),('1311022','1311','TIUMANG'),('1311023','1311','PADANG LAWEH'),('1311030','1311','SITIUNG'),('1311031','1311','TIMPEH'),('1311040','1311','PULAU PUNJUNG'),('1311041','1311','IX KOTO'),('1312010','1312','SUNGAI BEREMAS'),('1312020','1312','RANAH BATAHAN'),('1312030','1312','KOTO BALINGKA'),('1312040','1312','SUNGAI AUR'),('1312050','1312','LEMBAH MALINTANG'),('1312060','1312','GUNUNG TULEH'),('1312070','1312','TALAMAU'),('1312080','1312','PASAMAN'),('1312090','1312','LUHAK NAN DUO'),('1312100','1312','SASAK RANAH PASISIE'),('1312110','1312','KINALI'),('1371010','1371','BUNGUS TELUK KABUNG'),('1371020','1371','LUBUK KILANGAN'),('1371030','1371','LUBUK BEGALUNG'),('1371040','1371','PADANG SELATAN'),('1371050','1371','PADANG TIMUR'),('1371060','1371','PADANG BARAT'),('1371070','1371','PADANG UTARA'),('1371080','1371','NANGGALO'),('1371090','1371','KURANJI'),('1371100','1371','PAUH'),('1371110','1371','KOTO TANGAH'),('1372010','1372','LUBUK SIKARAH'),('1372020','1372','TANJUNG HARAPAN'),('1373010','1373','SILUNGKANG'),('1373020','1373','LEMBAH SEGAR'),('1373030','1373','BARANGIN'),('1373040','1373','TALAWI'),('1374010','1374','PADANG PANJANG BARAT'),('1374020','1374','PADANG PANJANG TIMUR'),('1375010','1375','GUGUK PANJANG'),('1375020','1375','MANDIANGIN KOTO SELAYAN'),('1375030','1375','AUR BIRUGO TIGO BALEH'),('1376010','1376','PAYAKUMBUH BARAT'),('1376011','1376','PAYAKUMBUH SELATAN'),('1376020','1376','PAYAKUMBUH TIMUR'),('1376030','1376','PAYAKUMBUH UTARA'),('1376031','1376','LAMPOSI TIGO NAGORI'),('1377010','1377','PARIAMAN SELATAN'),('1377020','1377','PARIAMAN TENGAH'),('1377021','1377','PARIAMAN TIMUR'),('1377030','1377','PARIAMAN UTARA'),('1401010','1401','KUANTAN MUDIK'),('1401011','1401','HULU KUANTAN'),('1401012','1401','GUNUNG TOAR'),('1401013','1401','PUCUK RANTAU'),('1401020','1401','SINGINGI'),('1401021','1401','SINGINGI HILIR'),('1401030','1401','KUANTAN TENGAH'),('1401031','1401','SENTAJO RAYA'),('1401040','1401','BENAI'),('1401050','1401','KUANTAN HILIR'),('1401051','1401','PANGEAN'),('1401052','1401','LOGAS TANAH DARAT'),('1401053','1401','KUANTAN HILIR SEBERANG'),('1401060','1401','CERENTI'),('1401061','1401','INUMAN'),('1402010','1402','PERANAP'),('1402011','1402','BATANG PERANAP'),('1402020','1402','SEBERIDA'),('1402021','1402','BATANG CENAKU'),('1402022','1402','BATANG GANSAL'),('1402030','1402','KELAYANG'),('1402031','1402','RAKIT KULIM'),('1402040','1402','PASIR PENYU'),('1402041','1402','LIRIK'),('1402042','1402','SUNGAI LALA'),('1402043','1402','LUBUK BATU JAYA'),('1402050','1402','RENGAT BARAT'),('1402060','1402','RENGAT'),('1402061','1402','KUALA CENAKU'),('1403010','1403','KERITANG'),('1403011','1403','KEMUNING'),('1403020','1403','RETEH'),('1403021','1403','SUNGAI BATANG'),('1403030','1403','ENOK'),('1403040','1403','TANAH MERAH'),('1403050','1403','KUALA INDRAGIRI'),('1403051','1403','CONCONG'),('1403060','1403','TEMBILAHAN'),('1403061','1403','TEMBILAHAN HULU'),('1403070','1403','TEMPULING'),('1403071','1403','KEMPAS'),('1403080','1403','BATANG TUAKA'),('1403090','1403','GAUNG ANAK SERKA'),('1403100','1403','GAUNG'),('1403110','1403','MANDAH'),('1403120','1403','KATEMAN'),('1403121','1403','PELANGIRAN'),('1403122','1403','TELUK BELENGKONG'),('1403123','1403','PULAU BURUNG'),('1404010','1404','LANGGAM'),('1404011','1404','PANGKALAN KERINCI'),('1404012','1404','BANDAR SEIKIJANG'),('1404020','1404','PANGKALAN KURAS'),('1404021','1404','UKUI'),('1404022','1404','PANGKALAN LESUNG'),('1404030','1404','BUNUT'),('1404031','1404','PELALAWAN'),('1404032','1404','BANDAR PETALANGAN'),('1404040','1404','KUALA KAMPAR'),('1404041','1404','KERUMUTAN'),('1404042','1404','TELUK MERANTI'),('1405010','1405','MINAS'),('1405011','1405','SUNGAI MANDAU'),('1405012','1405','KANDIS'),('1405020','1405','SIAK'),('1405021','1405','KERINCI KANAN'),('1405022','1405','TUALANG'),('1405023','1405','DAYUN'),('1405024','1405','LUBUK DALAM'),('1405025','1405','KOTO GASIB'),('1405026','1405','MEMPURA'),('1405030','1405','SUNGAI APIT'),('1405031','1405','BUNGA RAYA'),('1405032','1405','SABAK AUH'),('1405033','1405','PUSAKO'),('1406010','1406','KAMPAR KIRI'),('1406011','1406','KAMPAR KIRI HULU'),('1406012','1406','KAMPAR KIRI HILIR'),('1406013','1406','GUNUNG SAHILAN'),('1406014','1406','KAMPAR KIRI TENGAH'),('1406020','1406','XIII KOTO KAMPAR'),('1406021','1406','KOTO KAMPAR HULU'),('1406030','1406','KUOK'),('1406031','1406','SALO'),('1406040','1406','TAPUNG'),('1406041','1406','TAPUNG HULU'),('1406042','1406','TAPUNG HILIR'),('1406050','1406','BANGKINANG KOTA'),('1406051','1406','BANGKINANG'),('1406060','1406','KAMPAR'),('1406061','1406','KAMPA'),('1406062','1406','RUMBIO JAYA'),('1406063','1406','KAMPAR UTARA'),('1406070','1406','TAMBANG'),('1406080','1406','SIAK HULU'),('1406081','1406','PERHENTIAN RAJA'),('1407010','1407','ROKAN IV KOTO'),('1407011','1407','PENDALIAN IV KOTO'),('1407020','1407','TANDUN'),('1407021','1407','KABUN'),('1407022','1407','UJUNG BATU'),('1407030','1407','RAMBAH SAMO'),('1407040','1407','RAMBAH'),('1407041','1407','RAMBAH HILIR'),('1407042','1407','BANGUN PURBA'),('1407050','1407','TAMBUSAI'),('1407051','1407','TAMBUSAI UTARA'),('1407060','1407','KEPENUHAN'),('1407061','1407','KEPENUHAN HULU'),('1407070','1407','KUNTO DARUSSALAM'),('1407071','1407','PAGARAN TAPAH DARUSSALAM'),('1407072','1407','BONAI DARUSSALAM'),('1408010','1408','MANDAU'),('1408011','1408','PINGGIR'),('1408012','1408','BATHIN SOLAPAN'),('1408013','1408','TALANG MUANDAU'),('1408020','1408','BUKIT BATU'),('1408021','1408','SIAK KECIL'),('1408022','1408','BANDAR LAKSAMANA'),('1408030','1408','RUPAT'),('1408031','1408','RUPAT UTARA'),('1408040','1408','BENGKALIS'),('1408050','1408','BANTAN'),('1409010','1409','TANAH PUTIH'),('1409011','1409','PUJUD'),('1409012','1409','TANAH PUTIH TANJUNG MELAWAN'),('1409013','1409','RANTAU KOPAR'),('1409014','1409','TANJUNG MEDAN'),('1409020','1409','BAGAN SINEMBAH'),('1409021','1409','SIMPANG KANAN'),('1409022','1409','BAGAN SINEMBAH RAYA'),('1409023','1409','BALAI JAYA'),('1409030','1409','KUBU'),('1409031','1409','PASIR LIMAU KAPAS'),('1409032','1409','KUBU BABUSSALAM'),('1409040','1409','BANGKO'),('1409041','1409','SINABOI'),('1409042','1409','BATU HAMPAR'),('1409043','1409','PEKAITAN'),('1409050','1409','RIMBA MELINTANG'),('1409051','1409','BANGKO PUSAKO'),('1410010','1410','TEBING TINGGI BARAT'),('1410020','1410','TEBING TINGGI'),('1410021','1410','TEBING TINGGI TIMUR'),('1410030','1410','RANGSANG'),('1410031','1410','RANGSANG PESISIR'),('1410040','1410','RANGSANG BARAT'),('1410050','1410','MERBAU'),('1410051','1410','PULAU MERBAU'),('1410052','1410','TASIK PUTRI PUYU'),('1471010','1471','TAMPAN'),('1471011','1471','PAYUNG SEKAKI'),('1471020','1471','BUKIT RAYA'),('1471021','1471','MARPOYAN DAMAI'),('1471022','1471','TENAYAN RAYA'),('1471030','1471','LIMAPULUH'),('1471040','1471','SAIL'),('1471050','1471','PEKANBARU KOTA'),('1471060','1471','SUKAJADI'),('1471070','1471','SENAPELAN'),('1471080','1471','RUMBAI'),('1471081','1471','RUMBAI PESISIR'),('1473010','1473','BUKIT KAPUR'),('1473011','1473','MEDANG KAMPAI'),('1473012','1473','SUNGAI SEMBILAN'),('1473020','1473','DUMAI BARAT'),('1473021','1473','DUMAI SELATAN'),('1473030','1473','DUMAI TIMUR'),('1473031','1473','DUMAI KOTA'),('1501010','1501','GUNUNG RAYA'),('1501011','1501','BUKIT KERMAN'),('1501020','1501','BATANG MERANGIN'),('1501030','1501','KELILING DANAU'),('1501040','1501','DANAU KERINCI'),('1501050','1501','SITINJAU LAUT'),('1501070','1501','AIR HANGAT'),('1501071','1501','AIR HANGAT TIMUR'),('1501072','1501','DEPATI VII'),('1501073','1501','AIR HANGAT BARAT'),('1501080','1501','GUNUNG KERINCI'),('1501081','1501','SIULAK'),('1501082','1501','SIULAK MUKAI'),('1501090','1501','KAYU ARO'),('1501091','1501','GUNUNG TUJUH'),('1501092','1501','KAYU ARO BARAT'),('1502010','1502','JANGKAT'),('1502011','1502','SUNGAI TENANG'),('1502020','1502','MUARA SIAU'),('1502021','1502','LEMBAH MASURAI'),('1502022','1502','TIANG PUMPUNG'),('1502030','1502','PAMENANG'),('1502031','1502','PAMENANG BARAT'),('1502032','1502','RENAH PAMENANG'),('1502033','1502','PAMENANG SELATAN'),('1502040','1502','BANGKO'),('1502041','1502','BANGKO BARAT'),('1502042','1502','NALO TANTAN'),('1502043','1502','BATANG MASUMAI'),('1502050','1502','SUNGAI MANAU'),('1502051','1502','RENAH PEMBARAP'),('1502052','1502','PANGKALAN JAMBU'),('1502060','1502','TABIR'),('1502061','1502','TABIR ULU'),('1502062','1502','TABIR SELATAN'),('1502063','1502','TABIR ILIR'),('1502064','1502','TABIR TIMUR'),('1502065','1502','TABIR LINTAS'),('1502066','1502','MARGO TABIR'),('1502067','1502','TABIR BARAT'),('1503010','1503','BATANG ASAI'),('1503020','1503','LIMUN'),('1503021','1503','CERMIN NAN GEDANG'),('1503030','1503','PELAWAN'),('1503031','1503','SINGKUT'),('1503040','1503','SAROLANGUN'),('1503041','1503','BATHIN VIII'),('1503050','1503','PAUH'),('1503051','1503','AIR HITAM'),('1503060','1503','MANDIANGIN'),('1504010','1504','MERSAM'),('1504011','1504','MARO SEBO ULU'),('1504020','1504','BATIN XXIV'),('1504030','1504','MUARA TEMBESI'),('1504040','1504','MUARA BULIAN'),('1504041','1504','BAJUBANG'),('1504042','1504','MARO SEBO ILIR'),('1504050','1504','PEMAYUNG'),('1505010','1505','MESTONG'),('1505011','1505','SUNGAI BAHAR'),('1505012','1505','BAHAR SELATAN'),('1505013','1505','BAHAR UTARA'),('1505020','1505','KUMPEH ULU'),('1505021','1505','SUNGAI GELAM'),('1505030','1505','KUMPEH'),('1505040','1505','MARO SEBO'),('1505041','1505','TAMAN RAJO'),('1505050','1505','JAMBI LUAR KOTA'),('1505060','1505','SEKERNAN'),('1506010','1506','MENDAHARA'),('1506011','1506','MENDAHARA ULU'),('1506012','1506','GERAGAI'),('1506020','1506','DENDANG'),('1506031','1506','MUARA SABAK BARAT'),('1506032','1506','MUARA SABAK TIMUR'),('1506033','1506','KUALA JAMBI'),('1506040','1506','RANTAU RASAU'),('1506041','1506','BERBAK'),('1506050','1506','NIPAH PANJANG'),('1506060','1506','SADU'),('1507010','1507','TUNGKAL ULU'),('1507011','1507','MERLUNG'),('1507012','1507','BATANG ASAM'),('1507013','1507','TEBING TINGGI'),('1507014','1507','RENAH MENDALUH'),('1507015','1507','MUARA PAPALIK'),('1507020','1507','PENGABUAN'),('1507021','1507','SENYERANG'),('1507030','1507','TUNGKAL ILIR'),('1507031','1507','BRAM ITAM'),('1507032','1507','SEBERANG KOTA'),('1507040','1507','BETARA'),('1507041','1507','KUALA BETARA'),('1508010','1508','TEBO ILIR'),('1508011','1508','MUARA TABIR'),('1508020','1508','TEBO TENGAH'),('1508021','1508','SUMAY'),('1508022','1508','TENGAH ILIR'),('1508030','1508','RIMBO BUJANG'),('1508031','1508','RIMBO ULU'),('1508032','1508','RIMBO ILIR'),('1508040','1508','TEBO ULU'),('1508041','1508','VII KOTO'),('1508042','1508','SERAI SERUMPUN'),('1508043','1508','VII KOTO ILIR'),('1509010','1509','PELEPAT'),('1509011','1509','PELEPAT ILIR'),('1509021','1509','BATHIN II BABEKO'),('1509022','1509','RIMBO TENGAH'),('1509023','1509','BUNGO DANI'),('1509024','1509','PASAR MUARA BUNGO'),('1509025','1509','BATHIN III'),('1509030','1509','RANTAU PANDAN'),('1509031','1509','MUKO-MUKO BATHIN VII'),('1509032','1509','BATHIN III ULU'),('1509040','1509','TANAH SEPENGGAL'),('1509041','1509','TANAH SEPENGGAL LINTAS'),('1509050','1509','TANAH TUMBUH'),('1509051','1509','LIMBUR LUBUK MENGKUANG'),('1509052','1509','BATHIN II PELAYANG'),('1509060','1509','JUJUHAN'),('1509061','1509','JUJUHAN ILIR'),('1571010','1571','KOTA BARU'),('1571011','1571','ALAM BARAJO'),('1571020','1571','JAMBI SELATAN'),('1571021','1571','PAAL MERAH'),('1571030','1571','JELUTUNG'),('1571040','1571','PASAR JAMBI'),('1571050','1571','TELANAIPURA'),('1571051','1571','DANAU SIPIN'),('1571060','1571','DANAU TELUK'),('1571070','1571','PELAYANGAN'),('1571080','1571','JAMBI TIMUR'),('1572010','1572','TANAH KAMPUNG'),('1572020','1572','KUMUN DEBAI'),('1572030','1572','SUNGAI PENUH'),('1572031','1572','PONDOK TINGGI'),('1572032','1572','SUNGAI BUNGKAL'),('1572040','1572','HAMPARAN RAWANG'),('1572050','1572','PESISIR BUKIT'),('1572051','1572','KOTO BARU'),('1601052','1601','LENGKITI'),('1601070','1601','SOSOH BUAY RAYAP'),('1601080','1601','PENGANDONAN'),('1601081','1601','SEMIDANG AJI'),('1601082','1601','ULU OGAN'),('1601083','1601','MUARA JAYA'),('1601090','1601','PENINJAUAN'),('1601091','1601','LUBUK BATANG'),('1601092','1601','SINAR PENINJAUAN'),('1601093','1601','KEDATON PENINJAUAN RAYA'),('1601130','1601','BATU RAJA TIMUR'),('1601131','1601','LUBUK RAJA'),('1601140','1601','BATU RAJA BARAT'),('1602010','1602','LEMPUING'),('1602011','1602','LEMPUING JAYA'),('1602020','1602','MESUJI'),('1602021','1602','SUNGAI MENANG'),('1602022','1602','MESUJI MAKMUR'),('1602023','1602','MESUJI RAYA'),('1602030','1602','TULUNG SELAPAN'),('1602031','1602','CENGAL'),('1602040','1602','PEDAMARAN'),('1602041','1602','PEDAMARAN TIMUR'),('1602050','1602','TANJUNG LUBUK'),('1602051','1602','TELUK GELAM'),('1602060','1602','KOTA KAYU AGUNG'),('1602120','1602','SIRAH PULAU PADANG'),('1602121','1602','JEJAWI'),('1602130','1602','PAMPANGAN'),('1602131','1602','PANGKALAN LAPAM'),('1602140','1602','AIR SUGIHAN'),('1603010','1603','SEMENDO DARAT LAUT'),('1603011','1603','SEMENDO DARAT ULU'),('1603012','1603','SEMENDO DARAT TENGAH'),('1603020','1603','TANJUNG AGUNG'),('1603031','1603','RAMBANG'),('1603032','1603','LUBAI'),('1603033','1603','LUBAI ULU'),('1603040','1603','LAWANG KIDUL'),('1603050','1603','MUARA ENIM'),('1603051','1603','UJAN MAS'),('1603060','1603','GUNUNG MEGANG'),('1603061','1603','BENAKAT'),('1603062','1603','BELIMBING'),('1603070','1603','RAMBANG DANGKU'),('1603090','1603','GELUMBANG'),('1603091','1603','LEMBAK'),('1603092','1603','SUNGAI ROTAN'),('1603093','1603','MUARA BELIDA'),('1603094','1603','KELEKAR'),('1603095','1603','BELIDA DARAT'),('1604011','1604','TANJUNG SAKTI PUMI'),('1604012','1604','TANJUNG SAKTI PUMU'),('1604040','1604','KOTA AGUNG'),('1604041','1604','MULAK ULU'),('1604042','1604','TANJUNG TEBAT'),('1604043','1604','MULAK SEBINGKAI'),('1604050','1604','PULAU PINANG'),('1604051','1604','PAGAR GUNUNG'),('1604052','1604','GUMAY ULU'),('1604060','1604','JARAI'),('1604061','1604','PAJAR BULAN'),('1604062','1604','MUARA PAYANG'),('1604063','1604','SUKAMERINDU'),('1604111','1604','KIKIM BARAT'),('1604112','1604','KIKIM TIMUR'),('1604113','1604','KIKIM SELATAN'),('1604114','1604','KIKIM TENGAH'),('1604120','1604','LAHAT'),('1604121','1604','GUMAY TALANG'),('1604122','1604','PSEKSU'),('1604123','1604','LAHAT SELATAN'),('1604131','1604','MERAPI BARAT'),('1604132','1604','MERAPI TIMUR'),('1604133','1604','MERAPI SELATAN'),('1605030','1605','SUKU TENGAH LAKITAN ULU'),('1605031','1605','SELANGIT'),('1605032','1605','SUMBER HARTA'),('1605040','1605','TUGUMULYO'),('1605041','1605','PURWODADI'),('1605050','1605','MUARA BELITI'),('1605051','1605','TIANG PUMPUNG KEPUNGUT'),('1605060','1605','JAYALOKA'),('1605061','1605','SUKA KARYA'),('1605070','1605','MUARA KELINGI'),('1605071','1605','BULANG TENGAH SUKU ULU'),('1605072','1605','TUAH NEGERI'),('1605080','1605','MUARA LAKITAN'),('1605090','1605','MEGANG SAKTI'),('1606010','1606','SANGA DESA'),('1606020','1606','BABAT TOMAN'),('1606021','1606','BATANGHARI LEKO'),('1606022','1606','PLAKAT TINGGI'),('1606023','1606','LAWANG WETAN'),('1606030','1606','SUNGAI KERUH'),('1606040','1606','SEKAYU'),('1606041','1606','LAIS'),('1606090','1606','SUNGAI LILIN'),('1606091','1606','KELUANG'),('1606092','1606','BABAT SUPAT'),('1606100','1606','BAYUNG LENCIR'),('1606101','1606','LALAN'),('1606102','1606','TUNGKAL JAYA'),('1607010','1607','RANTAU BAYUR'),('1607020','1607','BETUNG'),('1607021','1607','SUAK TAPEH'),('1607030','1607','PULAU RIMAU'),('1607031','1607','TUNGKAL ILIR'),('1607040','1607','BANYUASIN III'),('1607041','1607','SEMBAWA'),('1607050','1607','TALANG KELAPA'),('1607051','1607','TANJUNG LAGO'),('1607060','1607','BANYUASIN I'),('1607061','1607','AIR KUMBANG'),('1607070','1607','RAMBUTAN'),('1607080','1607','MUARA PADANG'),('1607081','1607','MUARA SUGIHAN'),('1607090','1607','MAKARTI JAYA'),('1607091','1607','AIR SALEH'),('1607100','1607','BANYUASIN II'),('1607110','1607','MUARA TELANG'),('1607111','1607','SUMBER MARGA TELANG'),('1608010','1608','MEKAKAU ILIR'),('1608020','1608','BANDING AGUNG'),('1608021','1608','WARKUK RANAU SELATAN'),('1608022','1608','BUAY PEMATANG RIBU RANAU TENGAH'),('1608030','1608','BUAY PEMACA'),('1608040','1608','SIMPANG'),('1608041','1608','BUANA PEMACA'),('1608050','1608','MUARADUA'),('1608051','1608','BUAY RAWAN'),('1608060','1608','BUAY SANDANG AJI'),('1608061','1608','TIGA DIHAJI'),('1608070','1608','BUAY RUNJUNG'),('1608071','1608','RUNJUNG AGUNG'),('1608080','1608','KISAM TINGGI'),('1608090','1608','MUARADUA KISAM'),('1608091','1608','KISAM ILIR'),('1608100','1608','PULAU BERINGIN'),('1608101','1608','SINDANG DANAU'),('1608102','1608','SUNGAI ARE'),('1609010','1609','MARTAPURA'),('1609011','1609','BUNGA MAYANG'),('1609012','1609','JAYA PURA'),('1609020','1609','BUAY PEMUKA PELIUNG'),('1609030','1609','BUAY MADANG'),('1609031','1609','BUAY MADANG TIMUR'),('1609032','1609','BUAY PEMUKA BANGSA RAJA'),('1609040','1609','MADANG SUKU II'),('1609041','1609','MADANG SUKU III'),('1609050','1609','MADANG SUKU I'),('1609051','1609','BELITANG MADANG RAYA'),('1609060','1609','BELITANG'),('1609061','1609','BELITANG JAYA'),('1609070','1609','BELITANG III'),('1609080','1609','BELITANG II'),('1609081','1609','BELITANG MULYA'),('1609090','1609','SEMENDAWAI SUKU III'),('1609091','1609','SEMENDAWAI TIMUR'),('1609100','1609','CEMPAKA'),('1609101','1609','SEMENDAWAI BARAT'),('1610010','1610','MUARA KUANG'),('1610011','1610','RAMBANG KUANG'),('1610012','1610','LUBUK KELIAT'),('1610020','1610','TANJUNG BATU'),('1610021','1610','PAYARAMAN'),('1610030','1610','RANTAU ALAI'),('1610031','1610','KANDIS'),('1610040','1610','TANJUNG RAJA'),('1610041','1610','RANTAU PANJANG'),('1610042','1610','SUNGAI PINANG'),('1610050','1610','PEMULUTAN'),('1610051','1610','PEMULUTAN SELATAN'),('1610052','1610','PEMULUTAN BARAT'),('1610060','1610','INDRALAYA'),('1610061','1610','INDRALAYA UTARA'),('1610062','1610','INDRALAYA SELATAN'),('1611010','1611','MUARA PINANG'),('1611020','1611','LINTANG KANAN'),('1611030','1611','PENDOPO'),('1611031','1611','PENDOPO BARAT'),('1611040','1611','PASEMAH AIR KERUH'),('1611050','1611','ULU MUSI'),('1611051','1611','SIKAP DALAM'),('1611060','1611','TALANG PADANG'),('1611070','1611','TEBING TINGGI'),('1611071','1611','SALING'),('1612010','1612','TALANG UBI'),('1612020','1612','TANAH ABANG'),('1612030','1612','ABAB'),('1612040','1612','PENUKAL'),('1612050','1612','PENUKAL UTARA'),('1613010','1613','ULU RAWAS'),('1613020','1613','KARANG JAYA'),('1613030','1613','RAWAS ULU'),('1613040','1613','RUPIT'),('1613050','1613','KARANG DAPO'),('1613060','1613','RAWAS ILIR'),('1613070','1613','NIBUNG'),('1671010','1671','ILIR BARAT II'),('1671011','1671','GANDUS'),('1671020','1671','SEBERANG ULU I'),('1671021','1671','KERTAPATI'),('1671022','1671','JAKABARING'),('1671030','1671','SEBERANG ULU II'),('1671031','1671','PLAJU'),('1671040','1671','ILIR BARAT I'),('1671041','1671','BUKIT KECIL'),('1671050','1671','ILIR TIMUR I'),('1671051','1671','KEMUNING'),('1671060','1671','ILIR TIMUR II'),('1671061','1671','KALIDONI'),('1671062','1671','ILIR TIMUR III'),('1671070','1671','SAKO'),('1671071','1671','SEMATANG BORANG'),('1671080','1671','SUKARAMI'),('1671081','1671','ALANG ALANG LEBAR'),('1672010','1672','RAMBANG KAPAK TENGAH'),('1672020','1672','PRABUMULIH TIMUR'),('1672021','1672','PRABUMULIH SELATAN'),('1672030','1672','PRABUMULIH BARAT'),('1672031','1672','PRABUMULIH UTARA'),('1672040','1672','CAMBAI'),('1673010','1673','DEMPO SELATAN'),('1673011','1673','DEMPO TENGAH'),('1673020','1673','DEMPO UTARA'),('1673030','1673','PAGAR ALAM SELATAN'),('1673040','1673','PAGAR ALAM UTARA'),('1674011','1674','LUBUK LINGGAU BARAT I'),('1674012','1674','LUBUK LINGGAU BARAT II'),('1674021','1674','LUBUK LINGGAU SELATAN I'),('1674022','1674','LUBUK LINGGAU SELATAN II'),('1674031','1674','LUBUK LINGGAU TIMUR I'),('1674032','1674','LUBUK LINGGAU TIMUR II'),('1674041','1674','LUBUK LINGGAU UTARA I'),('1674042','1674','LUBUK LINGGAU UTARA II'),('1701040','1701','MANNA'),('1701041','1701','KOTA MANNA'),('1701042','1701','KEDURANG'),('1701043','1701','BUNGA MAS'),('1701044','1701','PASAR MANNA'),('1701045','1701','KEDURANG ILIR'),('1701050','1701','SEGINIM'),('1701051','1701','AIR NIPIS'),('1701060','1701','PINO'),('1701061','1701','PINORAYA'),('1701062','1701','ULU MANNA'),('1702020','1702','KOTA PADANG'),('1702021','1702','SINDANG BELITI ILIR'),('1702030','1702','PADANG ULAK TANDING'),('1702031','1702','SINDANG KELINGI'),('1702032','1702','BINDU RIANG'),('1702033','1702','SINDANG BELITI ULU'),('1702034','1702','SINDANG DATARAN'),('1702040','1702','CURUP'),('1702041','1702','BERMANI ULU'),('1702042','1702','SELUPU REJANG'),('1702043','1702','CURUP SELATAN'),('1702044','1702','CURUP TENGAH'),('1702045','1702','BERMANI ULU RAYA'),('1702046','1702','CURUP UTARA'),('1702047','1702','CURUP TIMUR'),('1703010','1703','ENGGANO'),('1703050','1703','KERKAP'),('1703051','1703','AIR NAPAL'),('1703052','1703','AIR BESI'),('1703053','1703','HULU PALIK'),('1703054','1703','TANJUNG AGUNG PALIK'),('1703060','1703','ARGA MAKMUR'),('1703061','1703','ARMA JAYA'),('1703070','1703','LAIS'),('1703071','1703','BATIK NAU'),('1703072','1703','GIRI MULYA'),('1703073','1703','AIR PADANG'),('1703080','1703','PADANG JAYA'),('1703090','1703','KETAHUN'),('1703091','1703','NAPAL PUTIH'),('1703092','1703','ULOK KUPAI'),('1703093','1703','PINANG RAYA'),('1703100','1703','PUTRI HIJAU'),('1703101','1703','MARGA SAKTI SEBELAT'),('1704010','1704','NASAL'),('1704020','1704','MAJE'),('1704030','1704','KAUR SELATAN'),('1704031','1704','TETAP'),('1704040','1704','KAUR TENGAH'),('1704041','1704','LUAS'),('1704042','1704','MUARA SAHUNG'),('1704050','1704','KINAL'),('1704051','1704','SEMIDANG GUMAY'),('1704060','1704','TANJUNG KEMUNING'),('1704061','1704','KELAM TENGAH'),('1704070','1704','KAUR UTARA'),('1704071','1704','PADANG GUCI HILIR'),('1704072','1704','LUNGKANG KULE'),('1704073','1704','PADANG GUCI HULU'),('1705010','1705','SEMIDANG ALAS MARAS'),('1705020','1705','SEMIDANG ALAS'),('1705030','1705','TALO'),('1705031','1705','ILIR TALO'),('1705032','1705','TALO KECIL'),('1705033','1705','ULU TALO'),('1705040','1705','SELUMA'),('1705041','1705','SELUMA SELATAN'),('1705042','1705','SELUMA BARAT'),('1705043','1705','SELUMA TIMUR'),('1705044','1705','SELUMA UTARA'),('1705050','1705','SUKARAJA'),('1705051','1705','AIR PERIUKAN'),('1705052','1705','LUBUK SANDI'),('1706010','1706','IPUH'),('1706011','1706','AIR RAMI'),('1706012','1706','MALIN DEMAN'),('1706020','1706','PONDOK SUGUH'),('1706021','1706','SUNGAI RUMBAI'),('1706022','1706','TERAMANG JAYA'),('1706030','1706','TERAS TERUNJAM'),('1706031','1706','PENARIK'),('1706032','1706','SELAGAN RAYA'),('1706040','1706','KOTA MUKOMUKO'),('1706041','1706','AIR DIKIT'),('1706042','1706','XIV KOTO'),('1706050','1706','LUBUK PINANG'),('1706051','1706','AIR MANJUNTO'),('1706052','1706','V KOTO'),('1707010','1707','RIMBO PENGADANG'),('1707011','1707','TOPOS'),('1707020','1707','LEBONG SELATAN'),('1707021','1707','BINGIN KUNING'),('1707030','1707','LEBONG TENGAH'),('1707031','1707','LEBONG SAKTI'),('1707040','1707','LEBONG ATAS'),('1707042','1707','PELABAI'),('1707050','1707','LEBONG UTARA'),('1707051','1707','AMEN'),('1707052','1707','URAM JAYA'),('1707053','1707','PINANG BELAPIS'),('1708010','1708','MUARA KEMUMU'),('1708020','1708','BERMANI ILIR'),('1708030','1708','SEBERANG MUSI'),('1708040','1708','TEBAT KARAI'),('1708050','1708','KEPAHIANG'),('1708060','1708','KABA WETAN'),('1708070','1708','UJAN MAS'),('1708080','1708','MERIGI'),('1709010','1709','TALANG EMPAT'),('1709020','1709','KARANG TINGGI'),('1709030','1709','TABA PENANJUNG'),('1709031','1709','MERIGI KELINDANG'),('1709040','1709','PAGAR JATI'),('1709041','1709','MERIGI SAKTI'),('1709050','1709','PONDOK KELAPA'),('1709051','1709','PONDOK KUBANG'),('1709060','1709','PEMATANG TIGA'),('1709061','1709','BANG HAJI'),('1771010','1771','SELEBAR'),('1771011','1771','KAMPUNG MELAYU'),('1771020','1771','GADING CEMPAKA'),('1771021','1771','RATU AGUNG'),('1771022','1771','RATU SAMBAN'),('1771023','1771','SINGARAN PATI'),('1771030','1771','TELUK SEGARA'),('1771031','1771','SUNGAI SERUT'),('1771040','1771','MUARA BANGKA HULU'),('1801040','1801','BALIK BUKIT'),('1801041','1801','SUKAU'),('1801042','1801','LUMBOK SEMINUNG'),('1801050','1801','BELALAU'),('1801051','1801','SEKINCAU'),('1801052','1801','SUOH'),('1801053','1801','BATU BRAK'),('1801054','1801','PAGAR DEWA'),('1801055','1801','BATU KETULIS'),('1801056','1801','BANDAR NEGERI SUOH'),('1801060','1801','SUMBER JAYA'),('1801061','1801','WAY TENONG'),('1801062','1801','GEDUNG SURIAN'),('1801063','1801','KEBUN TEBU'),('1801064','1801','AIR HITAM'),('1802010','1802','WONOSOBO'),('1802011','1802','SEMAKA'),('1802012','1802','BANDAR NEGERI SEMUONG'),('1802020','1802','KOTA AGUNG'),('1802021','1802','PEMATANG SAWA'),('1802022','1802','KOTA AGUNG TIMUR'),('1802023','1802','KOTA AGUNG BARAT'),('1802030','1802','PULAU PANGGUNG'),('1802031','1802','ULUBELU'),('1802032','1802','AIR NANINGAN'),('1802040','1802','TALANG PADANG'),('1802041','1802','SUMBEREJO'),('1802042','1802','GISTING'),('1802043','1802','GUNUNG ALIP'),('1802050','1802','PUGUNG'),('1802101','1802','BULOK'),('1802110','1802','CUKUH BALAK'),('1802111','1802','KELUMBAYAN'),('1802112','1802','LIMAU'),('1802113','1802','KELUMBAYAN BARAT'),('1803060','1803','NATAR'),('1803070','1803','JATI AGUNG'),('1803080','1803','TANJUNG BINTANG'),('1803081','1803','TANJUNG SARI'),('1803090','1803','KATIBUNG'),('1803091','1803','MERBAU MATARAM'),('1803092','1803','WAY SULAN'),('1803100','1803','SIDOMULYO'),('1803101','1803','CANDIPURO'),('1803102','1803','WAY PANJI'),('1803110','1803','KALIANDA'),('1803111','1803','RAJABASA'),('1803120','1803','PALAS'),('1803121','1803','SRAGI'),('1803130','1803','PENENGAHAN'),('1803131','1803','KETAPANG'),('1803132','1803','BAKAUHENI'),('1804010','1804','METRO KIBANG'),('1804020','1804','BATANGHARI'),('1804030','1804','SEKAMPUNG'),('1804040','1804','MARGATIGA'),('1804050','1804','SEKAMPUNG UDIK'),('1804060','1804','JABUNG'),('1804061','1804','PASIR SAKTI'),('1804062','1804','WAWAY KARYA'),('1804063','1804','MARGA SEKAMPUNG'),('1804070','1804','LABUHAN MARINGGAI'),('1804071','1804','MATARAM BARU'),('1804072','1804','BANDAR SRIBAWONO'),('1804073','1804','MELINTING'),('1804074','1804','GUNUNG PELINDUNG'),('1804080','1804','WAY JEPARA'),('1804081','1804','BRAJA SLEBAH'),('1804082','1804','LABUHAN RATU'),('1804090','1804','SUKADANA'),('1804091','1804','BUMI AGUNG'),('1804092','1804','BATANGHARI NUBAN'),('1804100','1804','PEKALONGAN'),('1804110','1804','RAMAN UTARA'),('1804120','1804','PURBOLINGGO'),('1804121','1804','WAY BUNGUR'),('1805010','1805','PADANG RATU'),('1805011','1805','SELAGAI LINGGA'),('1805012','1805','PUBIAN'),('1805013','1805','ANAK TUHA'),('1805014','1805','ANAK RATU AJI'),('1805020','1805','KALIREJO'),('1805021','1805','SENDANG AGUNG'),('1805030','1805','BANGUNREJO'),('1805040','1805','GUNUNG SUGIH'),('1805041','1805','BEKRI'),('1805042','1805','BUMI RATU NUBAN'),('1805050','1805','TRIMURJO'),('1805060','1805','PUNGGUR'),('1805061','1805','KOTA GAJAH'),('1805070','1805','SEPUTIH RAMAN'),('1805080','1805','TERBANGGI BESAR'),('1805081','1805','SEPUTIH AGUNG'),('1805082','1805','WAY PENGUBUAN'),('1805090','1805','TERUSAN NUNYAI'),('1805100','1805','SEPUTIH MATARAM'),('1805101','1805','BANDAR MATARAM'),('1805110','1805','SEPUTIH BANYAK'),('1805111','1805','WAY SEPUTIH'),('1805120','1805','RUMBIA'),('1805121','1805','BUMI NABUNG'),('1805122','1805','PUTRA RUMBIA'),('1805130','1805','SEPUTIH SURABAYA'),('1805131','1805','BANDAR SURABAYA'),('1806010','1806','BUKIT KEMUNING'),('1806011','1806','ABUNG TINGGI'),('1806020','1806','TANJUNG RAJA'),('1806030','1806','ABUNG BARAT'),('1806031','1806','ABUNG TENGAH'),('1806032','1806','ABUNG  KUNANG'),('1806033','1806','ABUNG PEKURUN'),('1806040','1806','KOTABUMI'),('1806041','1806','KOTABUMI UTARA'),('1806042','1806','KOTABUMI SELATAN'),('1806050','1806','ABUNG SELATAN'),('1806051','1806','ABUNG SEMULI'),('1806052','1806','BLAMBANGAN PAGAR'),('1806060','1806','ABUNG TIMUR'),('1806061','1806','ABUNG SURAKARTA'),('1806070','1806','SUNGKAI SELATAN'),('1806071','1806','MUARA SUNGKAI'),('1806072','1806','BUNGA MAYANG'),('1806073','1806','SUNGKAI  BARAT'),('1806074','1806','SUNGKAI JAYA'),('1806080','1806','SUNGKAI UTARA'),('1806081','1806','HULUSUNGKAI'),('1806082','1806','SUNGKAI TENGAH'),('1807010','1807','BANJIT'),('1807020','1807','BARADATU'),('1807021','1807','GUNUNG LABUHAN'),('1807030','1807','KASUI'),('1807031','1807','REBANG TANGKAS'),('1807040','1807','BLAMBANGAN UMPU'),('1807041','1807','WAY TUBA'),('1807042','1807','NEGERI AGUNG'),('1807050','1807','BAHUGA'),('1807051','1807','BUAY  BAHUGA'),('1807052','1807','BUMI AGUNG'),('1807060','1807','PAKUAN RATU'),('1807061','1807','NEGARA BATIN'),('1807062','1807','NEGERI BESAR'),('1808030','1808','BANJAR AGUNG'),('1808031','1808','BANJAR MARGO'),('1808032','1808','BANJAR BARU'),('1808040','1808','GEDUNG AJI'),('1808041','1808','PENAWAR AJI'),('1808042','1808','MERAKSA AJI'),('1808050','1808','MENGGALA'),('1808051','1808','PENAWAR TAMA'),('1808052','1808','RAWAJITU SELATAN'),('1808053','1808','GEDUNG MENENG'),('1808054','1808','RAWAJITU TIMUR'),('1808055','1808','RAWA PITU'),('1808056','1808','GEDUNG AJI BARU'),('1808057','1808','DENTE TELADAS'),('1808058','1808','MENGGALA TIMUR'),('1809010','1809','PUNDUH PIDADA'),('1809011','1809','MARGA PUNDUH'),('1809020','1809','PADANG CERMIN'),('1809021','1809','TELUK PANDAN'),('1809022','1809','WAY RATAI'),('1809030','1809','KEDONDONG'),('1809031','1809','WAY KHILAU'),('1809040','1809','WAY LIMA'),('1809050','1809','GEDUNG TATAAN'),('1809060','1809','NEGERI KATON'),('1809070','1809','TEGINENENG'),('1810010','1810','PARDASUKA'),('1810020','1810','AMBARAWA'),('1810030','1810','PAGELARAN'),('1810031','1810','PAGELARAN UTARA'),('1810040','1810','PRINGSEWU'),('1810050','1810','GADING REJO'),('1810060','1810','SUKOHARJO'),('1810070','1810','BANYUMAS'),('1810080','1810','ADI LUWIH'),('1811010','1811','WAY SERDANG'),('1811020','1811','SIMPANG PEMATANG'),('1811030','1811','PANCA JAYA'),('1811040','1811','TANJUNG RAYA'),('1811050','1811','MESUJI'),('1811060','1811','MESUJI TIMUR'),('1811070','1811','RAWAJITU UTARA'),('1812010','1812','TULANG BAWANG UDIK'),('1812020','1812','TUMI JAJAR'),('1812030','1812','TULANG BAWANG TENGAH'),('1812040','1812','PAGAR DEWA'),('1812050','1812','LAMBU KIBANG'),('1812060','1812','GUNUNG TERANG'),('1812061','1812','BATU PUTIH'),('1812070','1812','GUNUNG AGUNG'),('1812080','1812','WAY KENANGA'),('1813010','1813','LEMONG'),('1813020','1813','PESISIR UTARA'),('1813030','1813','PULAU PISANG'),('1813040','1813','KARYA PENGGAWA'),('1813050','1813','WAY KRUI'),('1813060','1813','PESISIR TENGAH'),('1813070','1813','KRUI SELATAN'),('1813080','1813','PESISIR SELATAN'),('1813090','1813','NGAMBUR'),('1813100','1813','BENGKUNAT'),('1813110','1813','BENGKUNAT BELIMBING'),('1871010','1871','TELUK BETUNG BARAT'),('1871011','1871','TELUKBETUNG TIMUR'),('1871020','1871','TELUK BETUNG SELATAN'),('1871021','1871','BUMI WARAS'),('1871030','1871','PANJANG'),('1871040','1871','TANJUNG KARANG TIMUR'),('1871041','1871','KEDAMAIAN'),('1871050','1871','TELUK BETUNG UTARA'),('1871060','1871','TANJUNG KARANG PUSAT'),('1871061','1871','ENGGAL'),('1871070','1871','TANJUNG KARANG BARAT'),('1871071','1871','KEMILING'),('1871072','1871','LANGKAPURA'),('1871080','1871','KEDATON'),('1871081','1871','RAJABASA'),('1871082','1871','TANJUNG SENANG'),('1871083','1871','LABUHAN RATU'),('1871090','1871','SUKARAME'),('1871091','1871','SUKABUMI'),('1871092','1871','WAY HALIM'),('1872011','1872','METRO SELATAN'),('1872012','1872','METRO BARAT'),('1872021','1872','METRO TIMUR'),('1872022','1872','METRO PUSAT'),('1872023','1872','METRO UTARA'),('1901070','1901','MENDO BARAT'),('1901080','1901','MERAWANG'),('1901081','1901','PUDING BESAR'),('1901090','1901','SUNGAI LIAT'),('1901091','1901','PEMALI'),('1901092','1901','BAKAM'),('1901130','1901','BELINYU'),('1901131','1901','RIAU SILIP'),('1902010','1902','MEMBALONG'),('1902060','1902','TANJUNG PANDAN'),('1902061','1902','BADAU'),('1902062','1902','SIJUK'),('1902063','1902','SELAT NASIK'),('1903010','1903','KELAPA'),('1903020','1903','TEMPILANG'),('1903030','1903','MENTOK'),('1903040','1903','SIMPANG TERITIP'),('1903050','1903','JEBUS'),('1903051','1903','PARITTIGA'),('1904010','1904','KOBA'),('1904011','1904','LUBUK BESAR'),('1904020','1904','PANGKALAN BARU'),('1904021','1904','NAMANG'),('1904030','1904','SUNGAI SELAN'),('1904040','1904','SIMPANG KATIS'),('1905010','1905','PAYUNG'),('1905011','1905','PULAU BESAR'),('1905020','1905','SIMPANG RIMBA'),('1905030','1905','TOBOALI'),('1905031','1905','TUKAK SADAI'),('1905040','1905','AIR GEGAS'),('1905050','1905','LEPAR PONGOK'),('1905051','1905','KEPULAUAN PONGOK'),('1906010','1906','DENDANG'),('1906011','1906','SIMPANG PESAK'),('1906020','1906','GANTUNG'),('1906021','1906','SIMPANG RENGGIANG'),('1906030','1906','MANGGAR'),('1906031','1906','DAMAR'),('1906040','1906','KELAPA KAMPIT'),('1971010','1971','RANGKUI'),('1971020','1971','BUKIT INTAN'),('1971021','1971','GIRIMAYA'),('1971030','1971','PANGKAL BALAM'),('1971031','1971','GABEK'),('1971040','1971','TAMAN SARI'),('1971041','1971','GERUNGGANG'),('2101010','2101','MORO'),('2101011','2101','DURAI'),('2101020','2101','KUNDUR'),('2101021','2101','KUNDUR UTARA'),('2101022','2101','KUNDUR BARAT'),('2101023','2101','UNGAR'),('2101024','2101','BELAT'),('2101030','2101','KARIMUN'),('2101031','2101','BURU'),('2101032','2101','MERAL'),('2101033','2101','TEBING'),('2101034','2101','MERAL BARAT'),('2102040','2102','TELUK BINTAN'),('2102050','2102','BINTAN UTARA'),('2102051','2102','TELUK SEBONG'),('2102052','2102','SERI KUALA LOBAM'),('2102060','2102','BINTAN TIMUR'),('2102061','2102','GUNUNG KIJANG'),('2102062','2102','MANTANG'),('2102063','2102','BINTAN PESISIR'),('2102064','2102','TOAPAYA'),('2102070','2102','TAMBELAN'),('2103030','2103','MIDAI'),('2103031','2103','SUAK MIDAI'),('2103040','2103','BUNGURAN BARAT'),('2103041','2103','BUNGURAN UTARA'),('2103042','2103','PULAU LAUT'),('2103043','2103','PULAU TIGA'),('2103044','2103','BUNGURAN BATUBI'),('2103045','2103','PULAU TIGA BARAT'),('2103050','2103','BUNGURAN TIMUR'),('2103051','2103','BUNGURAN TIMUR LAUT'),('2103052','2103','BUNGURAN TENGAH'),('2103053','2103','BUNGURAN SELATAN'),('2103060','2103','SERASAN'),('2103061','2103','SUBI'),('2103062','2103','SERASAN TIMUR'),('2104010','2104','SINGKEP BARAT'),('2104011','2104','KEPULAUAN POSEK'),('2104020','2104','SINGKEP'),('2104021','2104','SINGKEP SELATAN'),('2104022','2104','SINGKEP PESISIR'),('2104030','2104','LINGGA'),('2104031','2104','SELAYAR'),('2104032','2104','LINGGA TIMUR'),('2104040','2104','LINGGA UTARA'),('2104050','2104','SENAYANG'),('2105010','2105','JEMAJA'),('2105020','2105','JEMAJA TIMUR'),('2105030','2105','SIANTAN SELATAN'),('2105040','2105','SIANTAN'),('2105050','2105','SIANTAN TIMUR'),('2105060','2105','SIANTAN TENGAH'),('2105070','2105','PALMATAK'),('2171010','2171','BELAKANG PADANG'),('2171020','2171','BULANG'),('2171030','2171','GALANG'),('2171040','2171','SEI BEDUK'),('2171041','2171','SAGULUNG'),('2171050','2171','NONGSA'),('2171051','2171','BATAM KOTA'),('2171060','2171','SEKUPANG'),('2171061','2171','BATU AJI'),('2171070','2171','LUBUK BAJA'),('2171080','2171','BATU AMPAR'),('2171081','2171','BENGKONG'),('2172010','2172','BUKIT BESTARI'),('2172020','2172','TANJUNGPINANG TIMUR'),('2172030','2172','TANJUNGPINANG KOTA'),('2172040','2172','TANJUNGPINANG BARAT'),('3101010','3101','KEPULAUAN SERIBU SELATAN'),('3101020','3101','KEPULAUAN SERIBU UTARA'),('3171010','3171','JAGAKARSA'),('3171020','3171','PASAR MINGGU'),('3171030','3171','CILANDAK'),('3171040','3171','PESANGGRAHAN'),('3171050','3171','KEBAYORAN LAMA'),('3171060','3171','KEBAYORAN BARU'),('3171070','3171','MAMPANG PRAPATAN'),('3171080','3171','PANCORAN'),('3171090','3171','TEBET'),('3171100','3171','SETIA BUDI'),('3172010','3172','PASAR REBO'),('3172020','3172','CIRACAS'),('3172030','3172','CIPAYUNG'),('3172040','3172','MAKASAR'),('3172050','3172','KRAMAT JATI'),('3172060','3172','JATINEGARA'),('3172070','3172','DUREN SAWIT'),('3172080','3172','CAKUNG'),('3172090','3172','PULO GADUNG'),('3172100','3172','MATRAMAN'),('3173010','3173','TANAH ABANG'),('3173020','3173','MENTENG'),('3173030','3173','SENEN'),('3173040','3173','JOHAR BARU'),('3173050','3173','CEMPAKA PUTIH'),('3173060','3173','KEMAYORAN'),('3173070','3173','SAWAH BESAR'),('3173080','3173','GAMBIR'),('3174010','3174','KEMBANGAN'),('3174020','3174','KEBON JERUK'),('3174030','3174','PALMERAH'),('3174040','3174','GROGOL PETAMBURAN'),('3174050','3174','TAMBORA'),('3174060','3174','TAMAN SARI'),('3174070','3174','CENGKARENG'),('3174080','3174','KALI DERES'),('3175010','3175','PENJARINGAN'),('3175020','3175','PADEMANGAN'),('3175030','3175','TANJUNG PRIOK'),('3175040','3175','KOJA'),('3175050','3175','KELAPA GADING'),('3175060','3175','CILINCING'),('3201010','3201','NANGGUNG'),('3201020','3201','LEUWILIANG'),('3201021','3201','LEUWISADENG'),('3201030','3201','PAMIJAHAN'),('3201040','3201','CIBUNGBULANG'),('3201050','3201','CIAMPEA'),('3201051','3201','TENJOLAYA'),('3201060','3201','DRAMAGA'),('3201070','3201','CIOMAS'),('3201071','3201','TAMANSARI'),('3201080','3201','CIJERUK'),('3201081','3201','CIGOMBONG'),('3201090','3201','CARINGIN'),('3201100','3201','CIAWI'),('3201110','3201','CISARUA'),('3201120','3201','MEGAMENDUNG'),('3201130','3201','SUKARAJA'),('3201140','3201','BABAKAN MADANG'),('3201150','3201','SUKAMAKMUR'),('3201160','3201','CARIU'),('3201161','3201','TANJUNGSARI'),('3201170','3201','JONGGOL'),('3201180','3201','CILEUNGSI'),('3201181','3201','KELAPA NUNGGAL'),('3201190','3201','GUNUNG PUTRI'),('3201200','3201','CITEUREUP'),('3201210','3201','CIBINONG'),('3201220','3201','BOJONG GEDE'),('3201221','3201','TAJUR HALANG'),('3201230','3201','KEMANG'),('3201231','3201','RANCA BUNGUR'),('3201240','3201','PARUNG'),('3201241','3201','CISEENG'),('3201250','3201','GUNUNG SINDUR'),('3201260','3201','RUMPIN'),('3201270','3201','CIGUDEG'),('3201271','3201','SUKAJAYA'),('3201280','3201','JASINGA'),('3201290','3201','TENJO'),('3201300','3201','PARUNG PANJANG'),('3202010','3202','CIEMAS'),('3202020','3202','CIRACAP'),('3202021','3202','WALURAN'),('3202030','3202','SURADE'),('3202031','3202','CIBITUNG'),('3202040','3202','JAMPANG KULON'),('3202041','3202','CIMANGGU'),('3202050','3202','KALI BUNDER'),('3202060','3202','TEGAL BULEUD'),('3202070','3202','CIDOLOG'),('3202080','3202','SAGARANTEN'),('3202081','3202','CIDADAP'),('3202082','3202','CURUGKEMBAR'),('3202090','3202','PABUARAN'),('3202100','3202','LENGKONG'),('3202110','3202','PALABUHANRATU'),('3202111','3202','SIMPENAN'),('3202120','3202','WARUNG KIARA'),('3202121','3202','BANTARGADUNG'),('3202130','3202','JAMPANG TENGAH'),('3202131','3202','PURABAYA'),('3202140','3202','CIKEMBAR'),('3202150','3202','NYALINDUNG'),('3202160','3202','GEGER BITUNG'),('3202170','3202','SUKARAJA'),('3202171','3202','KEBONPEDES'),('3202172','3202','CIREUNGHAS'),('3202173','3202','SUKALARANG'),('3202180','3202','SUKABUMI'),('3202190','3202','KADUDAMPIT'),('3202200','3202','CISAAT'),('3202201','3202','GUNUNGGURUH'),('3202210','3202','CIBADAK'),('3202211','3202','CICANTAYAN'),('3202212','3202','CARINGIN'),('3202220','3202','NAGRAK'),('3202221','3202','CIAMBAR'),('3202230','3202','CICURUG'),('3202240','3202','CIDAHU'),('3202250','3202','PARAKAN SALAK'),('3202260','3202','PARUNG KUDA'),('3202261','3202','BOJONG GENTENG'),('3202270','3202','KALAPA NUNGGAL'),('3202280','3202','CIKIDANG'),('3202290','3202','CISOLOK'),('3202291','3202','CIKAKAK'),('3202300','3202','KABANDUNGAN'),('3203010','3203','AGRABINTA'),('3203011','3203','LELES'),('3203020','3203','SINDANGBARANG'),('3203030','3203','CIDAUN'),('3203040','3203','NARINGGUL'),('3203050','3203','CIBINONG'),('3203051','3203','CIKADU'),('3203060','3203','TANGGEUNG'),('3203061','3203','PASIRKUDA'),('3203070','3203','KADUPANDAK'),('3203071','3203','CIJATI'),('3203080','3203','TAKOKAK'),('3203090','3203','SUKANAGARA'),('3203100','3203','PAGELARAN'),('3203110','3203','CAMPAKA'),('3203111','3203','CAMPAKA MULYA'),('3203120','3203','CIBEBER'),('3203130','3203','WARUNGKONDANG'),('3203131','3203','GEKBRONG'),('3203140','3203','CILAKU'),('3203150','3203','SUKALUYU'),('3203160','3203','BOJONGPICUNG'),('3203161','3203','HAURWANGI'),('3203170','3203','CIRANJANG'),('3203180','3203','MANDE'),('3203190','3203','KARANGTENGAH'),('3203200','3203','CIANJUR'),('3203210','3203','CUGENANG'),('3203220','3203','PACET'),('3203221','3203','CIPANAS'),('3203230','3203','SUKARESMI'),('3203240','3203','CIKALONGKULON'),('3204010','3204','CIWIDEY'),('3204011','3204','RANCABALI'),('3204020','3204','PASIRJAMBU'),('3204030','3204','CIMAUNG'),('3204040','3204','PANGALENGAN'),('3204050','3204','KERTASARI'),('3204060','3204','PACET'),('3204070','3204','IBUN'),('3204080','3204','PASEH'),('3204090','3204','CIKANCUNG'),('3204100','3204','CICALENGKA'),('3204101','3204','NAGREG'),('3204110','3204','RANCAEKEK'),('3204120','3204','MAJALAYA'),('3204121','3204','SOLOKAN JERUK'),('3204130','3204','CIPARAY'),('3204140','3204','BALEENDAH'),('3204150','3204','ARJASARI'),('3204160','3204','BANJARAN'),('3204161','3204','CANGKUANG'),('3204170','3204','PAMEUNGPEUK'),('3204180','3204','KATAPANG'),('3204190','3204','SOREANG'),('3204191','3204','KUTAWARINGIN'),('3204250','3204','MARGAASIH'),('3204260','3204','MARGAHAYU'),('3204270','3204','DAYEUHKOLOT'),('3204280','3204','BOJONGSOANG'),('3204290','3204','CILEUNYI'),('3204300','3204','CILENGKRANG'),('3204310','3204','CIMENYAN'),('3205010','3205','CISEWU'),('3205011','3205','CARINGIN'),('3205020','3205','TALEGONG'),('3205030','3205','BUNGBULANG'),('3205031','3205','MEKARMUKTI'),('3205040','3205','PAMULIHAN'),('3205050','3205','PAKENJENG'),('3205060','3205','CIKELET'),('3205070','3205','PAMEUNGPEUK'),('3205080','3205','CIBALONG'),('3205090','3205','CISOMPET'),('3205100','3205','PEUNDEUY'),('3205110','3205','SINGAJAYA'),('3205111','3205','CIHURIP'),('3205120','3205','CIKAJANG'),('3205130','3205','BANJARWANGI'),('3205140','3205','CILAWU'),('3205150','3205','BAYONGBONG'),('3205151','3205','CIGEDUG'),('3205160','3205','CISURUPAN'),('3205161','3205','SUKARESMI'),('3205170','3205','SAMARANG'),('3205171','3205','PASIRWANGI'),('3205181','3205','TAROGONG KIDUL'),('3205182','3205','TAROGONG KALER'),('3205190','3205','GARUT KOTA'),('3205200','3205','KARANGPAWITAN'),('3205210','3205','WANARAJA'),('3205211','3205','SUCINARAJA'),('3205212','3205','PANGATIKAN'),('3205220','3205','SUKAWENING'),('3205221','3205','KARANGTENGAH'),('3205230','3205','BANYURESMI'),('3205240','3205','LELES'),('3205250','3205','LEUWIGOONG'),('3205260','3205','CIBATU'),('3205261','3205','KERSAMANAH'),('3205270','3205','CIBIUK'),('3205280','3205','KADUNGORA'),('3205290','3205','BLUBUR LIMBANGAN'),('3205300','3205','SELAAWI'),('3205310','3205','MALANGBONG'),('3206010','3206','CIPATUJAH'),('3206020','3206','KARANGNUNGGAL'),('3206030','3206','CIKALONG'),('3206040','3206','PANCATENGAH'),('3206050','3206','CIKATOMAS'),('3206060','3206','CIBALONG'),('3206061','3206','PARUNGPONTENG'),('3206070','3206','BANTARKALONG'),('3206071','3206','BOJONGASIH'),('3206072','3206','CULAMEGA'),('3206080','3206','BOJONGGAMBIR'),('3206090','3206','SODONGHILIR'),('3206100','3206','TARAJU'),('3206110','3206','SALAWU'),('3206111','3206','PUSPAHIANG'),('3206120','3206','TANJUNGJAYA'),('3206130','3206','SUKARAJA'),('3206140','3206','SALOPA'),('3206141','3206','JATIWARAS'),('3206150','3206','CINEAM'),('3206151','3206','KARANGJAYA'),('3206160','3206','MANONJAYA'),('3206161','3206','GUNUNGTANJUNG'),('3206190','3206','SINGAPARNA'),('3206191','3206','SUKARAME'),('3206192','3206','MANGUNREJA'),('3206200','3206','CIGALONTANG'),('3206210','3206','LEUWISARI'),('3206211','3206','SARIWANGI'),('3206212','3206','PADAKEMBANG'),('3206221','3206','SUKARATU'),('3206230','3206','CISAYONG'),('3206231','3206','SUKAHENING'),('3206240','3206','RAJAPOLAH'),('3206250','3206','JAMANIS'),('3206260','3206','CIAWI'),('3206261','3206','KADIPATEN'),('3206270','3206','PAGERAGEUNG'),('3206271','3206','SUKARESIK'),('3207100','3207','BANJARSARI'),('3207101','3207','BANJARANYAR'),('3207110','3207','LAKBOK'),('3207111','3207','PURWADADI'),('3207120','3207','PAMARICAN'),('3207130','3207','CIDOLOG'),('3207140','3207','CIMARAGAS'),('3207150','3207','CIJEUNGJING'),('3207160','3207','CISAGA'),('3207170','3207','TAMBAKSARI'),('3207180','3207','RANCAH'),('3207190','3207','RAJADESA'),('3207200','3207','SUKADANA'),('3207210','3207','CIAMIS'),('3207211','3207','BAREGBEG'),('3207220','3207','CIKONENG'),('3207221','3207','SINDANGKASIH'),('3207230','3207','CIHAURBEUTI'),('3207240','3207','SADANANYA'),('3207250','3207','CIPAKU'),('3207260','3207','JATINAGARA'),('3207270','3207','PANAWANGAN'),('3207280','3207','KAWALI'),('3207281','3207','LUMBUNG'),('3207290','3207','PANJALU'),('3207291','3207','SUKAMANTRI'),('3207300','3207','PANUMBANGAN'),('3208010','3208','DARMA'),('3208020','3208','KADUGEDE'),('3208021','3208','NUSAHERANG'),('3208030','3208','CINIRU'),('3208031','3208','HANTARA'),('3208040','3208','SELAJAMBE'),('3208050','3208','SUBANG'),('3208051','3208','CILEBAK'),('3208060','3208','CIWARU'),('3208061','3208','KARANGKANCANA'),('3208070','3208','CIBINGBIN'),('3208071','3208','CIBEUREUM'),('3208080','3208','LURAGUNG'),('3208081','3208','CIMAHI'),('3208090','3208','CIDAHU'),('3208091','3208','KALIMANGGIS'),('3208100','3208','CIAWIGEBANG'),('3208101','3208','CIPICUNG'),('3208110','3208','LEBAKWANGI'),('3208111','3208','MALEBER'),('3208120','3208','GARAWANGI'),('3208121','3208','SINDANGAGUNG'),('3208130','3208','KUNINGAN'),('3208140','3208','CIGUGUR'),('3208150','3208','KRAMATMULYA'),('3208160','3208','JALAKSANA'),('3208161','3208','JAPARA'),('3208170','3208','CILIMUS'),('3208171','3208','CIGANDAMEKAR'),('3208180','3208','MANDIRANCAN'),('3208181','3208','PANCALANG'),('3208190','3208','PASAWAHAN'),('3209010','3209','WALED'),('3209011','3209','PASALEMAN'),('3209020','3209','CILEDUG'),('3209021','3209','PABUARAN'),('3209030','3209','LOSARI'),('3209031','3209','PABEDILAN'),('3209040','3209','BABAKAN'),('3209041','3209','GEBANG'),('3209050','3209','KARANGSEMBUNG'),('3209051','3209','KARANGWARENG'),('3209060','3209','LEMAHABANG'),('3209061','3209','SUSUKANLEBAK'),('3209070','3209','SEDONG'),('3209080','3209','ASTANAJAPURA'),('3209081','3209','PANGENAN'),('3209090','3209','MUNDU'),('3209100','3209','BEBER'),('3209101','3209','GREGED'),('3209111','3209','TALUN'),('3209120','3209','SUMBER'),('3209121','3209','DUKUPUNTANG'),('3209130','3209','PALIMANAN'),('3209140','3209','PLUMBON'),('3209141','3209','DEPOK'),('3209150','3209','WERU'),('3209151','3209','PLERED'),('3209161','3209','TENGAH TANI'),('3209162','3209','KEDAWUNG'),('3209171','3209','GUNUNGJATI'),('3209180','3209','KAPETAKAN'),('3209181','3209','SURANENGGALA'),('3209190','3209','KLANGENAN'),('3209191','3209','JAMBLANG'),('3209200','3209','ARJAWINANGUN'),('3209201','3209','PANGURAGAN'),('3209210','3209','CIWARINGIN'),('3209211','3209','GEMPOL'),('3209220','3209','SUSUKAN'),('3209230','3209','GEGESIK'),('3209231','3209','KALIWEDI'),('3210010','3210','LEMAHSUGIH'),('3210020','3210','BANTARUJEG'),('3210021','3210','MALAUSMA'),('3210030','3210','CIKIJING'),('3210031','3210','CINGAMBUL'),('3210040','3210','TALAGA'),('3210041','3210','BANJARAN'),('3210050','3210','ARGAPURA'),('3210060','3210','MAJA'),('3210070','3210','MAJALENGKA'),('3210080','3210','CIGASONG'),('3210090','3210','SUKAHAJI'),('3210091','3210','SINDANG'),('3210100','3210','RAJAGALUH'),('3210110','3210','SINDANGWANGI'),('3210120','3210','LEUWIMUNDING'),('3210130','3210','PALASAH'),('3210140','3210','JATIWANGI'),('3210150','3210','DAWUAN'),('3210151','3210','KASOKANDEL'),('3210160','3210','PANYINGKIRAN'),('3210170','3210','KADIPATEN'),('3210180','3210','KERTAJATI'),('3210190','3210','JATITUJUH'),('3210200','3210','LIGUNG'),('3210210','3210','SUMBERJAYA'),('3211010','3211','JATINANGOR'),('3211020','3211','CIMANGGUNG'),('3211030','3211','TANJUNGSARI'),('3211031','3211','SUKASARI'),('3211032','3211','PAMULIHAN'),('3211040','3211','RANCAKALONG'),('3211050','3211','SUMEDANG SELATAN'),('3211060','3211','SUMEDANG UTARA'),('3211061','3211','GANEAS'),('3211070','3211','SITURAJA'),('3211071','3211','CISITU'),('3211080','3211','DARMARAJA'),('3211090','3211','CIBUGEL'),('3211100','3211','WADO'),('3211101','3211','JATINUNGGAL'),('3211111','3211','JATIGEDE'),('3211120','3211','TOMO'),('3211130','3211','UJUNG JAYA'),('3211140','3211','CONGGEANG'),('3211150','3211','PASEH'),('3211160','3211','CIMALAKA'),('3211161','3211','CISARUA'),('3211170','3211','TANJUNGKERTA'),('3211171','3211','TANJUNGMEDAR'),('3211180','3211','BUAHDUA'),('3211181','3211','SURIAN'),('3212010','3212','HAURGEULIS'),('3212011','3212','GANTAR'),('3212020','3212','KROYA'),('3212030','3212','GABUSWETAN'),('3212040','3212','CIKEDUNG'),('3212041','3212','TERISI'),('3212050','3212','LELEA'),('3212060','3212','BANGODUA'),('3212061','3212','TUKDANA'),('3212070','3212','WIDASARI'),('3212080','3212','KERTASEMAYA'),('3212081','3212','SUKAGUMIWANG'),('3212090','3212','KRANGKENG'),('3212100','3212','KARANGAMPEL'),('3212101','3212','KEDOKAN BUNDER'),('3212110','3212','JUNTINYUAT'),('3212120','3212','SLIYEG'),('3212130','3212','JATIBARANG'),('3212140','3212','BALONGAN'),('3212150','3212','INDRAMAYU'),('3212160','3212','SINDANG'),('3212161','3212','CANTIGI'),('3212162','3212','PASEKAN'),('3212170','3212','LOHBENER'),('3212171','3212','ARAHAN'),('3212180','3212','LOSARANG'),('3212190','3212','KANDANGHAUR'),('3212200','3212','BONGAS'),('3212210','3212','ANJATAN'),('3212220','3212','SUKRA'),('3212221','3212','PATROL'),('3213010','3213','SAGALAHERANG'),('3213011','3213','SERANGPANJANG'),('3213020','3213','JALANCAGAK'),('3213021','3213','CIATER'),('3213030','3213','CISALAK'),('3213031','3213','KASOMALANG'),('3213040','3213','TANJUNGSIANG'),('3213050','3213','CIJAMBE'),('3213060','3213','CIBOGO'),('3213070','3213','SUBANG'),('3213080','3213','KALIJATI'),('3213081','3213','DAWUAN'),('3213090','3213','CIPEUNDEUY'),('3213100','3213','PABUARAN'),('3213110','3213','PATOKBEUSI'),('3213120','3213','PURWADADI'),('3213130','3213','CIKAUM'),('3213140','3213','PAGADEN'),('3213141','3213','PAGADEN BARAT'),('3213150','3213','CIPUNAGARA'),('3213160','3213','COMPRENG'),('3213170','3213','BINONG'),('3213171','3213','TAMBAKDAHAN'),('3213180','3213','CIASEM'),('3213190','3213','PAMANUKAN'),('3213191','3213','SUKASARI'),('3213200','3213','PUSAKANAGARA'),('3213201','3213','PUSAKAJAYA'),('3213210','3213','LEGONKULON'),('3213220','3213','BLANAKAN'),('3214010','3214','JATILUHUR'),('3214011','3214','SUKASARI'),('3214020','3214','MANIIS'),('3214030','3214','TEGAL WARU'),('3214040','3214','PLERED'),('3214050','3214','SUKATANI'),('3214060','3214','DARANGDAN'),('3214070','3214','BOJONG'),('3214080','3214','WANAYASA'),('3214081','3214','KIARAPEDES'),('3214090','3214','PASAWAHAN'),('3214091','3214','PONDOK SALAM'),('3214100','3214','PURWAKARTA'),('3214101','3214','BABAKANCIKAO'),('3214110','3214','CAMPAKA'),('3214111','3214','CIBATU'),('3214112','3214','BUNGURSARI'),('3215010','3215','PANGKALAN'),('3215011','3215','TEGALWARU'),('3215020','3215','CIAMPEL'),('3215031','3215','TELUKJAMBE TIMUR'),('3215032','3215','TELUKJAMBE BARAT'),('3215040','3215','KLARI'),('3215050','3215','CIKAMPEK'),('3215051','3215','PURWASARI'),('3215060','3215','TIRTAMULYA'),('3215070','3215','JATISARI'),('3215071','3215','BANYUSARI'),('3215072','3215','KOTABARU'),('3215081','3215','CILAMAYA WETAN'),('3215082','3215','CILAMAYA KULON'),('3215090','3215','LEMAHABANG'),('3215100','3215','TALAGASARI'),('3215111','3215','MAJALAYA'),('3215112','3215','KARAWANG TIMUR'),('3215113','3215','KARAWANG BARAT'),('3215120','3215','RAWAMERTA'),('3215130','3215','TEMPURAN'),('3215140','3215','KUTAWALUYA'),('3215150','3215','RENGASDENGKLOK'),('3215151','3215','JAYAKERTA'),('3215160','3215','PEDES'),('3215161','3215','CILEBAR'),('3215170','3215','CIBUAYA'),('3215180','3215','TIRTAJAYA'),('3215190','3215','BATUJAYA'),('3215200','3215','PAKISJAYA'),('3216010','3216','SETU'),('3216021','3216','SERANG BARU'),('3216022','3216','CIKARANG PUSAT'),('3216023','3216','CIKARANG SELATAN'),('3216030','3216','CIBARUSAH'),('3216031','3216','BOJONGMANGU'),('3216041','3216','CIKARANG TIMUR'),('3216050','3216','KEDUNGWARINGIN'),('3216061','3216','CIKARANG UTARA'),('3216062','3216','KARANGBAHAGIA'),('3216070','3216','CIBITUNG'),('3216071','3216','CIKARANG BARAT'),('3216081','3216','TAMBUN SELATAN'),('3216082','3216','TAMBUN UTARA'),('3216090','3216','BABELAN'),('3216100','3216','TARUMAJAYA'),('3216110','3216','TAMBELANG'),('3216111','3216','SUKAWANGI'),('3216120','3216','SUKATANI'),('3216121','3216','SUKAKARYA'),('3216130','3216','PEBAYURAN'),('3216140','3216','CABANGBUNGIN'),('3216150','3216','MUARA GEMBONG'),('3217010','3217','RONGGA'),('3217020','3217','GUNUNGHALU'),('3217030','3217','SINDANGKERTA'),('3217040','3217','CILILIN'),('3217050','3217','CIHAMPELAS'),('3217060','3217','CIPONGKOR'),('3217070','3217','BATUJAJAR'),('3217071','3217','SAGULING'),('3217080','3217','CIPATAT'),('3217090','3217','PADALARANG'),('3217100','3217','NGAMPRAH'),('3217110','3217','PARONGPONG'),('3217120','3217','LEMBANG'),('3217130','3217','CISARUA'),('3217140','3217','CIKALONG WETAN'),('3217150','3217','CIPEUNDEUY'),('3218010','3218','CIMERAK'),('3218020','3218','CIJULANG'),('3218030','3218','CIGUGUR'),('3218040','3218','LANGKAPLANCAR'),('3218050','3218','PARIGI'),('3218060','3218','SIDAMULIH'),('3218070','3218','PANGANDARAN'),('3218080','3218','KALIPUCANG'),('3218090','3218','PADAHERANG'),('3218100','3218','MANGUNJAYA'),('3271010','3271','BOGOR SELATAN'),('3271020','3271','BOGOR TIMUR'),('3271030','3271','BOGOR UTARA'),('3271040','3271','BOGOR TENGAH'),('3271050','3271','BOGOR BARAT'),('3271060','3271','TANAH SEREAL'),('3272010','3272','BAROS'),('3272011','3272','LEMBURSITU'),('3272012','3272','CIBEUREUM'),('3272020','3272','CITAMIANG'),('3272030','3272','WARUDOYONG'),('3272040','3272','GUNUNG PUYUH'),('3272050','3272','CIKOLE'),('3273010','3273','BANDUNG KULON'),('3273020','3273','BABAKAN CIPARAY'),('3273030','3273','BOJONGLOA KALER'),('3273040','3273','BOJONGLOA KIDUL'),('3273050','3273','ASTANAANYAR'),('3273060','3273','REGOL'),('3273070','3273','LENGKONG'),('3273080','3273','BANDUNG KIDUL'),('3273090','3273','BUAHBATU'),('3273100','3273','RANCASARI'),('3273101','3273','GEDEBAGE'),('3273110','3273','CIBIRU'),('3273111','3273','PANYILEUKAN'),('3273120','3273','UJUNG BERUNG'),('3273121','3273','CINAMBO'),('3273130','3273','ARCAMANIK'),('3273141','3273','ANTAPANI'),('3273142','3273','MANDALAJATI'),('3273150','3273','KIARACONDONG'),('3273160','3273','BATUNUNGGAL'),('3273170','3273','SUMUR BANDUNG'),('3273180','3273','ANDIR'),('3273190','3273','CICENDO'),('3273200','3273','BANDUNG WETAN'),('3273210','3273','CIBEUNYING KIDUL'),('3273220','3273','CIBEUNYING KALER'),('3273230','3273','COBLONG'),('3273240','3273','SUKAJADI'),('3273250','3273','SUKASARI'),('3273260','3273','CIDADAP'),('3274010','3274','HARJAMUKTI'),('3274020','3274','LEMAHWUNGKUK'),('3274030','3274','PEKALIPAN'),('3274040','3274','KESAMBI'),('3274050','3274','KEJAKSAN'),('3275010','3275','PONDOKGEDE'),('3275011','3275','JATISAMPURNA'),('3275012','3275','PONDOKMELATI'),('3275020','3275','JATIASIH'),('3275030','3275','BANTARGEBANG'),('3275031','3275','MUSTIKAJAYA'),('3275040','3275','BEKASI TIMUR'),('3275041','3275','RAWALUMBU'),('3275050','3275','BEKASI SELATAN'),('3275060','3275','BEKASI BARAT'),('3275061','3275','MEDAN SATRIA'),('3275070','3275','BEKASI UTARA'),('3276010','3276','SAWANGAN'),('3276011','3276','BOJONGSARI'),('3276020','3276','PANCORAN MAS'),('3276021','3276','CIPAYUNG'),('3276030','3276','SUKMA JAYA'),('3276031','3276','CILODONG'),('3276040','3276','CIMANGGIS'),('3276041','3276','TAPOS'),('3276050','3276','BEJI'),('3276060','3276','LIMO'),('3276061','3276','CINERE'),('3277010','3277','CIMAHI SELATAN'),('3277020','3277','CIMAHI TENGAH'),('3277030','3277','CIMAHI UTARA'),('3278010','3278','KAWALU'),('3278020','3278','TAMANSARI'),('3278030','3278','CIBEUREUM'),('3278031','3278','PURBARATU'),('3278040','3278','TAWANG'),('3278050','3278','CIHIDEUNG'),('3278060','3278','MANGKUBUMI'),('3278070','3278','INDIHIANG'),('3278071','3278','BUNGURSARI'),('3278080','3278','CIPEDES'),('3279010','3279','BANJAR'),('3279020','3279','PURWAHARJA'),('3279030','3279','PATARUMAN'),('3279040','3279','LANGENSARI'),('3301010','3301','DAYEUHLUHUR'),('3301020','3301','WANAREJA'),('3301030','3301','MAJENANG'),('3301040','3301','CIMANGGU'),('3301050','3301','KARANGPUCUNG'),('3301060','3301','CIPARI'),('3301070','3301','SIDAREJA'),('3301080','3301','KEDUNGREJA'),('3301090','3301','PATIMUAN'),('3301100','3301','GANDRUNGMANGU'),('3301110','3301','BANTARSARI'),('3301120','3301','KAWUNGANTEN'),('3301121','3301','KAMPUNG LAUT'),('3301130','3301','JERUKLEGI'),('3301140','3301','KESUGIHAN'),('3301150','3301','ADIPALA'),('3301160','3301','MAOS'),('3301170','3301','SAMPANG'),('3301180','3301','KROYA'),('3301190','3301','BINANGUN'),('3301200','3301','NUSAWUNGU'),('3301710','3301','CILACAP SELATAN'),('3301720','3301','CILACAP TENGAH'),('3301730','3301','CILACAP UTARA'),('3302010','3302','LUMBIR'),('3302020','3302','WANGON'),('3302030','3302','JATILAWANG'),('3302040','3302','RAWALO'),('3302050','3302','KEBASEN'),('3302060','3302','KEMRANJEN'),('3302070','3302','SUMPIUH'),('3302080','3302','TAMBAK'),('3302090','3302','SOMAGEDE'),('3302100','3302','KALIBAGOR'),('3302110','3302','BANYUMAS'),('3302120','3302','PATIKRAJA'),('3302130','3302','PURWOJATI'),('3302140','3302','AJIBARANG'),('3302150','3302','GUMELAR'),('3302160','3302','PEKUNCEN'),('3302170','3302','CILONGOK'),('3302180','3302','KARANGLEWAS'),('3302190','3302','KEDUNG BANTENG'),('3302200','3302','BATURRADEN'),('3302210','3302','SUMBANG'),('3302220','3302','KEMBARAN'),('3302230','3302','SOKARAJA'),('3302710','3302','PURWOKERTO SELATAN'),('3302720','3302','PURWOKERTO BARAT'),('3302730','3302','PURWOKERTO TIMUR'),('3302740','3302','PURWOKERTO UTARA'),('3303010','3303','KEMANGKON'),('3303020','3303','BUKATEJA'),('3303030','3303','KEJOBONG'),('3303040','3303','PENGADEGAN'),('3303050','3303','KALIGONDANG'),('3303060','3303','PURBALINGGA'),('3303070','3303','KALIMANAH'),('3303080','3303','PADAMARA'),('3303090','3303','KUTASARI'),('3303100','3303','BOJONGSARI'),('3303110','3303','MREBET'),('3303120','3303','BOBOTSARI'),('3303130','3303','KARANGREJA'),('3303131','3303','KARANGJAMBU'),('3303140','3303','KARANGANYAR'),('3303141','3303','KERTANEGARA'),('3303150','3303','KARANGMONCOL'),('3303160','3303','REMBANG'),('3304010','3304','SUSUKAN'),('3304020','3304','PURWAREJA KLAMPOK'),('3304030','3304','MANDIRAJA'),('3304040','3304','PURWANEGARA'),('3304050','3304','BAWANG'),('3304060','3304','BANJARNEGARA'),('3304061','3304','PAGEDONGAN'),('3304070','3304','SIGALUH'),('3304080','3304','MADUKARA'),('3304090','3304','BANJARMANGU'),('3304100','3304','WANADADI'),('3304110','3304','RAKIT'),('3304120','3304','PUNGGELAN'),('3304130','3304','KARANGKOBAR'),('3304140','3304','PAGENTAN'),('3304150','3304','PEJAWARAN'),('3304160','3304','BATUR'),('3304170','3304','WANAYASA'),('3304180','3304','KALIBENING'),('3304181','3304','PANDANARUM'),('3305010','3305','AYAH'),('3305020','3305','BUAYAN'),('3305030','3305','PURING'),('3305040','3305','PETANAHAN'),('3305050','3305','KLIRONG'),('3305060','3305','BULUSPESANTREN'),('3305070','3305','AMBAL'),('3305080','3305','MIRIT'),('3305081','3305','BONOROWO'),('3305090','3305','PREMBUN'),('3305091','3305','PADURESO'),('3305100','3305','KUTOWINANGUN'),('3305110','3305','ALIAN'),('3305111','3305','PONCOWARNO'),('3305120','3305','KEBUMEN'),('3305130','3305','PEJAGOAN'),('3305140','3305','SRUWENG'),('3305150','3305','ADIMULYO'),('3305160','3305','KUWARASAN'),('3305170','3305','ROWOKELE'),('3305180','3305','SEMPOR'),('3305190','3305','GOMBONG'),('3305200','3305','KARANGANYAR'),('3305210','3305','KARANGGAYAM'),('3305220','3305','SADANG'),('3305221','3305','KARANGSAMBUNG'),('3306010','3306','GRABAG'),('3306020','3306','NGOMBOL'),('3306030','3306','PURWODADI'),('3306040','3306','BAGELEN'),('3306050','3306','KALIGESING'),('3306060','3306','PURWOREJO'),('3306070','3306','BANYU URIP'),('3306080','3306','BAYAN'),('3306090','3306','KUTOARJO'),('3306100','3306','BUTUH'),('3306110','3306','PITURUH'),('3306120','3306','KEMIRI'),('3306130','3306','BRUNO'),('3306140','3306','GEBANG'),('3306150','3306','LOANO'),('3306160','3306','BENER'),('3307010','3307','WADASLINTANG'),('3307020','3307','KEPIL'),('3307030','3307','SAPURAN'),('3307031','3307','KALIBAWANG'),('3307040','3307','KALIWIRO'),('3307050','3307','LEKSONO'),('3307051','3307','SUKOHARJO'),('3307060','3307','SELOMERTO'),('3307070','3307','KALIKAJAR'),('3307080','3307','KERTEK'),('3307090','3307','WONOSOBO'),('3307100','3307','WATUMALANG'),('3307110','3307','MOJOTENGAH'),('3307120','3307','GARUNG'),('3307130','3307','KEJAJAR'),('3308010','3308','SALAMAN'),('3308020','3308','BOROBUDUR'),('3308030','3308','NGLUWAR'),('3308040','3308','SALAM'),('3308050','3308','SRUMBUNG'),('3308060','3308','DUKUN'),('3308070','3308','MUNTILAN'),('3308080','3308','MUNGKID'),('3308090','3308','SAWANGAN'),('3308100','3308','CANDIMULYO'),('3308110','3308','MERTOYUDAN'),('3308120','3308','TEMPURAN'),('3308130','3308','KAJORAN'),('3308140','3308','KALIANGKRIK'),('3308150','3308','BANDONGAN'),('3308160','3308','WINDUSARI'),('3308170','3308','SECANG'),('3308180','3308','TEGALREJO'),('3308190','3308','PAKIS'),('3308200','3308','GRABAG'),('3308210','3308','NGABLAK'),('3309010','3309','SELO'),('3309020','3309','AMPEL'),('3309030','3309','CEPOGO'),('3309040','3309','MUSUK'),('3309050','3309','BOYOLALI'),('3309060','3309','MOJOSONGO'),('3309070','3309','TERAS'),('3309080','3309','SAWIT'),('3309090','3309','BANYUDONO'),('3309100','3309','SAMBI'),('3309110','3309','NGEMPLAK'),('3309120','3309','NOGOSARI'),('3309130','3309','SIMO'),('3309140','3309','KARANGGEDE'),('3309150','3309','KLEGO'),('3309160','3309','ANDONG'),('3309170','3309','KEMUSU'),('3309180','3309','WONOSEGORO'),('3309190','3309','JUWANGI'),('3310010','3310','PRAMBANAN'),('3310020','3310','GANTIWARNO'),('3310030','3310','WEDI'),('3310040','3310','BAYAT'),('3310050','3310','CAWAS'),('3310060','3310','TRUCUK'),('3310070','3310','KALIKOTES'),('3310080','3310','KEBONARUM'),('3310090','3310','JOGONALAN'),('3310100','3310','MANISRENGGO'),('3310110','3310','KARANGNONGKO'),('3310120','3310','NGAWEN'),('3310130','3310','CEPER'),('3310140','3310','PEDAN'),('3310150','3310','KARANGDOWO'),('3310160','3310','JUWIRING'),('3310170','3310','WONOSARI'),('3310180','3310','DELANGGU'),('3310190','3310','POLANHARJO'),('3310200','3310','KARANGANOM'),('3310210','3310','TULUNG'),('3310220','3310','JATINOM'),('3310230','3310','KEMALANG'),('3310710','3310','KLATEN SELATAN'),('3310720','3310','KLATEN TENGAH'),('3310730','3310','KLATEN UTARA'),('3311010','3311','WERU'),('3311020','3311','BULU'),('3311030','3311','TAWANGSARI'),('3311040','3311','SUKOHARJO'),('3311050','3311','NGUTER'),('3311060','3311','BENDOSARI'),('3311070','3311','POLOKARTO'),('3311080','3311','MOJOLABAN'),('3311090','3311','GROGOL'),('3311100','3311','BAKI'),('3311110','3311','GATAK'),('3311120','3311','KARTASURA'),('3312010','3312','PRACIMANTORO'),('3312020','3312','PARANGGUPITO'),('3312030','3312','GIRITONTRO'),('3312040','3312','GIRIWOYO'),('3312050','3312','BATUWARNO'),('3312060','3312','KARANGTENGAH'),('3312070','3312','TIRTOMOYO'),('3312080','3312','NGUNTORONADI'),('3312090','3312','BATURETNO'),('3312100','3312','EROMOKO'),('3312110','3312','WURYANTORO'),('3312120','3312','MANYARAN'),('3312130','3312','SELOGIRI'),('3312140','3312','WONOGIRI'),('3312150','3312','NGADIROJO'),('3312160','3312','SIDOHARJO'),('3312170','3312','JATIROTO'),('3312180','3312','KISMANTORO'),('3312190','3312','PURWANTORO'),('3312200','3312','BULUKERTO'),('3312201','3312','PUHPELEM'),('3312210','3312','SLOGOHIMO'),('3312220','3312','JATISRONO'),('3312230','3312','JATIPURNO'),('3312240','3312','GIRIMARTO'),('3313010','3313','JATIPURO'),('3313020','3313','JATIYOSO'),('3313030','3313','JUMAPOLO'),('3313040','3313','JUMANTONO'),('3313050','3313','MATESIH'),('3313060','3313','TAWANGMANGU'),('3313070','3313','NGARGOYOSO'),('3313080','3313','KARANGPANDAN'),('3313090','3313','KARANGANYAR'),('3313100','3313','TASIKMADU'),('3313110','3313','JATEN'),('3313120','3313','COLOMADU'),('3313130','3313','GONDANGREJO'),('3313140','3313','KEBAKKRAMAT'),('3313150','3313','MOJOGEDANG'),('3313160','3313','KERJO'),('3313170','3313','JENAWI'),('3314010','3314','KALIJAMBE'),('3314020','3314','PLUPUH'),('3314030','3314','MASARAN'),('3314040','3314','KEDAWUNG'),('3314050','3314','SAMBIREJO'),('3314060','3314','GONDANG'),('3314070','3314','SAMBUNG MACAN'),('3314080','3314','NGRAMPAL'),('3314090','3314','KARANGMALANG'),('3314100','3314','SRAGEN'),('3314110','3314','SIDOHARJO'),('3314120','3314','TANON'),('3314130','3314','GEMOLONG'),('3314140','3314','MIRI'),('3314150','3314','SUMBERLAWANG'),('3314160','3314','MONDOKAN'),('3314170','3314','SUKODONO'),('3314180','3314','GESI'),('3314190','3314','TANGEN'),('3314200','3314','JENAR'),('3315010','3315','KEDUNGJATI'),('3315020','3315','KARANGRAYUNG'),('3315030','3315','PENAWANGAN'),('3315040','3315','TOROH'),('3315050','3315','GEYER'),('3315060','3315','PULOKULON'),('3315070','3315','KRADENAN'),('3315080','3315','GABUS'),('3315090','3315','NGARINGAN'),('3315100','3315','WIROSARI'),('3315110','3315','TAWANGHARJO'),('3315120','3315','GROBOGAN'),('3315130','3315','PURWODADI'),('3315140','3315','BRATI'),('3315150','3315','KLAMBU'),('3315160','3315','GODONG'),('3315170','3315','GUBUG'),('3315180','3315','TEGOWANU'),('3315190','3315','TANGGUNGHARJO'),('3316010','3316','JATI'),('3316020','3316','RANDUBLATUNG'),('3316030','3316','KRADENAN'),('3316040','3316','KEDUNGTUBAN'),('3316050','3316','CEPU'),('3316060','3316','SAMBONG'),('3316070','3316','JIKEN'),('3316080','3316','BOGOREJO'),('3316090','3316','JEPON'),('3316100','3316','KOTA BLORA'),('3316110','3316','BANJAREJO'),('3316120','3316','TUNJUNGAN'),('3316130','3316','JAPAH'),('3316140','3316','NGAWEN'),('3316150','3316','KUNDURAN'),('3316160','3316','TODANAN'),('3317010','3317','SUMBER'),('3317020','3317','BULU'),('3317030','3317','GUNEM'),('3317040','3317','SALE'),('3317050','3317','SARANG'),('3317060','3317','SEDAN'),('3317070','3317','PAMOTAN'),('3317080','3317','SULANG'),('3317090','3317','KALIORI'),('3317100','3317','REMBANG'),('3317110','3317','PANCUR'),('3317120','3317','KRAGAN'),('3317130','3317','SLUKE'),('3317140','3317','LASEM'),('3318010','3318','SUKOLILO'),('3318020','3318','KAYEN'),('3318030','3318','TAMBAKROMO'),('3318040','3318','WINONG'),('3318050','3318','PUCAKWANGI'),('3318060','3318','JAKEN'),('3318070','3318','BATANGAN'),('3318080','3318','JUWANA'),('3318090','3318','JAKENAN'),('3318100','3318','PATI'),('3318110','3318','GABUS'),('3318120','3318','MARGOREJO'),('3318130','3318','GEMBONG'),('3318140','3318','TLOGOWUNGU'),('3318150','3318','WEDARIJAKSA'),('3318160','3318','TRANGKIL'),('3318170','3318','MARGOYOSO'),('3318180','3318','GUNUNG WUNGKAL'),('3318190','3318','CLUWAK'),('3318200','3318','TAYU'),('3318210','3318','DUKUHSETI'),('3319010','3319','KALIWUNGU'),('3319020','3319','KOTA KUDUS'),('3319030','3319','JATI'),('3319040','3319','UNDAAN'),('3319050','3319','MEJOBO'),('3319060','3319','JEKULO'),('3319070','3319','BAE'),('3319080','3319','GEBOG'),('3319090','3319','DAWE'),('3320010','3320','KEDUNG'),('3320020','3320','PECANGAAN'),('3320021','3320','KALINYAMATAN'),('3320030','3320','WELAHAN'),('3320040','3320','MAYONG'),('3320050','3320','NALUMSARI'),('3320060','3320','BATEALIT'),('3320070','3320','TAHUNAN'),('3320080','3320','JEPARA'),('3320090','3320','MLONGGO'),('3320091','3320','PAKIS AJI'),('3320100','3320','BANGSRI'),('3320101','3320','KEMBANG'),('3320110','3320','KELING'),('3320111','3320','DONOROJO'),('3320120','3320','KARIMUNJAWA'),('3321010','3321','MRANGGEN'),('3321020','3321','KARANGAWEN'),('3321030','3321','GUNTUR'),('3321040','3321','SAYUNG'),('3321050','3321','KARANG TENGAH'),('3321060','3321','BONANG'),('3321070','3321','DEMAK'),('3321080','3321','WONOSALAM'),('3321090','3321','DEMPET'),('3321091','3321','KEBONAGUNG'),('3321100','3321','GAJAH'),('3321110','3321','KARANGANYAR'),('3321120','3321','MIJEN'),('3321130','3321','WEDUNG'),('3322010','3322','GETASAN'),('3322020','3322','TENGARAN'),('3322030','3322','SUSUKAN'),('3322031','3322','KALIWUNGU'),('3322040','3322','SURUH'),('3322050','3322','PABELAN'),('3322060','3322','TUNTANG'),('3322070','3322','BANYUBIRU'),('3322080','3322','JAMBU'),('3322090','3322','SUMOWONO'),('3322100','3322','AMBARAWA'),('3322101','3322','BANDUNGAN'),('3322110','3322','BAWEN'),('3322120','3322','BRINGIN'),('3322121','3322','BANCAK'),('3322130','3322','PRINGAPUS'),('3322140','3322','BERGAS'),('3322151','3322','UNGARAN BARAT'),('3322152','3322','UNGARAN TIMUR'),('3323010','3323','PARAKAN'),('3323011','3323','KLEDUNG'),('3323012','3323','BANSARI'),('3323020','3323','BULU'),('3323030','3323','TEMANGGUNG'),('3323031','3323','TLOGOMULYO'),('3323040','3323','TEMBARAK'),('3323041','3323','SELOPAMPANG'),('3323050','3323','KRANGGAN'),('3323060','3323','PRINGSURAT'),('3323070','3323','KALORAN'),('3323080','3323','KANDANGAN'),('3323090','3323','KEDU'),('3323100','3323','NGADIREJO'),('3323110','3323','JUMO'),('3323111','3323','GEMAWANG'),('3323120','3323','CANDIROTO'),('3323121','3323','BEJEN'),('3323130','3323','TRETEP'),('3323131','3323','WONOBOYO'),('3324010','3324','PLANTUNGAN'),('3324020','3324','SUKOREJO'),('3324030','3324','PAGERRUYUNG'),('3324040','3324','PATEAN'),('3324050','3324','SINGOROJO'),('3324060','3324','LIMBANGAN'),('3324070','3324','BOJA'),('3324080','3324','KALIWUNGU'),('3324081','3324','KALIWUNGU SELATAN'),('3324090','3324','BRANGSONG'),('3324100','3324','PEGANDON'),('3324101','3324','NGAMPEL'),('3324110','3324','GEMUH'),('3324111','3324','RINGINARUM'),('3324120','3324','WELERI'),('3324130','3324','ROWOSARI'),('3324140','3324','KANGKUNG'),('3324150','3324','CEPIRING'),('3324160','3324','PATEBON'),('3324170','3324','KOTA KENDAL'),('3325010','3325','WONOTUNGGAL'),('3325020','3325','BANDAR'),('3325030','3325','BLADO'),('3325040','3325','REBAN'),('3325050','3325','BAWANG'),('3325060','3325','TERSONO'),('3325070','3325','GRINGSING'),('3325080','3325','LIMPUNG'),('3325081','3325','BANYUPUTIH'),('3325090','3325','SUBAH'),('3325091','3325','PECALUNGAN'),('3325100','3325','TULIS'),('3325101','3325','KANDEMAN'),('3325110','3325','BATANG'),('3325120','3325','WARUNG ASEM'),('3326010','3326','KANDANGSERANG'),('3326020','3326','PANINGGARAN'),('3326030','3326','LEBAKBARANG'),('3326040','3326','PETUNGKRIONO'),('3326050','3326','TALUN'),('3326060','3326','DORO'),('3326070','3326','KARANGANYAR'),('3326080','3326','KAJEN'),('3326090','3326','KESESI'),('3326100','3326','SRAGI'),('3326101','3326','SIWALAN'),('3326110','3326','BOJONG'),('3326120','3326','WONOPRINGGO'),('3326130','3326','KEDUNGWUNI'),('3326131','3326','KARANGDADAP'),('3326140','3326','BUARAN'),('3326150','3326','TIRTO'),('3326160','3326','WIRADESA'),('3326161','3326','WONOKERTO'),('3327010','3327','MOGA'),('3327011','3327','WARUNGPRING'),('3327020','3327','PULOSARI'),('3327030','3327','BELIK'),('3327040','3327','WATUKUMPUL'),('3327050','3327','BODEH'),('3327060','3327','BANTARBOLANG'),('3327070','3327','RANDUDONGKAL'),('3327080','3327','PEMALANG'),('3327090','3327','TAMAN'),('3327100','3327','PETARUKAN'),('3327110','3327','AMPELGADING'),('3327120','3327','COMAL'),('3327130','3327','ULUJAMI'),('3328010','3328','MARGASARI'),('3328020','3328','BUMIJAWA'),('3328030','3328','BOJONG'),('3328040','3328','BALAPULANG'),('3328050','3328','PAGERBARANG'),('3328060','3328','LEBAKSIU'),('3328070','3328','JATINEGARA'),('3328080','3328','KEDUNG BANTENG'),('3328090','3328','PANGKAH'),('3328100','3328','SLAWI'),('3328110','3328','DUKUHWARU'),('3328120','3328','ADIWERNA'),('3328130','3328','DUKUHTURI'),('3328140','3328','TALANG'),('3328150','3328','TARUB'),('3328160','3328','KRAMAT'),('3328170','3328','SURADADI'),('3328180','3328','WARUREJA'),('3329010','3329','SALEM'),('3329020','3329','BANTARKAWUNG'),('3329030','3329','BUMIAYU'),('3329040','3329','PAGUYANGAN'),('3329050','3329','SIRAMPOG'),('3329060','3329','TONJONG'),('3329070','3329','LARANGAN'),('3329080','3329','KETANGGUNGAN'),('3329090','3329','BANJARHARJO'),('3329100','3329','LOSARI'),('3329110','3329','TANJUNG'),('3329120','3329','KERSANA'),('3329130','3329','BULAKAMBA'),('3329140','3329','WANASARI'),('3329150','3329','SONGGOM'),('3329160','3329','JATIBARANG'),('3329170','3329','BREBES'),('3371010','3371','MAGELANG SELATAN'),('3371011','3371','MAGELANG TENGAH'),('3371020','3371','MAGELANG UTARA'),('3372010','3372','LAWEYAN'),('3372020','3372','SERENGAN'),('3372030','3372','PASAR KLIWON'),('3372040','3372','JEBRES'),('3372050','3372','BANJARSARI'),('3373010','3373','ARGOMULYO'),('3373020','3373','TINGKIR'),('3373030','3373','SIDOMUKTI'),('3373040','3373','SIDOREJO'),('3374010','3374','MIJEN'),('3374020','3374','GUNUNG PATI'),('3374030','3374','BANYUMANIK'),('3374040','3374','GAJAH MUNGKUR'),('3374050','3374','SEMARANG SELATAN'),('3374060','3374','CANDISARI'),('3374070','3374','TEMBALANG'),('3374080','3374','PEDURUNGAN'),('3374090','3374','GENUK'),('3374100','3374','GAYAMSARI'),('3374110','3374','SEMARANG TIMUR'),('3374120','3374','SEMARANG UTARA'),('3374130','3374','SEMARANG TENGAH'),('3374140','3374','SEMARANG BARAT'),('3374150','3374','TUGU'),('3374160','3374','NGALIYAN'),('3375010','3375','PEKALONGAN BARAT'),('3375020','3375','PEKALONGAN TIMUR'),('3375030','3375','PEKALONGAN SELATAN'),('3375040','3375','PEKALONGAN UTARA'),('3376010','3376','TEGAL SELATAN'),('3376020','3376','TEGAL TIMUR'),('3376030','3376','TEGAL BARAT'),('3376040','3376','MARGADANA'),('3401010','3401','TEMON'),('3401020','3401','WATES'),('3401030','3401','PANJATAN'),('3401040','3401','GALUR'),('3401050','3401','LENDAH'),('3401060','3401','SENTOLO'),('3401070','3401','PENGASIH'),('3401080','3401','KOKAP'),('3401090','3401','GIRIMULYO'),('3401100','3401','NANGGULAN'),('3401110','3401','KALIBAWANG'),('3401120','3401','SAMIGALUH'),('3402010','3402','SRANDAKAN'),('3402020','3402','SANDEN'),('3402030','3402','KRETEK'),('3402040','3402','PUNDONG'),('3402050','3402','BAMBANG LIPURO'),('3402060','3402','PANDAK'),('3402070','3402','BANTUL'),('3402080','3402','JETIS'),('3402090','3402','IMOGIRI'),('3402100','3402','DLINGO'),('3402110','3402','PLERET'),('3402120','3402','PIYUNGAN'),('3402130','3402','BANGUNTAPAN'),('3402140','3402','SEWON'),('3402150','3402','KASIHAN'),('3402160','3402','PAJANGAN'),('3402170','3402','SEDAYU'),('3403010','3403','PANGGANG'),('3403011','3403','PURWOSARI'),('3403020','3403','PALIYAN'),('3403030','3403','SAPTO SARI'),('3403040','3403','TEPUS'),('3403041','3403','TANJUNGSARI'),('3403050','3403','RONGKOP'),('3403051','3403','GIRISUBO'),('3403060','3403','SEMANU'),('3403070','3403','PONJONG'),('3403080','3403','KARANGMOJO'),('3403090','3403','WONOSARI'),('3403100','3403','PLAYEN'),('3403110','3403','PATUK'),('3403120','3403','GEDANG SARI'),('3403130','3403','NGLIPAR'),('3403140','3403','NGAWEN'),('3403150','3403','SEMIN'),('3404010','3404','MOYUDAN'),('3404020','3404','MINGGIR'),('3404030','3404','SEYEGAN'),('3404040','3404','GODEAN'),('3404050','3404','GAMPING'),('3404060','3404','MLATI'),('3404070','3404','DEPOK'),('3404080','3404','BERBAH'),('3404090','3404','PRAMBANAN'),('3404100','3404','KALASAN'),('3404110','3404','NGEMPLAK'),('3404120','3404','NGAGLIK'),('3404130','3404','SLEMAN'),('3404140','3404','TEMPEL'),('3404150','3404','TURI'),('3404160','3404','PAKEM'),('3404170','3404','CANGKRINGAN'),('3471010','3471','MANTRIJERON'),('3471020','3471','KRATON'),('3471030','3471','MERGANGSAN'),('3471040','3471','UMBULHARJO'),('3471050','3471','KOTAGEDE'),('3471060','3471','GONDOKUSUMAN'),('3471070','3471','DANUREJAN'),('3471080','3471','PAKUALAMAN'),('3471090','3471','GONDOMANAN'),('3471100','3471','NGAMPILAN'),('3471110','3471','WIROBRAJAN'),('3471120','3471','GEDONG TENGEN'),('3471130','3471','JETIS'),('3471140','3471','TEGALREJO'),('3501010','3501','DONOROJO'),('3501020','3501','PUNUNG'),('3501030','3501','PRINGKUKU'),('3501040','3501','PACITAN'),('3501050','3501','KEBONAGUNG'),('3501060','3501','ARJOSARI'),('3501070','3501','NAWANGAN'),('3501080','3501','BANDAR'),('3501090','3501','TEGALOMBO'),('3501100','3501','TULAKAN'),('3501110','3501','NGADIROJO'),('3501120','3501','SUDIMORO'),('3502010','3502','NGRAYUN'),('3502020','3502','SLAHUNG'),('3502030','3502','BUNGKAL'),('3502040','3502','SAMBIT'),('3502050','3502','SAWOO'),('3502060','3502','SOOKO'),('3502061','3502','PUDAK'),('3502070','3502','PULUNG'),('3502080','3502','MLARAK'),('3502090','3502','SIMAN'),('3502100','3502','JETIS'),('3502110','3502','BALONG'),('3502120','3502','KAUMAN'),('3502130','3502','JAMBON'),('3502140','3502','BADEGAN'),('3502150','3502','SAMPUNG'),('3502160','3502','SUKOREJO'),('3502170','3502','PONOROGO'),('3502180','3502','BABADAN'),('3502190','3502','JENANGAN'),('3502200','3502','NGEBEL'),('3503010','3503','PANGGUL'),('3503020','3503','MUNJUNGAN'),('3503030','3503','WATULIMO'),('3503040','3503','KAMPAK'),('3503050','3503','DONGKO'),('3503060','3503','PULE'),('3503070','3503','KARANGAN'),('3503071','3503','SURUH'),('3503080','3503','GANDUSARI'),('3503090','3503','DURENAN'),('3503100','3503','POGALAN'),('3503110','3503','TRENGGALEK'),('3503120','3503','TUGU'),('3503130','3503','BENDUNGAN'),('3504010','3504','BESUKI'),('3504020','3504','BANDUNG'),('3504030','3504','PAKEL'),('3504040','3504','CAMPUR DARAT'),('3504050','3504','TANGGUNG GUNUNG'),('3504060','3504','KALIDAWIR'),('3504070','3504','PUCANG LABAN'),('3504080','3504','REJOTANGAN'),('3504090','3504','NGUNUT'),('3504100','3504','SUMBERGEMPOL'),('3504110','3504','BOYOLANGU'),('3504120','3504','TULUNGAGUNG'),('3504130','3504','KEDUNGWARU'),('3504140','3504','NGANTRU'),('3504150','3504','KARANGREJO'),('3504160','3504','KAUMAN'),('3504170','3504','GONDANG'),('3504180','3504','PAGER WOJO'),('3504190','3504','SENDANG'),('3505010','3505','BAKUNG'),('3505020','3505','WONOTIRTO'),('3505030','3505','PANGGUNGREJO'),('3505040','3505','WATES'),('3505050','3505','BINANGUN'),('3505060','3505','SUTOJAYAN'),('3505070','3505','KADEMANGAN'),('3505080','3505','KANIGORO'),('3505090','3505','TALUN'),('3505100','3505','SELOPURO'),('3505110','3505','KESAMBEN'),('3505120','3505','SELOREJO'),('3505130','3505','DOKO'),('3505140','3505','WLINGI'),('3505150','3505','GANDUSARI'),('3505160','3505','GARUM'),('3505170','3505','NGLEGOK'),('3505180','3505','SANANKULON'),('3505190','3505','PONGGOK'),('3505200','3505','SRENGAT'),('3505210','3505','WONODADI'),('3505220','3505','UDANAWU'),('3506010','3506','MOJO'),('3506020','3506','SEMEN'),('3506030','3506','NGADILUWIH'),('3506040','3506','KRAS'),('3506050','3506','RINGINREJO'),('3506060','3506','KANDAT'),('3506070','3506','WATES'),('3506080','3506','NGANCAR'),('3506090','3506','PLOSOKLATEN'),('3506100','3506','GURAH'),('3506110','3506','PUNCU'),('3506120','3506','KEPUNG'),('3506130','3506','KANDANGAN'),('3506140','3506','PARE'),('3506141','3506','BADAS'),('3506150','3506','KUNJANG'),('3506160','3506','PLEMAHAN'),('3506170','3506','PURWOASRI'),('3506180','3506','PAPAR'),('3506190','3506','PAGU'),('3506191','3506','KAYEN KIDUL'),('3506200','3506','GAMPENGREJO'),('3506201','3506','NGASEM'),('3506210','3506','BANYAKAN'),('3506220','3506','GROGOL'),('3506230','3506','TAROKAN'),('3507010','3507','DONOMULYO'),('3507020','3507','KALIPARE'),('3507030','3507','PAGAK'),('3507040','3507','BANTUR'),('3507050','3507','GEDANGAN'),('3507060','3507','SUMBERMANJING'),('3507070','3507','DAMPIT'),('3507080','3507','TIRTO YUDO'),('3507090','3507','AMPELGADING'),('3507100','3507','PONCOKUSUMO'),('3507110','3507','WAJAK'),('3507120','3507','TUREN'),('3507130','3507','BULULAWANG'),('3507140','3507','GONDANGLEGI'),('3507150','3507','PAGELARAN'),('3507160','3507','KEPANJEN'),('3507170','3507','SUMBER PUCUNG'),('3507180','3507','KROMENGAN'),('3507190','3507','NGAJUM'),('3507200','3507','WONOSARI'),('3507210','3507','WAGIR'),('3507220','3507','PAKISAJI'),('3507230','3507','TAJINAN'),('3507240','3507','TUMPANG'),('3507250','3507','PAKIS'),('3507260','3507','JABUNG'),('3507270','3507','LAWANG'),('3507280','3507','SINGOSARI'),('3507290','3507','KARANGPLOSO'),('3507300','3507','DAU'),('3507310','3507','PUJON'),('3507320','3507','NGANTANG'),('3507330','3507','KASEMBON'),('3508010','3508','TEMPURSARI'),('3508020','3508','PRONOJIWO'),('3508030','3508','CANDIPURO'),('3508040','3508','PASIRIAN'),('3508050','3508','TEMPEH'),('3508060','3508','LUMAJANG'),('3508061','3508','SUMBERSUKO'),('3508070','3508','TEKUNG'),('3508080','3508','KUNIR'),('3508090','3508','YOSOWILANGUN'),('3508100','3508','ROWOKANGKUNG'),('3508110','3508','JATIROTO'),('3508120','3508','RANDUAGUNG'),('3508130','3508','SUKODONO'),('3508140','3508','PADANG'),('3508150','3508','PASRUJAMBE'),('3508160','3508','SENDURO'),('3508170','3508','GUCIALIT'),('3508180','3508','KEDUNGJAJANG'),('3508190','3508','KLAKAH'),('3508200','3508','RANUYOSO'),('3509010','3509','KENCONG'),('3509020','3509','GUMUK MAS'),('3509030','3509','PUGER'),('3509040','3509','WULUHAN'),('3509050','3509','AMBULU'),('3509060','3509','TEMPUREJO'),('3509070','3509','SILO'),('3509080','3509','MAYANG'),('3509090','3509','MUMBULSARI'),('3509100','3509','JENGGAWAH'),('3509110','3509','AJUNG'),('3509120','3509','RAMBIPUJI'),('3509130','3509','BALUNG'),('3509140','3509','UMBULSARI'),('3509150','3509','SEMBORO'),('3509160','3509','JOMBANG'),('3509170','3509','SUMBER BARU'),('3509180','3509','TANGGUL'),('3509190','3509','BANGSALSARI'),('3509200','3509','PANTI'),('3509210','3509','SUKORAMBI'),('3509220','3509','ARJASA'),('3509230','3509','PAKUSARI'),('3509240','3509','KALISAT'),('3509250','3509','LEDOKOMBO'),('3509260','3509','SUMBERJAMBE'),('3509270','3509','SUKOWONO'),('3509280','3509','JELBUK'),('3509710','3509','KALIWATES'),('3509720','3509','SUMBERSARI'),('3509730','3509','PATRANG'),('3510010','3510','PESANGGARAN'),('3510011','3510','SILIRAGUNG'),('3510020','3510','BANGOREJO'),('3510030','3510','PURWOHARJO'),('3510040','3510','TEGALDLIMO'),('3510050','3510','MUNCAR'),('3510060','3510','CLURING'),('3510070','3510','GAMBIRAN'),('3510071','3510','TEGALSARI'),('3510080','3510','GLENMORE'),('3510090','3510','KALIBARU'),('3510100','3510','GENTENG'),('3510110','3510','SRONO'),('3510120','3510','ROGOJAMPI'),('3510121','3510','BLIMBINGSARI'),('3510130','3510','KABAT'),('3510140','3510','SINGOJURUH'),('3510150','3510','SEMPU'),('3510160','3510','SONGGON'),('3510170','3510','GLAGAH'),('3510171','3510','LICIN'),('3510180','3510','BANYUWANGI'),('3510190','3510','GIRI'),('3510200','3510','KALIPURO'),('3510210','3510','WONGSOREJO'),('3511010','3511','MAESAN'),('3511020','3511','GRUJUGAN'),('3511030','3511','TAMANAN'),('3511031','3511','JAMBESARI DARUS SHOLAH'),('3511040','3511','PUJER'),('3511050','3511','TLOGOSARI'),('3511060','3511','SUKOSARI'),('3511061','3511','SUMBER WRINGIN'),('3511070','3511','TAPEN'),('3511080','3511','WONOSARI'),('3511090','3511','TENGGARANG'),('3511100','3511','BONDOWOSO'),('3511110','3511','CURAH DAMI'),('3511111','3511','BINAKAL'),('3511120','3511','PAKEM'),('3511130','3511','WRINGIN'),('3511140','3511','TEGALAMPEL'),('3511141','3511','TAMAN KROCOK'),('3511150','3511','KLABANG'),('3511151','3511','IJEN'),('3511152','3511','BOTOLINGGO'),('3511160','3511','PRAJEKAN'),('3511170','3511','CERMEE'),('3512010','3512','SUMBERMALANG'),('3512020','3512','JATIBANTENG'),('3512030','3512','BANYUGLUGUR'),('3512040','3512','BESUKI'),('3512050','3512','SUBOH'),('3512060','3512','MLANDINGAN'),('3512070','3512','BUNGATAN'),('3512080','3512','KENDIT'),('3512090','3512','PANARUKAN'),('3512100','3512','SITUBONDO'),('3512110','3512','MANGARAN'),('3512120','3512','PANJI'),('3512130','3512','KAPONGAN'),('3512140','3512','ARJASA'),('3512150','3512','JANGKAR'),('3512160','3512','ASEMBAGUS'),('3512170','3512','BANYUPUTIH'),('3513010','3513','SUKAPURA'),('3513020','3513','SUMBER'),('3513030','3513','KURIPAN'),('3513040','3513','BANTARAN'),('3513050','3513','LECES'),('3513060','3513','TEGALSIWALAN'),('3513070','3513','BANYUANYAR'),('3513080','3513','TIRIS'),('3513090','3513','KRUCIL'),('3513100','3513','GADING'),('3513110','3513','PAKUNIRAN'),('3513120','3513','KOTAANYAR'),('3513130','3513','PAITON'),('3513140','3513','BESUK'),('3513150','3513','KRAKSAAN'),('3513160','3513','KREJENGAN'),('3513170','3513','PAJARAKAN'),('3513180','3513','MARON'),('3513190','3513','GENDING'),('3513200','3513','DRINGU'),('3513210','3513','WONOMERTO'),('3513220','3513','LUMBANG'),('3513230','3513','TONGAS'),('3513240','3513','SUMBERASIH'),('3514010','3514','PURWODADI'),('3514020','3514','TUTUR'),('3514030','3514','PUSPO'),('3514040','3514','TOSARI'),('3514050','3514','LUMBANG'),('3514060','3514','PASREPAN'),('3514070','3514','KEJAYAN'),('3514080','3514','WONOREJO'),('3514090','3514','PURWOSARI'),('3514100','3514','PRIGEN'),('3514110','3514','SUKOREJO'),('3514120','3514','PANDAAN'),('3514130','3514','GEMPOL'),('3514140','3514','BEJI'),('3514150','3514','BANGIL'),('3514160','3514','REMBANG'),('3514170','3514','KRATON'),('3514180','3514','POHJENTREK'),('3514190','3514','GONDANG WETAN'),('3514200','3514','REJOSO'),('3514210','3514','WINONGAN'),('3514220','3514','GRATI'),('3514230','3514','LEKOK'),('3514240','3514','NGULING'),('3515010','3515','TARIK'),('3515020','3515','PRAMBON'),('3515030','3515','KREMBUNG'),('3515040','3515','PORONG'),('3515050','3515','JABON'),('3515060','3515','TANGGULANGIN'),('3515070','3515','CANDI'),('3515080','3515','TULANGAN'),('3515090','3515','WONOAYU'),('3515100','3515','SUKODONO'),('3515110','3515','SIDOARJO'),('3515120','3515','BUDURAN'),('3515130','3515','SEDATI'),('3515140','3515','WARU'),('3515150','3515','GEDANGAN'),('3515160','3515','TAMAN'),('3515170','3515','KRIAN'),('3515180','3515','BALONG BENDO'),('3516010','3516','JATIREJO'),('3516020','3516','GONDANG'),('3516030','3516','PACET'),('3516040','3516','TRAWAS'),('3516050','3516','NGORO'),('3516060','3516','PUNGGING'),('3516070','3516','KUTOREJO'),('3516080','3516','MOJOSARI'),('3516090','3516','BANGSAL'),('3516091','3516','MOJOANYAR'),('3516100','3516','DLANGGU'),('3516110','3516','PURI'),('3516120','3516','TROWULAN'),('3516130','3516','SOOKO'),('3516140','3516','GEDEK'),('3516150','3516','KEMLAGI'),('3516160','3516','JETIS'),('3516170','3516','DAWAR BLANDONG'),('3517010','3517','BANDAR KEDUNG MULYO'),('3517020','3517','PERAK'),('3517030','3517','GUDO'),('3517040','3517','DIWEK'),('3517050','3517','NGORO'),('3517060','3517','MOJOWARNO'),('3517070','3517','BARENG'),('3517080','3517','WONOSALAM'),('3517090','3517','MOJOAGUNG'),('3517100','3517','SUMOBITO'),('3517110','3517','JOGO ROTO'),('3517120','3517','PETERONGAN'),('3517130','3517','JOMBANG'),('3517140','3517','MEGALUH'),('3517150','3517','TEMBELANG'),('3517160','3517','KESAMBEN'),('3517170','3517','KUDU'),('3517171','3517','NGUSIKAN'),('3517180','3517','PLOSO'),('3517190','3517','KABUH'),('3517200','3517','PLANDAAN'),('3518010','3518','SAWAHAN'),('3518020','3518','NGETOS'),('3518030','3518','BERBEK'),('3518040','3518','LOCERET'),('3518050','3518','PACE'),('3518060','3518','TANJUNGANOM'),('3518070','3518','PRAMBON'),('3518080','3518','NGRONGGOT'),('3518090','3518','KERTOSONO'),('3518100','3518','PATIANROWO'),('3518110','3518','BARON'),('3518120','3518','GONDANG'),('3518130','3518','SUKOMORO'),('3518140','3518','NGANJUK'),('3518150','3518','BAGOR'),('3518160','3518','WILANGAN'),('3518170','3518','REJOSO'),('3518180','3518','NGLUYU'),('3518190','3518','LENGKONG'),('3518200','3518','JATIKALEN'),('3519010','3519','KEBONSARI'),('3519020','3519','GEGER'),('3519030','3519','DOLOPO'),('3519040','3519','DAGANGAN'),('3519050','3519','WUNGU'),('3519060','3519','KARE'),('3519070','3519','GEMARANG'),('3519080','3519','SARADAN'),('3519090','3519','PILANGKENCENG'),('3519100','3519','MEJAYAN'),('3519110','3519','WONOASRI'),('3519120','3519','BALEREJO'),('3519130','3519','MADIUN'),('3519140','3519','SAWAHAN'),('3519150','3519','JIWAN'),('3520010','3520','PONCOL'),('3520020','3520','PARANG'),('3520030','3520','LEMBEYAN'),('3520040','3520','TAKERAN'),('3520041','3520','NGUNTORONADI'),('3520050','3520','KAWEDANAN'),('3520060','3520','MAGETAN'),('3520061','3520','NGARIBOYO'),('3520070','3520','PLAOSAN'),('3520071','3520','SIDOREJO'),('3520080','3520','PANEKAN'),('3520090','3520','SUKOMORO'),('3520100','3520','BENDO'),('3520110','3520','MAOSPATI'),('3520120','3520','KARANGREJO'),('3520121','3520','KARAS'),('3520130','3520','BARAT'),('3520131','3520','KARTOHARJO'),('3521010','3521','SINE'),('3521020','3521','NGRAMBE'),('3521030','3521','JOGOROGO'),('3521040','3521','KENDAL'),('3521050','3521','GENENG'),('3521051','3521','GERIH'),('3521060','3521','KWADUNGAN'),('3521070','3521','PANGKUR'),('3521080','3521','KARANGJATI'),('3521090','3521','BRINGIN'),('3521100','3521','PADAS'),('3521101','3521','KASREMAN'),('3521110','3521','NGAWI'),('3521120','3521','PARON'),('3521130','3521','KEDUNGGALAR'),('3521140','3521','PITU'),('3521150','3521','WIDODAREN'),('3521160','3521','MANTINGAN'),('3521170','3521','KARANGANYAR'),('3522010','3522','MARGOMULYO'),('3522020','3522','NGRAHO'),('3522030','3522','TAMBAKREJO'),('3522040','3522','NGAMBON'),('3522041','3522','SEKAR'),('3522050','3522','BUBULAN'),('3522051','3522','GONDANG'),('3522060','3522','TEMAYANG'),('3522070','3522','SUGIHWARAS'),('3522080','3522','KEDUNGADEM'),('3522090','3522','KEPOH BARU'),('3522100','3522','BAURENO'),('3522110','3522','KANOR'),('3522120','3522','SUMBEREJO'),('3522130','3522','BALEN'),('3522140','3522','SUKOSEWU'),('3522150','3522','KAPAS'),('3522160','3522','BOJONEGORO'),('3522170','3522','TRUCUK'),('3522180','3522','DANDER'),('3522190','3522','NGASEM'),('3522191','3522','GAYAM'),('3522200','3522','KALITIDU'),('3522210','3522','MALO'),('3522220','3522','PURWOSARI'),('3522230','3522','PADANGAN'),('3522240','3522','KASIMAN'),('3522241','3522','KEDEWAN'),('3523010','3523','KENDURUAN'),('3523020','3523','BANGILAN'),('3523030','3523','SENORI'),('3523040','3523','SINGGAHAN'),('3523050','3523','MONTONG'),('3523060','3523','PARENGAN'),('3523070','3523','SOKO'),('3523080','3523','RENGEL'),('3523081','3523','GRABAGAN'),('3523090','3523','PLUMPANG'),('3523100','3523','WIDANG'),('3523110','3523','PALANG'),('3523120','3523','SEMANDING'),('3523130','3523','TUBAN'),('3523140','3523','JENU'),('3523150','3523','MERAKURAK'),('3523160','3523','KEREK'),('3523170','3523','TAMBAKBOYO'),('3523180','3523','JATIROGO'),('3523190','3523','BANCAR'),('3524010','3524','SUKORAME'),('3524020','3524','BLULUK'),('3524030','3524','NGIMBANG'),('3524040','3524','SAMBENG'),('3524050','3524','MANTUP'),('3524060','3524','KEMBANGBAHU'),('3524070','3524','SUGIO'),('3524080','3524','KEDUNGPRING'),('3524090','3524','MODO'),('3524100','3524','BABAT'),('3524110','3524','PUCUK'),('3524120','3524','SUKODADI'),('3524130','3524','LAMONGAN'),('3524140','3524','TIKUNG'),('3524141','3524','SARIREJO'),('3524150','3524','DEKET'),('3524160','3524','GLAGAH'),('3524170','3524','KARANGBINANGUN'),('3524180','3524','TURI'),('3524190','3524','KALITENGAH'),('3524200','3524','KARANG GENENG'),('3524210','3524','SEKARAN'),('3524220','3524','MADURAN'),('3524230','3524','LAREN'),('3524240','3524','SOLOKURO'),('3524250','3524','PACIRAN'),('3524260','3524','BRONDONG'),('3525010','3525','WRINGINANOM'),('3525020','3525','DRIYOREJO'),('3525030','3525','KEDAMEAN'),('3525040','3525','MENGANTI'),('3525050','3525','CERME'),('3525060','3525','BENJENG'),('3525070','3525','BALONGPANGGANG'),('3525080','3525','DUDUKSAMPEYAN'),('3525090','3525','KEBOMAS'),('3525100','3525','GRESIK'),('3525110','3525','MANYAR'),('3525120','3525','BUNGAH'),('3525130','3525','SIDAYU'),('3525140','3525','DUKUN'),('3525150','3525','PANCENG'),('3525160','3525','UJUNGPANGKAH'),('3525170','3525','SANGKAPURA'),('3525180','3525','TAMBAK'),('3526010','3526','KAMAL'),('3526020','3526','LABANG'),('3526030','3526','KWANYAR'),('3526040','3526','MODUNG'),('3526050','3526','BLEGA'),('3526060','3526','KONANG'),('3526070','3526','GALIS'),('3526080','3526','TANAH MERAH'),('3526090','3526','TRAGAH'),('3526100','3526','SOCAH'),('3526110','3526','BANGKALAN'),('3526120','3526','BURNEH'),('3526130','3526','AROSBAYA'),('3526140','3526','GEGER'),('3526150','3526','KOKOP'),('3526160','3526','TANJUNGBUMI'),('3526170','3526','SEPULU'),('3526180','3526','KLAMPIS'),('3527010','3527','SRESEH'),('3527020','3527','TORJUN'),('3527021','3527','PANGARENGAN'),('3527030','3527','SAMPANG'),('3527040','3527','CAMPLONG'),('3527050','3527','OMBEN'),('3527060','3527','KEDUNGDUNG'),('3527070','3527','JRENGIK'),('3527080','3527','TAMBELANGAN'),('3527090','3527','BANYUATES'),('3527100','3527','ROBATAL'),('3527101','3527','KARANG PENANG'),('3527110','3527','KETAPANG'),('3527120','3527','SOKOBANAH'),('3528010','3528','TLANAKAN'),('3528020','3528','PADEMAWU'),('3528030','3528','GALIS'),('3528040','3528','LARANGAN'),('3528050','3528','PAMEKASAN'),('3528060','3528','PROPPO'),('3528070','3528','PALENGAAN'),('3528080','3528','PEGANTENAN'),('3528090','3528','KADUR'),('3528100','3528','PAKONG'),('3528110','3528','WARU'),('3528120','3528','BATU MARMAR'),('3528130','3528','PASEAN'),('3529010','3529','PRAGAAN'),('3529020','3529','BLUTO'),('3529030','3529','SARONGGI'),('3529040','3529','GILIGENTENG'),('3529050','3529','TALANGO'),('3529060','3529','KALIANGET'),('3529070','3529','KOTA SUMENEP'),('3529071','3529','BATUAN'),('3529080','3529','LENTENG'),('3529090','3529','GANDING'),('3529100','3529','GULUK GULUK'),('3529110','3529','PASONGSONGAN'),('3529120','3529','AMBUNTEN'),('3529130','3529','RUBARU'),('3529140','3529','DASUK'),('3529150','3529','MANDING'),('3529160','3529','BATUPUTIH'),('3529170','3529','GAPURA'),('3529180','3529','BATANG BATANG'),('3529190','3529','DUNGKEK'),('3529200','3529','NONGGUNONG'),('3529210','3529','GAYAM'),('3529220','3529','RAAS'),('3529230','3529','SAPEKEN'),('3529240','3529','ARJASA'),('3529241','3529','KANGAYAN'),('3529250','3529','MASALEMBU'),('3571010','3571','MOJOROTO'),('3571020','3571','KOTA KEDIRI'),('3571030','3571','PESANTREN'),('3572010','3572','SUKOREJO'),('3572020','3572','KEPANJENKIDUL'),('3572030','3572','SANANWETAN'),('3573010','3573','KEDUNGKANDANG'),('3573020','3573','SUKUN'),('3573030','3573','KLOJEN'),('3573040','3573','BLIMBING'),('3573050','3573','LOWOKWARU'),('3574010','3574','KADEMANGAN'),('3574011','3574','KEDOPOK'),('3574020','3574','WONOASIH'),('3574030','3574','MAYANGAN'),('3574031','3574','KANIGARAN'),('3575010','3575','GADINGREJO'),('3575020','3575','PURWOREJO'),('3575030','3575','BUGULKIDUL'),('3575031','3575','PANGGUNGREJO'),('3576010','3576','PRAJURIT KULON'),('3576020','3576','MAGERSARI'),('3576021','3576','KRANGGAN'),('3577010','3577','MANGU HARJO'),('3577020','3577','TAMAN'),('3577030','3577','KARTOHARJO'),('3578010','3578','KARANG PILANG'),('3578020','3578','JAMBANGAN'),('3578030','3578','GAYUNGAN'),('3578040','3578','WONOCOLO'),('3578050','3578','TENGGILIS MEJOYO'),('3578060','3578','GUNUNG ANYAR'),('3578070','3578','RUNGKUT'),('3578080','3578','SUKOLILO'),('3578090','3578','MULYOREJO'),('3578100','3578','GUBENG'),('3578110','3578','WONOKROMO'),('3578120','3578','DUKUH PAKIS'),('3578130','3578','WIYUNG'),('3578140','3578','LAKARSANTRI'),('3578141','3578','SAMBIKEREP'),('3578150','3578','TANDES'),('3578160','3578','SUKO MANUNGGAL'),('3578170','3578','SAWAHAN'),('3578180','3578','TEGALSARI'),('3578190','3578','GENTENG'),('3578200','3578','TAMBAKSARI'),('3578210','3578','KENJERAN'),('3578211','3578','BULAK'),('3578220','3578','SIMOKERTO'),('3578230','3578','SEMAMPIR'),('3578240','3578','PABEAN CANTIAN'),('3578250','3578','BUBUTAN'),('3578260','3578','KREMBANGAN'),('3578270','3578','ASEMROWO'),('3578280','3578','BENOWO'),('3578281','3578','PAKAL'),('3579010','3579','BATU'),('3579020','3579','JUNREJO'),('3579030','3579','BUMIAJI'),('3601010','3601','SUMUR'),('3601020','3601','CIMANGGU'),('3601030','3601','CIBALIUNG'),('3601031','3601','CIBITUNG'),('3601040','3601','CIKEUSIK'),('3601050','3601','CIGEULIS'),('3601060','3601','PANIMBANG'),('3601061','3601','SOBANG'),('3601070','3601','MUNJUL'),('3601071','3601','ANGSANA'),('3601072','3601','SINDANGRESMI'),('3601080','3601','PICUNG'),('3601090','3601','BOJONG'),('3601100','3601','SAKETI'),('3601101','3601','CISATA'),('3601110','3601','PAGELARAN'),('3601111','3601','PATIA'),('3601112','3601','SUKARESMI'),('3601120','3601','LABUAN'),('3601121','3601','CARITA'),('3601130','3601','JIPUT'),('3601131','3601','CIKEDAL'),('3601140','3601','MENES'),('3601141','3601','PULOSARI'),('3601150','3601','MANDALAWANGI'),('3601160','3601','CIMANUK'),('3601161','3601','CIPEUCANG'),('3601170','3601','BANJAR'),('3601171','3601','KADUHEJO'),('3601172','3601','MEKARJAYA'),('3601180','3601','PANDEGLANG'),('3601181','3601','MAJASARI'),('3601190','3601','CADASARI'),('3601191','3601','KARANGTANJUNG'),('3601192','3601','KORONCONG'),('3602010','3602','MALINGPING'),('3602011','3602','WANASALAM'),('3602020','3602','PANGGARANGAN'),('3602021','3602','CIHARA'),('3602030','3602','BAYAH'),('3602031','3602','CILOGRANG'),('3602040','3602','CIBEBER'),('3602050','3602','CIJAKU'),('3602051','3602','CIGEMBLONG'),('3602060','3602','BANJARSARI'),('3602070','3602','CILELES'),('3602080','3602','GUNUNG KENCANA'),('3602090','3602','BOJONGMANIK'),('3602091','3602','CIRINTEN'),('3602100','3602','LEUWIDAMAR'),('3602110','3602','MUNCANG'),('3602111','3602','SOBANG'),('3602120','3602','CIPANAS'),('3602121','3602','LEBAKGEDONG'),('3602130','3602','SAJIRA'),('3602140','3602','CIMARGA'),('3602150','3602','CIKULUR'),('3602160','3602','WARUNGGUNUNG'),('3602170','3602','CIBADAK'),('3602180','3602','RANGKASBITUNG'),('3602181','3602','KALANGANYAR'),('3602190','3602','MAJA'),('3602191','3602','CURUGBITUNG'),('3603010','3603','CISOKA'),('3603011','3603','SOLEAR'),('3603020','3603','TIGARAKSA'),('3603021','3603','JAMBE'),('3603030','3603','CIKUPA'),('3603040','3603','PANONGAN'),('3603050','3603','CURUG'),('3603051','3603','KELAPA DUA'),('3603060','3603','LEGOK'),('3603070','3603','PAGEDANGAN'),('3603081','3603','CISAUK'),('3603120','3603','PASARKEMIS'),('3603121','3603','SINDANG JAYA'),('3603130','3603','BALARAJA'),('3603131','3603','JAYANTI'),('3603132','3603','SUKAMULYA'),('3603140','3603','KRESEK'),('3603141','3603','GUNUNG KALER'),('3603150','3603','KRONJO'),('3603151','3603','MEKAR BARU'),('3603160','3603','MAUK'),('3603161','3603','KEMIRI'),('3603162','3603','SUKADIRI'),('3603170','3603','RAJEG'),('3603180','3603','SEPATAN'),('3603181','3603','SEPATAN TIMUR'),('3603190','3603','PAKUHAJI'),('3603200','3603','TELUKNAGA'),('3603210','3603','KOSAMBI'),('3604010','3604','CINANGKA'),('3604020','3604','PADARINCANG'),('3604030','3604','CIOMAS'),('3604040','3604','PABUARAN'),('3604041','3604','GUNUNG SARI'),('3604050','3604','BAROS'),('3604060','3604','PETIR'),('3604061','3604','TUNJUNG TEJA'),('3604080','3604','CIKEUSAL'),('3604090','3604','PAMARAYAN'),('3604091','3604','BANDUNG'),('3604100','3604','JAWILAN'),('3604110','3604','KOPO'),('3604120','3604','CIKANDE'),('3604121','3604','KIBIN'),('3604130','3604','KRAGILAN'),('3604180','3604','WARINGINKURUNG'),('3604190','3604','MANCAK'),('3604200','3604','ANYAR'),('3604210','3604','BOJONEGARA'),('3604211','3604','PULO AMPEL'),('3604220','3604','KRAMATWATU'),('3604240','3604','CIRUAS'),('3604250','3604','PONTANG'),('3604251','3604','LEBAK WANGI'),('3604260','3604','CARENANG'),('3604261','3604','BINUANG'),('3604270','3604','TIRTAYASA'),('3604271','3604','TANARA'),('3671010','3671','CILEDUG'),('3671011','3671','LARANGAN'),('3671012','3671','KARANG TENGAH'),('3671020','3671','CIPONDOH'),('3671021','3671','PINANG'),('3671030','3671','TANGERANG'),('3671031','3671','KARAWACI'),('3671040','3671','JATI UWUNG'),('3671041','3671','CIBODAS'),('3671042','3671','PERIUK'),('3671050','3671','BATUCEPER'),('3671051','3671','NEGLASARI'),('3671060','3671','BENDA'),('3672010','3672','CIWANDAN'),('3672011','3672','CITANGKIL'),('3672020','3672','PULOMERAK'),('3672021','3672','PURWAKARTA'),('3672022','3672','GROGOL'),('3672030','3672','CILEGON'),('3672031','3672','JOMBANG'),('3672040','3672','CIBEBER'),('3673010','3673','CURUG'),('3673020','3673','WALANTAKA'),('3673030','3673','CIPOCOK JAYA'),('3673040','3673','SERANG'),('3673050','3673','TAKTAKAN'),('3673060','3673','KASEMEN'),('3674010','3674','SETU'),('3674020','3674','SERPONG'),('3674030','3674','PAMULANG'),('3674040','3674','CIPUTAT'),('3674050','3674','CIPUTAT TIMUR'),('3674060','3674','PONDOK AREN'),('3674070','3674','SERPONG UTARA'),('5101010','5101','MELAYA'),('5101020','5101','NEGARA'),('5101021','5101','JEMBRANA'),('5101030','5101','MENDOYO'),('5101040','5101','PEKUTATAN'),('5102010','5102','SELEMADEG'),('5102011','5102','SELEMADEG TIMUR'),('5102012','5102','SELEMADEG BARAT'),('5102020','5102','KERAMBITAN'),('5102030','5102','TABANAN'),('5102040','5102','KEDIRI'),('5102050','5102','MARGA'),('5102060','5102','BATURITI'),('5102070','5102','PENEBEL'),('5102080','5102','PUPUAN'),('5103010','5103','KUTA SELATAN'),('5103020','5103','KUTA'),('5103030','5103','KUTA UTARA'),('5103040','5103','MENGWI'),('5103050','5103','ABIANSEMAL'),('5103060','5103','PETANG'),('5104010','5104','SUKAWATI'),('5104020','5104','BLAHBATUH'),('5104030','5104','GIANYAR'),('5104040','5104','TAMPAKSIRING'),('5104050','5104','UBUD'),('5104060','5104','TEGALLALANG'),('5104070','5104','PAYANGAN'),('5105010','5105','NUSAPENIDA'),('5105020','5105','BANJARANGKAN'),('5105030','5105','KLUNGKUNG'),('5105040','5105','DAWAN'),('5106010','5106','SUSUT'),('5106020','5106','BANGLI'),('5106030','5106','TEMBUKU'),('5106040','5106','KINTAMANI'),('5107010','5107','RENDANG'),('5107020','5107','SIDEMEN'),('5107030','5107','MANGGIS'),('5107040','5107','KARANGASEM'),('5107050','5107','ABANG'),('5107060','5107','BEBANDEM'),('5107070','5107','SELAT'),('5107080','5107','KUBU'),('5108010','5108','GEROKGAK'),('5108020','5108','SERIRIT'),('5108030','5108','BUSUNGBIU'),('5108040','5108','BANJAR'),('5108050','5108','SUKASADA'),('5108060','5108','BULELENG'),('5108070','5108','SAWAN'),('5108080','5108','KUBUTAMBAHAN'),('5108090','5108','TEJAKULA'),('5171010','5171','DENPASAR SELATAN'),('5171020','5171','DENPASAR TIMUR'),('5171030','5171','DENPASAR BARAT'),('5171031','5171','DENPASAR UTARA'),('5201010','5201','SEKOTONG'),('5201011','5201','LEMBAR'),('5201020','5201','GERUNG'),('5201030','5201','LABU API'),('5201040','5201','KEDIRI'),('5201041','5201','KURIPAN'),('5201050','5201','NARMADA'),('5201051','5201','LINGSAR'),('5201060','5201','GUNUNG SARI'),('5201061','5201','BATU LAYAR'),('5202010','5202','PRAYA BARAT'),('5202011','5202','PRAYA BARAT DAYA'),('5202020','5202','PUJUT'),('5202030','5202','PRAYA TIMUR'),('5202040','5202','JANAPRIA'),('5202050','5202','KOPANG'),('5202060','5202','PRAYA'),('5202061','5202','PRAYA TENGAH'),('5202070','5202','JONGGAT'),('5202080','5202','PRINGGARATA'),('5202090','5202','BATUKLIANG'),('5202091','5202','BATUKLIANG UTARA'),('5203010','5203','KERUAK'),('5203011','5203','JEROWARU'),('5203020','5203','SAKRA'),('5203021','5203','SAKRA BARAT'),('5203022','5203','SAKRA TIMUR'),('5203030','5203','TERARA'),('5203031','5203','MONTONG GADING'),('5203040','5203','SIKUR'),('5203050','5203','MASBAGIK'),('5203051','5203','PRINGGASELA'),('5203060','5203','SUKAMULIA'),('5203061','5203','SURALAGA'),('5203070','5203','SELONG'),('5203071','5203','LABUHAN HAJI'),('5203080','5203','PRINGGABAYA'),('5203081','5203','SUELA'),('5203090','5203','AIKMEL'),('5203091','5203','WANASABA'),('5203092','5203','SEMBALUN'),('5203100','5203','SAMBELIA'),('5204020','5204','LUNYUK'),('5204021','5204','ORONG TELU'),('5204050','5204','ALAS'),('5204051','5204','ALAS BARAT'),('5204052','5204','BUER'),('5204061','5204','UTAN'),('5204062','5204','RHEE'),('5204070','5204','BATULANTEH'),('5204080','5204','SUMBAWA'),('5204081','5204','LABUHAN BADAS'),('5204082','5204','UNTER IWES'),('5204090','5204','MOYOHILIR'),('5204091','5204','MOYO UTARA'),('5204100','5204','MOYOHULU'),('5204110','5204','ROPANG'),('5204111','5204','LENANGGUAR'),('5204112','5204','LANTUNG'),('5204121','5204','LAPE'),('5204122','5204','LOPOK'),('5204130','5204','PLAMPANG'),('5204131','5204','LABANGKA'),('5204132','5204','MARONGE'),('5204140','5204','EMPANG'),('5204141','5204','TARANO'),('5205010','5205','HU\'U'),('5205011','5205','PAJO'),('5205020','5205','DOMPU'),('5205030','5205','WOJA'),('5205040','5205','KILO'),('5205050','5205','KEMPO'),('5205051','5205','MANGGALEWA'),('5205060','5205','PEKAT'),('5206010','5206','MONTA'),('5206011','5206','PARADO'),('5206020','5206','BOLO'),('5206021','5206','MADA PANGGA'),('5206030','5206','WOHA'),('5206040','5206','BELO'),('5206041','5206','PALIBELO'),('5206050','5206','WAWO'),('5206051','5206','LANGGUDU'),('5206052','5206','LAMBITU'),('5206060','5206','SAPE'),('5206061','5206','LAMBU'),('5206070','5206','WERA'),('5206071','5206','AMBALAWI'),('5206080','5206','DONGGO'),('5206081','5206','SOROMANDI'),('5206090','5206','SANGGAR'),('5206091','5206','TAMBORA'),('5207010','5207','SEKONGKANG'),('5207020','5207','JEREWEH'),('5207021','5207','MALUK'),('5207030','5207','TALIWANG'),('5207031','5207','BRANG ENE'),('5207040','5207','BRANG REA'),('5207050','5207','SETELUK'),('5207051','5207','POTO TANO'),('5208010','5208','PEMENANG'),('5208020','5208','TANJUNG'),('5208030','5208','GANGGA'),('5208040','5208','KAYANGAN'),('5208050','5208','BAYAN'),('5271010','5271','AMPENAN'),('5271011','5271','SEKARBELA'),('5271020','5271','MATARAM'),('5271021','5271','SELAPARANG'),('5271030','5271','CAKRANEGARA'),('5271031','5271','SANDUBAYA'),('5272010','5272','RASANAE BARAT'),('5272011','5272','MPUNDA'),('5272020','5272','RASANAE TIMUR'),('5272021','5272','RABA'),('5272030','5272','ASAKOTA'),('5301021','5301','LAMBOYA'),('5301022','5301','WANOKAKA'),('5301023','5301','LABOYA BARAT'),('5301050','5301','LOLI'),('5301060','5301','KOTA WAIKABUBAK'),('5301072','5301','TANA RIGHU'),('5302010','5302','LEWA'),('5302011','5302','NGGAHA ORIANGU'),('5302012','5302','LEWA TIDAHU'),('5302013','5302','KATALA HAMU LINGU'),('5302020','5302','TABUNDUNG'),('5302021','5302','PINUPAHAR'),('5302030','5302','PABERIWAI'),('5302031','5302','KARERA'),('5302032','5302','MATAWAI LA PAWU'),('5302033','5302','KAHAUNGU ETI'),('5302034','5302','MAHU'),('5302035','5302','NGADU NGALA'),('5302040','5302','PAHUNGA LODU'),('5302041','5302','WULA WAIJELU'),('5302051','5302','RINDI'),('5302052','5302','UMALULU'),('5302060','5302','PANDAWAI'),('5302061','5302','KAMBATA MAPAMBUHANG'),('5302070','5302','KOTA WAINGAPU'),('5302071','5302','KAMBERA'),('5302080','5302','HAHARU'),('5302081','5302','KANATANG'),('5303100','5303','SEMAU'),('5303101','5303','SEMAU SELATAN'),('5303110','5303','KUPANG BARAT'),('5303111','5303','NEKAMESE'),('5303120','5303','KUPANG TENGAH'),('5303121','5303','TAEBENU'),('5303130','5303','AMARASI'),('5303131','5303','AMARASI BARAT'),('5303132','5303','AMARASI SELATAN'),('5303133','5303','AMARASI TIMUR'),('5303140','5303','KUPANG TIMUR'),('5303141','5303','AMABI OEFETO TIMUR'),('5303142','5303','AMABI OEFETO'),('5303150','5303','SULAMU'),('5303160','5303','FATULEU'),('5303161','5303','FATULEU TENGAH'),('5303162','5303','FATULEU BARAT'),('5303170','5303','TAKARI'),('5303180','5303','AMFOANG SELATAN'),('5303181','5303','AMFOANG BARAT DAYA'),('5303182','5303','AMFOANG TENGAH'),('5303190','5303','AMFOANG UTARA'),('5303191','5303','AMFOANG BARAT LAUT'),('5303192','5303','AMFOANG TIMUR'),('5304010','5304','MOLLO UTARA'),('5304011','5304','FATUMNASI'),('5304012','5304','TOBU'),('5304013','5304','NUNBENA'),('5304020','5304','MOLLO SELATAN'),('5304021','5304','POLEN'),('5304022','5304','MOLLO BARAT'),('5304023','5304','MOLLO TENGAH'),('5304030','5304','KOTA SOE'),('5304040','5304','AMANUBAN BARAT'),('5304041','5304','BATU PUTIH'),('5304042','5304','KUATNANA'),('5304050','5304','AMANUBAN SELATAN'),('5304051','5304','NOEBEBA'),('5304060','5304','KUAN FATU'),('5304061','5304','KUALIN'),('5304070','5304','AMANUBAN TENGAH'),('5304071','5304','KOLBANO'),('5304072','5304','OENINO'),('5304080','5304','AMANUBAN TIMUR'),('5304081','5304','FAUTMOLO'),('5304082','5304','FATUKOPA'),('5304090','5304','KIE'),('5304091','5304','KOT\'OLIN'),('5304100','5304','AMANATUN SELATAN'),('5304101','5304','BOKING'),('5304102','5304','NUNKOLO'),('5304103','5304','NOEBANA'),('5304104','5304','SANTIAN'),('5304110','5304','AMANATUN UTARA'),('5304111','5304','TOIANAS'),('5304112','5304','KOKBAUN'),('5305010','5305','MIOMAFFO BARAT'),('5305011','5305','MIOMAFFO TENGAH'),('5305012','5305','MUSI'),('5305013','5305','MUTIS'),('5305020','5305','MIOMAFFO TIMUR'),('5305021','5305','NOEMUTI'),('5305022','5305','BIKOMI SELATAN'),('5305023','5305','BIKOMI TENGAH'),('5305024','5305','BIKOMI NILULAT'),('5305025','5305','BIKOMI UTARA'),('5305026','5305','NAIBENU'),('5305027','5305','NOEMUTI TIMUR'),('5305030','5305','KOTA KEFAMENANU'),('5305040','5305','INSANA'),('5305041','5305','INSANA UTARA'),('5305042','5305','INSANA BARAT'),('5305043','5305','INSANA TENGAH'),('5305044','5305','INSANA FAFINESU'),('5305050','5305','BIBOKI SELATAN'),('5305051','5305','BIBOKI TANPAH'),('5305052','5305','BIBOKI MOENLEU'),('5305060','5305','BIBOKI UTARA'),('5305061','5305','BIBOKI ANLEU'),('5305062','5305','BIBOKI FEOTLEU'),('5306032','5306','RAI MANUK'),('5306050','5306','TASIFETO BARAT'),('5306051','5306','KAKULUK MESAK'),('5306052','5306','NANAET DUBESI'),('5306060','5306','ATAMBUA'),('5306061','5306','ATAMBUA BARAT'),('5306062','5306','ATAMBUA SELATAN'),('5306070','5306','TASIFETO TIMUR'),('5306071','5306','RAIHAT'),('5306072','5306','LASIOLAT'),('5306080','5306','LAMAKNEN'),('5306081','5306','LAMAKNEN SELATAN'),('5307010','5307','PANTAR'),('5307011','5307','PANTAR BARAT'),('5307012','5307','PANTAR TIMUR'),('5307013','5307','PANTAR BARAT LAUT'),('5307014','5307','PANTAR TENGAH'),('5307020','5307','ALOR BARAT DAYA'),('5307021','5307','MATARU'),('5307030','5307','ALOR SELATAN'),('5307040','5307','ALOR TIMUR'),('5307041','5307','ALOR TIMUR LAUT'),('5307042','5307','PUREMAN'),('5307050','5307','TELUK MUTIARA'),('5307051','5307','KABOLA'),('5307060','5307','ALOR BARAT LAUT'),('5307061','5307','ALOR TENGAH UTARA'),('5307062','5307','PULAU PURA'),('5307063','5307','LEMBUR'),('5308010','5308','NAGAWUTUNG'),('5308011','5308','WULANDONI'),('5308020','5308','ATADEI'),('5308030','5308','ILE APE'),('5308031','5308','ILE APE TIMUR'),('5308040','5308','LEBATUKAN'),('5308050','5308','NUBATUKAN'),('5308060','5308','OMESURI'),('5308070','5308','BUYASARI'),('5309010','5309','WULANGGITANG'),('5309011','5309','TITEHENA'),('5309012','5309','ILEBURA'),('5309020','5309','TANJUNG BUNGA'),('5309021','5309','LEWO LEMA'),('5309030','5309','LARANTUKA'),('5309031','5309','ILE MANDIRI'),('5309032','5309','DEMON PAGONG'),('5309040','5309','SOLOR BARAT'),('5309041','5309','SOLOR SELATAN'),('5309050','5309','SOLOR TIMUR'),('5309060','5309','ADONARA BARAT'),('5309061','5309','WOTAN ULU MADO'),('5309062','5309','ADONARA TENGAH'),('5309070','5309','ADONARA TIMUR'),('5309071','5309','ILE BOLENG'),('5309072','5309','WITIHAMA'),('5309073','5309','KELUBAGOLIT'),('5309074','5309','ADONARA'),('5310010','5310','PAGA'),('5310011','5310','MEGO'),('5310012','5310','TANA WAWO'),('5310020','5310','LELA'),('5310030','5310','BOLA'),('5310031','5310','DORENG'),('5310032','5310','MAPITARA'),('5310040','5310','TALIBURA'),('5310041','5310','WAIGETE'),('5310042','5310','WAIBLAMA'),('5310050','5310','KEWAPANTE'),('5310051','5310','HEWOKLOANG'),('5310052','5310','KANGAE'),('5310061','5310','PALUE'),('5310062','5310','KOTING'),('5310063','5310','NELLE'),('5310070','5310','NITA'),('5310071','5310','MAGEPANDA'),('5310080','5310','ALOK'),('5310081','5310','ALOK BARAT'),('5310082','5310','ALOK TIMUR'),('5311010','5311','NANGAPANDA'),('5311011','5311','PULAU ENDE'),('5311012','5311','MAUKARO'),('5311020','5311','ENDE'),('5311030','5311','ENDE SELATAN'),('5311031','5311','ENDE TIMUR'),('5311032','5311','ENDE TENGAH'),('5311033','5311','ENDE UTARA'),('5311040','5311','NDONA'),('5311041','5311','NDONA TIMUR'),('5311050','5311','WOLOWARU'),('5311051','5311','WOLOJITA'),('5311052','5311','LIO TIMUR'),('5311053','5311','KELIMUTU'),('5311054','5311','NDORI'),('5311060','5311','MAUROLE'),('5311061','5311','KOTABARU'),('5311062','5311','DETUKELI'),('5311063','5311','LEPEMBUSU KELISOKE'),('5311070','5311','DETUSOKO'),('5311071','5311','WEWARIA'),('5312010','5312','AIMERE'),('5312011','5312','JEREBUU'),('5312012','5312','INERIE'),('5312020','5312','BAJAWA'),('5312030','5312','GOLEWA'),('5312031','5312','GOLEWA SELATAN'),('5312032','5312','GOLEWA BARAT'),('5312070','5312','BAJAWA UTARA'),('5312071','5312','SOA'),('5312080','5312','RIUNG'),('5312081','5312','RIUNG BARAT'),('5312082','5312','WOLOMEZE'),('5313040','5313','SATAR MESE'),('5313041','5313','SATAR MESE BARAT'),('5313042','5313','SATAR MESE UTARA'),('5313110','5313','LANGKE REMBONG'),('5313120','5313','RUTENG'),('5313121','5313','WAE RII'),('5313122','5313','LELAK'),('5313123','5313','RAHONG UTARA'),('5313130','5313','CIBAL'),('5313131','5313','CIBAL BARAT'),('5313140','5313','REOK'),('5313141','5313','REOK BARAT'),('5314010','5314','ROTE BARAT DAYA'),('5314020','5314','ROTE BARAT LAUT'),('5314030','5314','LOBALAIN'),('5314040','5314','ROTE TENGAH'),('5314041','5314','ROTE SELATAN'),('5314050','5314','PANTAI BARU'),('5314060','5314','ROTE TIMUR'),('5314061','5314','LANDU LEKO'),('5314070','5314','ROTE BARAT'),('5314071','5314','NDAO NUSE'),('5315010','5315','KOMODO'),('5315011','5315','BOLENG'),('5315020','5315','SANO NGGOANG'),('5315021','5315','MBELILING'),('5315030','5315','LEMBOR'),('5315031','5315','WELAK'),('5315032','5315','LEMBOR SELATAN'),('5315040','5315','KUWUS'),('5315041','5315','NDOSO'),('5315050','5315','MACANG PACAR'),('5316010','5316','KATIKUTANA'),('5316011','5316','KATIKUTANA SELATAN'),('5316020','5316','UMBU RATU NGGAY BARAT'),('5316030','5316','UMBU RATU NGGAY'),('5316040','5316','MAMBORO'),('5317010','5317','KODI BANGEDO'),('5317011','5317','KODI BALAGHAR'),('5317020','5317','KODI'),('5317030','5317','KODI UTARA'),('5317040','5317','WEWEWA SELATAN'),('5317050','5317','WEWEWA BARAT'),('5317060','5317','WEWEWA TIMUR'),('5317061','5317','WEWEWA TENGAH'),('5317070','5317','WEWEWA UTARA'),('5317080','5317','LOURA'),('5317081','5317','KOTA TAMBOLAKA'),('5318010','5318','MAUPONGGO'),('5318020','5318','KEO TENGAH'),('5318030','5318','NANGARORO'),('5318040','5318','BOAWAE'),('5318050','5318','AESESA SELATAN'),('5318060','5318','AESESA'),('5318070','5318','WOLOWAE'),('5319010','5319','BORONG'),('5319011','5319','RANA MESE'),('5319020','5319','KOTA KOMBA'),('5319030','5319','ELAR'),('5319031','5319','ELAR SELATAN'),('5319040','5319','SAMBI RAMPAS'),('5319050','5319','POCO RANAKA'),('5319051','5319','POCO RANAKA TIMUR'),('5319060','5319','LAMBA LEDA'),('5320010','5320','RAIJUA'),('5320020','5320','HAWU MEHARA'),('5320030','5320','SABU LIAE'),('5320040','5320','SABU BARAT'),('5320050','5320','SABU TENGAH'),('5320060','5320','SABU TIMUR'),('5321010','5321','WEWIKU'),('5321020','5321','MALAKA BARAT'),('5321030','5321','WELIMAN'),('5321040','5321','RINHAT'),('5321050','5321','IO KUFEU'),('5321060','5321','SASITA MEAN'),('5321070','5321','MALAKA TENGAH'),('5321080','5321','BOTIN LEOBELE'),('5321090','5321','LAEN MANEN'),('5321100','5321','MALAKA TIMUR'),('5321110','5321','KOBALIMA'),('5321120','5321','KOBALIMA TIMUR'),('5371010','5371','ALAK'),('5371020','5371','MAULAFA'),('5371030','5371','OEBOBO'),('5371031','5371','KOTA RAJA'),('5371040','5371','KELAPA LIMA'),('5371041','5371','KOTA LAMA'),('6101010','6101','SELAKAU'),('6101011','6101','SELAKAU TIMUR'),('6101020','6101','PEMANGKAT'),('6101021','6101','SEMPARUK'),('6101022','6101','SALATIGA'),('6101030','6101','TEBAS'),('6101031','6101','TEKARANG'),('6101040','6101','SAMBAS'),('6101041','6101','SUBAH'),('6101042','6101','SEBAWI'),('6101043','6101','SAJAD'),('6101050','6101','JAWAI'),('6101051','6101','JAWAI SELATAN'),('6101060','6101','TELUK KERAMAT'),('6101061','6101','GALING'),('6101062','6101','TANGARAN'),('6101070','6101','SEJANGKUNG'),('6101080','6101','SAJINGAN BESAR'),('6101090','6101','PALOH'),('6102010','6102','SUNGAI RAYA'),('6102011','6102','CAPKALA'),('6102012','6102','SUNGAI RAYA KEPULAUAN'),('6102030','6102','SAMALANTAN'),('6102031','6102','MONTERADO'),('6102032','6102','LEMBAH BAWANG'),('6102040','6102','BENGKAYANG'),('6102041','6102','TERIAK'),('6102042','6102','SUNGAI BETUNG'),('6102050','6102','LEDO'),('6102051','6102','SUTI SEMARANG'),('6102052','6102','LUMAR'),('6102060','6102','SANGGAU LEDO'),('6102061','6102','TUJUHBELAS'),('6102070','6102','SELUAS'),('6102080','6102','JAGOI BABANG'),('6102081','6102','SIDING'),('6103020','6103','SEBANGKI'),('6103030','6103','NGABANG'),('6103031','6103','JELIMPO'),('6103040','6103','SENGAH TEMILA'),('6103050','6103','MANDOR'),('6103060','6103','MENJALIN'),('6103070','6103','MEMPAWAH HULU'),('6103071','6103','SOMPAK'),('6103080','6103','MENYUKE'),('6103081','6103','BANYUKE HULU'),('6103090','6103','MERANTI'),('6103100','6103','KUALA BEHE'),('6103110','6103','AIR BESAR'),('6104080','6104','SIANTAN'),('6104081','6104','SEGEDONG'),('6104090','6104','SUNGAI PINYUH'),('6104091','6104','ANJONGAN'),('6104100','6104','MEMPAWAH HILIR'),('6104101','6104','MEMPAWAH TIMUR'),('6104110','6104','SUNGAI KUNYIT'),('6104120','6104','TOHO'),('6104121','6104','SADANIANG'),('6105010','6105','TOBA'),('6105020','6105','MELIAU'),('6105060','6105','KAPUAS'),('6105070','6105','MUKOK'),('6105120','6105','JANGKANG'),('6105130','6105','BONTI'),('6105140','6105','PARINDU'),('6105150','6105','TAYAN HILIR'),('6105160','6105','BALAI'),('6105170','6105','TAYAN HULU'),('6105180','6105','KEMBAYAN'),('6105190','6105','BEDUWAI'),('6105200','6105','NOYAN'),('6105210','6105','SEKAYAM'),('6105220','6105','ENTIKONG'),('6106010','6106','KENDAWANGAN'),('6106020','6106','MANIS MATA'),('6106030','6106','MARAU'),('6106031','6106','SINGKUP'),('6106032','6106','AIR UPAS'),('6106040','6106','JELAI HULU'),('6106050','6106','TUMBANG TITI'),('6106051','6106','PEMAHAN'),('6106052','6106','SUNGAI MELAYU RAYAK'),('6106060','6106','MATAN HILIR SELATAN'),('6106061','6106','BENUA KAYONG'),('6106070','6106','MATAN HILIR UTARA'),('6106071','6106','DELTA PAWAN'),('6106072','6106','MUARA PAWAN'),('6106090','6106','NANGA TAYAP'),('6106100','6106','SANDAI'),('6106101','6106','HULU SUNGAI'),('6106110','6106','SUNGAI LAUR'),('6106120','6106','SIMPANG HULU'),('6106121','6106','SIMPANG DUA'),('6107060','6107','SERAWAI'),('6107070','6107','AMBALAU'),('6107080','6107','KAYAN HULU'),('6107110','6107','SEPAUK'),('6107120','6107','TEMPUNAK'),('6107130','6107','SUNGAI TEBELIAN'),('6107140','6107','SINTANG'),('6107150','6107','DEDAI'),('6107160','6107','KAYAN HILIR'),('6107170','6107','KELAM PERMAI'),('6107180','6107','BINJAI HULU'),('6107190','6107','KETUNGAU HILIR'),('6107200','6107','KETUNGAU TENGAH'),('6107210','6107','KETUNGAU HULU'),('6108010','6108','SILAT HILIR'),('6108020','6108','SILAT HULU'),('6108030','6108','HULU GURUNG'),('6108040','6108','BUNUT HULU'),('6108050','6108','MENTEBAH'),('6108060','6108','BIKA'),('6108070','6108','KALIS'),('6108080','6108','PUTUSSIBAU SELATAN'),('6108090','6108','EMBALOH HILIR'),('6108100','6108','BUNUT HILIR'),('6108110','6108','BOYAN TANJUNG'),('6108120','6108','PENGKADAN'),('6108130','6108','JONGKONG'),('6108140','6108','SELIMBAU'),('6108150','6108','SUHAID'),('6108160','6108','SEBERUANG'),('6108170','6108','SEMITAU'),('6108180','6108','EMPANANG'),('6108190','6108','PURING KENCANA'),('6108200','6108','BADAU'),('6108210','6108','BATANG LUPAR'),('6108220','6108','EMBALOH HULU'),('6108230','6108','PUTUSSIBAU UTARA'),('6109010','6109','NANGA MAHAP'),('6109020','6109','NANGA TAMAN'),('6109030','6109','SEKADAU HULU'),('6109040','6109','SEKADAU HILIR'),('6109050','6109','BELITANG HILIR'),('6109060','6109','BELITANG'),('6109070','6109','BELITANG HULU'),('6110010','6110','SOKAN'),('6110020','6110','TANAH PINOH'),('6110021','6110','TANAH PINOH BARAT'),('6110030','6110','SAYAN'),('6110040','6110','BELIMBING'),('6110041','6110','BELIMBING HULU'),('6110050','6110','NANGA PINOH'),('6110051','6110','PINOH SELATAN'),('6110052','6110','PINOH UTARA'),('6110060','6110','ELLA HILIR'),('6110070','6110','MENUKUNG'),('6111010','6111','PULAU MAYA'),('6111011','6111','KEPULAUAN KARIMATA'),('6111020','6111','SUKADANA'),('6111030','6111','SIMPANG HILIR'),('6111040','6111','TELUK BATANG'),('6111050','6111','SEPONTI'),('6112010','6112','BATU AMPAR'),('6112020','6112','TERENTANG'),('6112030','6112','KUBU'),('6112040','6112','TELOK PA\'KEDAI'),('6112050','6112','SUNGAI KAKAP'),('6112060','6112','RASAU JAYA'),('6112070','6112','SUNGAI RAYA'),('6112080','6112','SUNGAI AMBAWANG'),('6112090','6112','KUALA MANDOR-B'),('6171010','6171','PONTIANAK SELATAN'),('6171011','6171','PONTIANAK TENGGARA'),('6171020','6171','PONTIANAK TIMUR'),('6171030','6171','PONTIANAK BARAT'),('6171031','6171','PONTIANAK KOTA'),('6171040','6171','PONTIANAK UTARA'),('6172010','6172','SINGKAWANG SELATAN'),('6172020','6172','SINGKAWANG TIMUR'),('6172030','6172','SINGKAWANG UTARA'),('6172040','6172','SINGKAWANG BARAT'),('6172050','6172','SINGKAWANG TENGAH'),('6201040','6201','KOTAWARINGIN LAMA'),('6201050','6201','ARUT SELATAN'),('6201060','6201','KUMAI'),('6201061','6201','PANGKALAN BANTENG'),('6201062','6201','PANGKALAN LADA'),('6201070','6201','ARUT UTARA'),('6202020','6202','MENTAYA HILIR SELATAN'),('6202021','6202','TELUK SAMPIT'),('6202050','6202','PULAU HANAUT'),('6202060','6202','MENTAWA BARU/KETAPANG'),('6202061','6202','SERANAU'),('6202070','6202','MENTAYA HILIR UTARA'),('6202110','6202','KOTA BESI'),('6202111','6202','TELAWANG'),('6202120','6202','BAAMANG'),('6202190','6202','CEMPAGA'),('6202191','6202','CEMPAGA HULU'),('6202200','6202','PARENGGEAN'),('6202201','6202','TUALAN HULU'),('6202210','6202','MENTAYA HULU'),('6202211','6202','BUKIT SANTUAI'),('6202230','6202','ANTANG KALANG'),('6202231','6202','TELAGA ANTANG'),('6203020','6203','KAPUAS KUALA'),('6203021','6203','TAMBAN CATUR'),('6203030','6203','KAPUAS TIMUR'),('6203040','6203','SELAT'),('6203041','6203','BATAGUH'),('6203070','6203','BASARANG'),('6203080','6203','KAPUAS HILIR'),('6203090','6203','PULAU PETAK'),('6203100','6203','KAPUAS MURUNG'),('6203101','6203','DADAHUP'),('6203110','6203','KAPUAS BARAT'),('6203150','6203','MANTANGAI'),('6203160','6203','TIMPAH'),('6203170','6203','KAPUAS TENGAH'),('6203171','6203','PASAK TALAWANG'),('6203180','6203','KAPUAS HULU'),('6203181','6203','MANDAU TALAWANG'),('6204010','6204','JENAMAS'),('6204020','6204','DUSUN HILIR'),('6204030','6204','KARAU KUALA'),('6204040','6204','DUSUN SELATAN'),('6204050','6204','DUSUN UTARA'),('6204060','6204','GUNUNG BINTANG AWAI'),('6205010','6205','MONTALLAT'),('6205020','6205','GUNUNG TIMANG'),('6205030','6205','GUNUNG PUREI'),('6205040','6205','TEWEH TIMUR'),('6205050','6205','TEWEH TENGAH'),('6205051','6205','TEWEH  BARU'),('6205052','6205','TEWEH SELATAN'),('6205060','6205','LAHEI'),('6205061','6205','LAHEI BARAT'),('6206010','6206','JELAI'),('6206011','6206','PANTAI LUNCI'),('6206020','6206','SUKAMARA'),('6206030','6206','BALAI RIAM'),('6206031','6206','PERMATA KECUBUNG'),('6207010','6207','BULIK'),('6207011','6207','SEMATU JAYA'),('6207012','6207','MENTHOBI RAYA'),('6207013','6207','BULIK TIMUR'),('6207020','6207','LAMANDAU'),('6207021','6207','BELANTIKAN RAYA'),('6207030','6207','DELANG'),('6207031','6207','BATANGKAWA'),('6208010','6208','SERUYAN HILIR'),('6208011','6208','SERUYAN HILIR TIMUR'),('6208020','6208','DANAU SEMBULUH'),('6208021','6208','SERUYAN RAYA'),('6208030','6208','HANAU'),('6208031','6208','DANAU SELULUK'),('6208040','6208','SERUYAN TENGAH'),('6208041','6208','BATU AMPAR'),('6208050','6208','SERUYAN HULU'),('6208051','6208','SULING TAMBUN'),('6209010','6209','KATINGAN KUALA'),('6209020','6209','MENDAWAI'),('6209030','6209','KAMIPANG'),('6209040','6209','TASIK PAYAWAN'),('6209050','6209','KATINGAN HILIR'),('6209060','6209','TEWANG SANGALANG GARING'),('6209070','6209','PULAU MALAN'),('6209080','6209','KATINGAN TENGAH'),('6209090','6209','SANAMAN MANTIKEI'),('6209091','6209','PETAK MALAI'),('6209100','6209','MARIKIT'),('6209110','6209','KATINGAN HULU'),('6209111','6209','BUKIT RAYA'),('6210010','6210','KAHAYAN KUALA'),('6210011','6210','SEBANGAU KUALA'),('6210020','6210','PANDIH BATU'),('6210030','6210','MALIKU'),('6210040','6210','KAHAYAN HILIR'),('6210041','6210','JABIREN RAYA'),('6210050','6210','KAHAYAN TENGAH'),('6210060','6210','BANAMA TINGANG'),('6211010','6211','MANUHING'),('6211011','6211','MANUHING RAYA'),('6211020','6211','RUNGAN'),('6211021','6211','RUNGAN HULU'),('6211022','6211','RUNGAN BARAT'),('6211030','6211','SEPANG'),('6211031','6211','MIHING RAYA'),('6211040','6211','KURUN'),('6211050','6211','TEWAH'),('6211060','6211','KAHAYAN HULU UTARA'),('6211061','6211','DAMANG BATU'),('6211062','6211','MIRI MANASA'),('6212010','6212','BENUA LIMA'),('6212020','6212','DUSUN TIMUR'),('6212021','6212','PAJU EPAT'),('6212030','6212','AWANG'),('6212040','6212','PATANGKEP TUTUI'),('6212050','6212','DUSUN TENGAH'),('6212051','6212','RAREN BATUAH'),('6212052','6212','PAKU'),('6212053','6212','KARUSEN JANANG'),('6212060','6212','PEMATANG KARAU'),('6213010','6213','PERMATA INTAN'),('6213011','6213','SUNGAI BABUAT'),('6213020','6213','MURUNG'),('6213030','6213','LAUNG TUHUP'),('6213031','6213','BARITO TUHUP RAYA'),('6213040','6213','TANAH SIANG'),('6213041','6213','TANAH SIANG SELATAN'),('6213050','6213','SUMBER BARITO'),('6213051','6213','SERIBU RIAM'),('6213052','6213','UUT MURUNG'),('6271010','6271','PAHANDUT'),('6271011','6271','SABANGAU'),('6271012','6271','JEKAN RAYA'),('6271020','6271','BUKIT BATU'),('6271021','6271','RAKUMPIT'),('6301010','6301','PANYIPATAN'),('6301020','6301','TAKISUNG'),('6301030','6301','KURAU'),('6301031','6301','BUMI MAKMUR'),('6301040','6301','BATI - BATI'),('6301050','6301','TAMBANG ULANG'),('6301060','6301','PELAIHARI'),('6301061','6301','BAJUIN'),('6301070','6301','BATU AMPAR'),('6301080','6301','JORONG'),('6301090','6301','KINTAP'),('6302010','6302','PULAU SEMBILAN'),('6302020','6302','PULAU LAUT BARAT'),('6302021','6302','PULAU LAUT TANJUNG SELAYAR'),('6302030','6302','PULAU LAUT SELATAN'),('6302031','6302','PULAU LAUT KEPULAUAN'),('6302040','6302','PULAU LAUT TIMUR'),('6302050','6302','PULAU SEBUKU'),('6302060','6302','PULAU LAUT UTARA'),('6302061','6302','PULAU LAUT TENGAH'),('6302120','6302','KELUMPANG SELATAN'),('6302121','6302','KELUMPANG HILIR'),('6302130','6302','KELUMPANG HULU'),('6302140','6302','HAMPANG'),('6302150','6302','SUNGAI DURIAN'),('6302160','6302','KELUMPANG TENGAH'),('6302161','6302','KELUMPANG BARAT'),('6302170','6302','KELUMPANG UTARA'),('6302180','6302','PAMUKAN SELATAN'),('6302190','6302','SAMPANAHAN'),('6302200','6302','PAMUKAN UTARA'),('6302201','6302','PAMUKAN BARAT'),('6303010','6303','ALUH - ALUH'),('6303011','6303','BERUNTUNG BARU'),('6303020','6303','GAMBUT'),('6303030','6303','KERTAK HANYAR'),('6303031','6303','TATAH MAKMUR'),('6303040','6303','SUNGAI TABUK'),('6303050','6303','MARTAPURA'),('6303051','6303','MARTAPURA TIMUR'),('6303052','6303','MARTAPURA BARAT'),('6303060','6303','ASTAMBUL'),('6303070','6303','KARANG INTAN'),('6303080','6303','ARANIO'),('6303090','6303','SUNGAI PINANG'),('6303091','6303','PARAMASAN'),('6303100','6303','PENGARON'),('6303101','6303','SAMBUNG MAKMUR'),('6303110','6303','MATARAMAN'),('6303120','6303','SIMPANG EMPAT'),('6303121','6303','TELAGA BAUNTUNG'),('6304010','6304','TABUNGANEN'),('6304020','6304','TAMBAN'),('6304030','6304','MEKAR SARI'),('6304040','6304','ANJIR PASAR'),('6304050','6304','ANJIR MUARA'),('6304060','6304','ALALAK'),('6304070','6304','MANDASTANA'),('6304071','6304','JEJANGKIT'),('6304080','6304','BELAWANG'),('6304090','6304','WANARAYA'),('6304100','6304','BARAMBAI'),('6304110','6304','RANTAU BADAUH'),('6304120','6304','CERBON'),('6304130','6304','BAKUMPAI'),('6304140','6304','MARABAHAN'),('6304150','6304','TABUKAN'),('6304160','6304','KURIPAN'),('6305010','6305','BINUANG'),('6305011','6305','HATUNGUN'),('6305020','6305','TAPIN SELATAN'),('6305021','6305','SALAM BABARIS'),('6305030','6305','TAPIN TENGAH'),('6305040','6305','BUNGUR'),('6305050','6305','PIANI'),('6305060','6305','LOKPAIKAT'),('6305070','6305','TAPIN UTARA'),('6305080','6305','BAKARANGAN'),('6305090','6305','CANDI LARAS SELATAN'),('6305100','6305','CANDI LARAS UTARA'),('6306010','6306','PADANG BATUNG'),('6306020','6306','LOKSADO'),('6306030','6306','TELAGA LANGSAT'),('6306040','6306','ANGKINANG'),('6306050','6306','KANDANGAN'),('6306060','6306','SUNGAI RAYA'),('6306070','6306','SIMPUR'),('6306080','6306','KALUMPANG'),('6306090','6306','DAHA SELATAN'),('6306091','6306','DAHA BARAT'),('6306100','6306','DAHA UTARA'),('6307010','6307','HARUYAN'),('6307020','6307','BATU BENAWA'),('6307030','6307','HANTAKAN'),('6307040','6307','BATANG ALAI SELATAN'),('6307041','6307','BATANG ALAI TIMUR'),('6307050','6307','BARABAI'),('6307060','6307','LABUAN AMAS SELATAN'),('6307070','6307','LABUAN AMAS UTARA'),('6307080','6307','PANDAWAN'),('6307090','6307','BATANG ALAI UTARA'),('6307091','6307','LIMPASU'),('6308010','6308','DANAU PANGGANG'),('6308011','6308','PAMINGGIR'),('6308020','6308','BABIRIK'),('6308030','6308','SUNGAI PANDAN'),('6308031','6308','SUNGAI TABUKAN'),('6308040','6308','AMUNTAI SELATAN'),('6308050','6308','AMUNTAI TENGAH'),('6308060','6308','BANJANG'),('6308070','6308','AMUNTAI UTARA'),('6308071','6308','HAUR GADING'),('6309010','6309','BANUA LAWAS'),('6309020','6309','PUGAAN'),('6309030','6309','KELUA'),('6309040','6309','MUARA HARUS'),('6309050','6309','TANTA'),('6309060','6309','TANJUNG'),('6309070','6309','MURUNG PUDAK'),('6309080','6309','HARUAI'),('6309081','6309','BINTANG ARA'),('6309090','6309','UPAU'),('6309100','6309','MUARA UYA'),('6309110','6309','JARO'),('6310010','6310','KUSAN HILIR'),('6310020','6310','SUNGAI LOBAN'),('6310030','6310','SATUI'),('6310031','6310','ANGSANA'),('6310040','6310','KUSAN HULU'),('6310041','6310','KURANJI'),('6310050','6310','BATU LICIN'),('6310051','6310','KARANG BINTANG'),('6310052','6310','SIMPANG EMPAT'),('6310053','6310','MANTEWE'),('6311010','6311','LAMPIHONG'),('6311020','6311','BATU MANDI'),('6311030','6311','AWAYAN'),('6311031','6311','TEBING TINGGI'),('6311040','6311','PARINGIN'),('6311041','6311','PARINGIN SELATAN'),('6311050','6311','JUAI'),('6311060','6311','HALONG'),('6371010','6371','BANJARMASIN SELATAN'),('6371020','6371','BANJARMASIN TIMUR'),('6371030','6371','BANJARMASIN BARAT'),('6371031','6371','BANJARMASIN TENGAH'),('6371040','6371','BANJARMASIN UTARA'),('6372010','6372','LANDASAN ULIN'),('6372011','6372','LIANG ANGGANG'),('6372020','6372','CEMPAKA'),('6372031','6372','BANJAR BARU UTARA'),('6372032','6372','BANJAR BARU SELATAN'),('6401010','6401','BATU SOPANG'),('6401011','6401','MUARA SAMU'),('6401021','6401','BATU ENGAU'),('6401022','6401','TANJUNG HARAPAN'),('6401030','6401','PASIR BELENGKONG'),('6401040','6401','TANAH GROGOT'),('6401050','6401','KUARO'),('6401060','6401','LONG IKIS'),('6401070','6401','MUARA KOMAM'),('6401080','6401','LONG KALI'),('6402010','6402','BONGAN'),('6402020','6402','JEMPANG'),('6402030','6402','PENYINGGAHAN'),('6402040','6402','MUARA PAHU'),('6402041','6402','SILUQ NGURAI'),('6402050','6402','MUARA LAWA'),('6402051','6402','BENTIAN BESAR'),('6402060','6402','DAMAI'),('6402061','6402','NYUATAN'),('6402070','6402','BARONG TONGKOK'),('6402071','6402','LINGGANG BIGUNG'),('6402080','6402','MELAK'),('6402081','6402','SEKOLAQ DARAT'),('6402082','6402','MANOR BULATN'),('6402090','6402','LONG IRAM'),('6402091','6402','TERING'),('6403010','6403','SEMBOJA'),('6403020','6403','MUARA JAWA'),('6403030','6403','SANGA-SANGA'),('6403040','6403','LOA JANAN'),('6403050','6403','LOA KULU'),('6403060','6403','MUARA MUNTAI'),('6403070','6403','MUARA WIS'),('6403080','6403','KOTABANGUN'),('6403090','6403','TENGGARONG'),('6403100','6403','SEBULU'),('6403110','6403','TENGGARONG SEBERANG'),('6403120','6403','ANGGANA'),('6403130','6403','MUARA BADAK'),('6403140','6403','MARANG KAYU'),('6403150','6403','MUARA KAMAN'),('6403160','6403','KENOHAN'),('6403170','6403','KEMBANG JANGGUT'),('6403180','6403','TABANG'),('6404010','6404','MUARA ANCALONG'),('6404011','6404','BUSANG'),('6404012','6404','LONG MESANGAT'),('6404020','6404','MUARA WAHAU'),('6404021','6404','TELEN'),('6404022','6404','KONGBENG'),('6404030','6404','MUARA BENGKAL'),('6404031','6404','BATU AMPAR'),('6404040','6404','SANGATTA UTARA'),('6404041','6404','BENGALON'),('6404042','6404','TELUK PANDAN'),('6404043','6404','SANGATTA SELATAN'),('6404044','6404','RANTAU PULUNG'),('6404050','6404','SANGKULIRANG'),('6404051','6404','KALIORANG'),('6404052','6404','SANDARAN'),('6404053','6404','KAUBUN'),('6404054','6404','KARANGAN'),('6405010','6405','KELAY'),('6405020','6405','TALISAYAN'),('6405021','6405','TABALAR'),('6405030','6405','BIDUK BIDUK'),('6405040','6405','PULAU DERAWAN'),('6405041','6405','MARATUA'),('6405050','6405','SAMBALIUNG'),('6405060','6405','TANJUNG REDEB'),('6405070','6405','GUNUNG TABUR'),('6405080','6405','SEGAH'),('6405090','6405','TELUK BAYUR'),('6405100','6405','BATU PUTIH'),('6405110','6405','BIATAN'),('6409010','6409','BABULU'),('6409020','6409','WARU'),('6409030','6409','PENAJAM'),('6409040','6409','SEPAKU'),('6411010','6411','LAHAM'),('6411020','6411','LONG HUBUNG'),('6411030','6411','LONG BAGUN'),('6411040','6411','LONG PAHANGAI'),('6411050','6411','LONG APARI'),('6471010','6471','BALIKPAPAN SELATAN'),('6471011','6471','BALIKPAPAN KOTA'),('6471020','6471','BALIKPAPAN TIMUR'),('6471030','6471','BALIKPAPAN UTARA'),('6471040','6471','BALIKPAPAN TENGAH'),('6471050','6471','BALIKPAPAN BARAT'),('6472010','6472','PALARAN'),('6472020','6472','SAMARINDA ILIR'),('6472021','6472','SAMARINDA KOTA'),('6472022','6472','SAMBUTAN'),('6472030','6472','SAMARINDA SEBERANG'),('6472031','6472','LOA JANAN ILIR'),('6472040','6472','SUNGAI KUNJANG'),('6472050','6472','SAMARINDA ULU'),('6472060','6472','SAMARINDA UTARA'),('6472061','6472','SUNGAI PINANG'),('6474010','6474','BONTANG SELATAN'),('6474020','6474','BONTANG UTARA'),('6474030','6474','BONTANG BARAT'),('6501010','6501','SUNGAI BOH'),('6501020','6501','KAYAN SELATAN'),('6501030','6501','KAYAN HULU'),('6501040','6501','KAYAN HILIR'),('6501050','6501','PUJUNGAN'),('6501060','6501','BAHAU HULU'),('6501070','6501','SUNGAI TUBU'),('6501080','6501','MALINAU SELATAN HULU'),('6501090','6501','MALINAU SELATAN'),('6501100','6501','MALINAU SELATAN HILIR'),('6501110','6501','MENTARANG'),('6501120','6501','MENTARANG HULU'),('6501130','6501','MALINAU UTARA'),('6501140','6501','MALINAU BARAT'),('6501150','6501','MALINAU KOTA'),('6502010','6502','PESO'),('6502020','6502','PESO HILIR'),('6502030','6502','TANJUNG PALAS BARAT'),('6502040','6502','TANJUNG PALAS'),('6502050','6502','TANJUNG SELOR'),('6502060','6502','TANJUNG PALAS TIMUR'),('6502070','6502','TANJUNG PALAS TENGAH'),('6502080','6502','TANJUNG PALAS UTARA'),('6502090','6502','SEKATAK'),('6502100','6502','BUNYU'),('6503010','6503','MURUK RIAN'),('6503020','6503','SESAYAP'),('6503030','6503','BETAYAU'),('6503040','6503','SESAYAP HILIR'),('6503050','6503','TANA LIA'),('6504010','6504','KRAYAN SELATAN'),('6504011','6504','KRAYAN TENGAH'),('6504020','6504','KRAYAN'),('6504021','6504','KRAYAN TIMUR'),('6504022','6504','KRAYAN BARAT'),('6504030','6504','LUMBIS OGONG'),('6504040','6504','LUMBIS'),('6504050','6504','SEMBAKUNG ATULAI'),('6504060','6504','SEMBAKUNG'),('6504070','6504','SEBUKU'),('6504080','6504','TULIN ONSOI'),('6504090','6504','SEI MENGGARIS'),('6504100','6504','NUNUKAN'),('6504110','6504','NUNUKAN SELATAN'),('6504120','6504','SEBATIK BARAT'),('6504130','6504','SEBATIK'),('6504140','6504','SEBATIK TIMUR'),('6504150','6504','SEBATIK TENGAH'),('6504160','6504','SEBATIK UTARA'),('6571010','6571','TARAKAN TIMUR'),('6571020','6571','TARAKAN TENGAH'),('6571030','6571','TARAKAN BARAT'),('6571040','6571','TARAKAN UTARA'),('7101021','7101','DUMOGA BARAT'),('7101022','7101','DUMOGA UTARA'),('7101023','7101','DUMOGA TIMUR'),('7101024','7101','DUMOGA TENGAH'),('7101025','7101','DUMOGA TENGGARA'),('7101026','7101','DUMOGA'),('7101060','7101','LOLAYAN'),('7101081','7101','PASSI BARAT'),('7101082','7101','PASSI TIMUR'),('7101083','7101','BILALANG'),('7101090','7101','POIGAR'),('7101100','7101','BOLAANG'),('7101101','7101','BOLAANG TIMUR'),('7101110','7101','LOLAK'),('7101120','7101','SANGTOMBOLANG'),('7102091','7102','LANGOWAN TIMUR'),('7102092','7102','LANGOWAN BARAT'),('7102093','7102','LANGOWAN SELATAN'),('7102094','7102','LANGOWAN UTARA'),('7102110','7102','TOMPASO'),('7102111','7102','TOMPASO BARAT'),('7102120','7102','KAWANGKOAN'),('7102121','7102','KAWANGKOAN BARAT'),('7102122','7102','KAWANGKOAN UTARA'),('7102130','7102','SONDER'),('7102160','7102','TOMBARIRI'),('7102161','7102','TOMBARIRI TIMUR'),('7102170','7102','PINELENG'),('7102171','7102','TOMBULU'),('7102172','7102','MANDOLANG'),('7102190','7102','TONDANO BARAT'),('7102191','7102','TONDANO SELATAN'),('7102200','7102','REMBOKEN'),('7102210','7102','KAKAS'),('7102211','7102','KAKAS BARAT'),('7102220','7102','LEMBEAN TIMUR'),('7102230','7102','ERIS'),('7102240','7102','KOMBI'),('7102250','7102','TONDANO TIMUR'),('7102251','7102','TONDANO UTARA'),('7103040','7103','MANGANITU SELATAN'),('7103041','7103','TATOARENG'),('7103050','7103','TAMAKO'),('7103060','7103','TABUKAN SELATAN'),('7103061','7103','TABUKAN SELATAN TENGAH'),('7103062','7103','TABUKAN SELATAN TENGGARA'),('7103070','7103','TABUKAN TENGAH'),('7103080','7103','MANGANITU'),('7103090','7103','TAHUNA'),('7103091','7103','TAHUNA TIMUR'),('7103092','7103','TAHUNA BARAT'),('7103100','7103','TABUKAN UTARA'),('7103101','7103','NUSA TABUKAN'),('7103102','7103','KEPULAUAN MARORE'),('7103110','7103','KENDAHE'),('7104010','7104','KABARUAN'),('7104011','7104','DAMAU'),('7104020','7104','LIRUNG'),('7104021','7104','SALIBABU'),('7104022','7104','KALONGAN'),('7104023','7104','MORONGE'),('7104030','7104','MELONGUANE'),('7104031','7104','MELONGUANE TIMUR'),('7104040','7104','BEO'),('7104041','7104','BEO UTARA'),('7104042','7104','BEO SELATAN'),('7104050','7104','RAINIS'),('7104051','7104','TAMPA NA\'MMA'),('7104052','7104','PULUTAN'),('7104060','7104','ESSANG'),('7104061','7104','ESSANG SELATAN'),('7104070','7104','GEMEH'),('7104080','7104','NANUSA'),('7104081','7104','MIANGAS'),('7105010','7105','MODOINDING'),('7105020','7105','TOMPASO BARU'),('7105021','7105','MAESAAN'),('7105070','7105','RANOYAPO'),('7105080','7105','MOTOLING'),('7105081','7105','KUMELEMBUAI'),('7105082','7105','MOTOLING BARAT'),('7105083','7105','MOTOLING TIMUR'),('7105090','7105','SINONSAYANG'),('7105100','7105','TENGA'),('7105111','7105','AMURANG'),('7105112','7105','AMURANG BARAT'),('7105113','7105','AMURANG TIMUR'),('7105120','7105','TARERAN'),('7105121','7105','SULTA'),('7105130','7105','TUMPAAN'),('7105131','7105','TATAPAAN'),('7106010','7106','KEMA'),('7106020','7106','KAUDITAN'),('7106030','7106','AIRMADIDI'),('7106040','7106','KALAWAT'),('7106050','7106','DIMEMBE'),('7106051','7106','TALAWAAN'),('7106060','7106','WORI'),('7106070','7106','LIKUPANG BARAT'),('7106080','7106','LIKUPANG TIMUR'),('7106081','7106','LIKUPANG SELATAN'),('7107010','7107','SANGKUB'),('7107020','7107','BINTAUNA'),('7107030','7107','BOLANG ITANG TIMUR'),('7107040','7107','BOLANG ITANG BARAT'),('7107050','7107','KAIDIPANG'),('7107060','7107','PINOGALUMAN'),('7108010','7108','BIARO'),('7108020','7108','TAGULANDANG SELATAN'),('7108030','7108','TAGULANDANG'),('7108040','7108','TAGULANDANG UTARA'),('7108050','7108','SIAU BARAT SELATAN'),('7108060','7108','SIAU TIMUR SELATAN'),('7108070','7108','SIAU BARAT'),('7108080','7108','SIAU TENGAH'),('7108090','7108','SIAU TIMUR'),('7108100','7108','SIAU BARAT UTARA'),('7109010','7109','RATATOTOK'),('7109020','7109','PUSOMAEN'),('7109030','7109','BELANG'),('7109040','7109','RATAHAN'),('7109041','7109','PASAN'),('7109042','7109','RATAHAN TIMUR'),('7109050','7109','TOMBATU'),('7109051','7109','TOMBATU TIMUR'),('7109052','7109','TOMBATU UTARA'),('7109060','7109','TOULUAAN'),('7109061','7109','TOULUAAN SELATAN'),('7109062','7109','SILIAN RAYA'),('7110010','7110','POSIGADAN'),('7110011','7110','TOMINI'),('7110020','7110','BOLANG UKI'),('7110021','7110','HELUMO'),('7110030','7110','PINOLOSIAN'),('7110040','7110','PINOLOSIAN TENGAH'),('7110050','7110','PINOLOSIAN TIMUR'),('7111010','7111','NUANGAN'),('7111011','7111','MOTONGKAD'),('7111020','7111','TUTUYAN'),('7111030','7111','KOTABUNAN'),('7111040','7111','MODAYAG'),('7111041','7111','MOOAT'),('7111050','7111','MODAYAG BARAT'),('7171010','7171','MALALAYANG'),('7171020','7171','SARIO'),('7171021','7171','WANEA'),('7171030','7171','WENANG'),('7171031','7171','TIKALA'),('7171032','7171','PAAL DUA'),('7171040','7171','MAPANGET'),('7171051','7171','SINGKIL'),('7171052','7171','TUMINTING'),('7171053','7171','BUNAKEN'),('7171054','7171','BUNAKEN KEPULAUAN'),('7172010','7172','MADIDIR'),('7172011','7172','MATUARI'),('7172012','7172','GIRIAN'),('7172021','7172','LEMBEH SELATAN'),('7172022','7172','LEMBEH UTARA'),('7172030','7172','AERTEMBAGA'),('7172031','7172','MAESA'),('7172040','7172','RANOWULU'),('7173010','7173','TOMOHON SELATAN'),('7173020','7173','TOMOHON TENGAH'),('7173021','7173','TOMOHON TIMUR'),('7173022','7173','TOMOHON BARAT'),('7173030','7173','TOMOHON UTARA'),('7174010','7174','KOTAMOBAGU SELATAN'),('7174020','7174','KOTAMOBAGU TIMUR'),('7174030','7174','KOTAMOBAGU BARAT'),('7174040','7174','KOTAMOBAGU UTARA'),('7201030','7201','TOTIKUM'),('7201031','7201','TOTIKUM SELATAN'),('7201040','7201','TINANGKUNG'),('7201041','7201','TINANGKUNG SELATAN'),('7201042','7201','TINANGKUNG UTARA'),('7201050','7201','LIANG'),('7201051','7201','PELING TENGAH'),('7201060','7201','BULAGI'),('7201061','7201','BULAGI SELATAN'),('7201062','7201','BULAGI UTARA'),('7201070','7201','BUKO'),('7201071','7201','BUKO SELATAN'),('7202010','7202','TOILI'),('7202011','7202','TOILI BARAT'),('7202012','7202','MOILONG'),('7202020','7202','BATUI'),('7202021','7202','BATUI SELATAN'),('7202030','7202','BUNTA'),('7202031','7202','NUHON'),('7202032','7202','SIMPANG RAYA'),('7202040','7202','KINTOM'),('7202050','7202','LUWUK'),('7202051','7202','LUWUK TIMUR'),('7202052','7202','LUWUK UTARA'),('7202053','7202','LUWUK SELATAN'),('7202054','7202','NAMBO'),('7202060','7202','PAGIMANA'),('7202061','7202','BUALEMO'),('7202062','7202','LOBU'),('7202070','7202','LAMALA'),('7202071','7202','MASAMA'),('7202072','7202','MANTOH'),('7202080','7202','BALANTAK'),('7202081','7202','BALANTAK SELATAN'),('7202082','7202','BALANTAK UTARA'),('7203010','7203','MENUI KEPULAUAN'),('7203020','7203','BUNGKU SELATAN'),('7203021','7203','BAHODOPI'),('7203022','7203','BUNGKU PESISIR'),('7203030','7203','BUNGKU TENGAH'),('7203031','7203','BUNGKU TIMUR'),('7203040','7203','BUNGKU BARAT'),('7203041','7203','BUMI RAYA'),('7203042','7203','WITA PONDA'),('7204010','7204','PAMONA SELATAN'),('7204011','7204','PAMONA BARAT'),('7204012','7204','PAMONA TENGGARA'),('7204020','7204','LORE SELATAN'),('7204021','7204','LORE BARAT'),('7204030','7204','PAMONA PUSALEMBA'),('7204031','7204','PAMONA TIMUR'),('7204032','7204','PAMONA UTARA'),('7204040','7204','LORE UTARA'),('7204041','7204','LORE TENGAH'),('7204042','7204','LORE TIMUR'),('7204043','7204','LORE PEORE'),('7204050','7204','POSO PESISIR'),('7204051','7204','POSO PESISIR SELATAN'),('7204052','7204','POSO PESISIR UTARA'),('7204060','7204','LAGE'),('7204070','7204','POSO KOTA'),('7204071','7204','POSO KOTA UTARA'),('7204072','7204','POSO KOTA SELATAN'),('7205041','7205','RIO PAKAVA'),('7205051','7205','PINEMBANI'),('7205080','7205','BANAWA'),('7205081','7205','BANAWA SELATAN'),('7205082','7205','BANAWA TENGAH'),('7205090','7205','LABUAN'),('7205091','7205','TANANTOVEA'),('7205100','7205','SINDUE'),('7205101','7205','SINDUE TOMBUSABORA'),('7205102','7205','SINDUE TOBATA'),('7205120','7205','SIRENJA'),('7205130','7205','BALAESANG'),('7205131','7205','BALAESANG TANJUNG'),('7205140','7205','DAMPELAS'),('7205160','7205','SOJOL'),('7205161','7205','SOJOL UTARA'),('7206010','7206','DAMPAL SELATAN'),('7206020','7206','DAMPAL UTARA'),('7206030','7206','DONDO'),('7206031','7206','OGODEIDE'),('7206032','7206','BASIDONDO'),('7206040','7206','BAOLAN'),('7206041','7206','LAMPASIO'),('7206050','7206','GALANG'),('7206060','7206','TOLITOLI UTARA'),('7206061','7206','DAKO PAMEAN'),('7207010','7207','LAKEA'),('7207011','7207','BIAU'),('7207012','7207','KARAMAT'),('7207020','7207','MOMUNU'),('7207021','7207','TILOAN'),('7207030','7207','BOKAT'),('7207031','7207','BUKAL'),('7207040','7207','BUNOBOGU'),('7207041','7207','GADUNG'),('7207050','7207','PALELEH'),('7207051','7207','PALELEH BARAT'),('7208010','7208','SAUSU'),('7208011','7208','TORUE'),('7208012','7208','BALINGGI'),('7208020','7208','PARIGI'),('7208021','7208','PARIGI SELATAN'),('7208022','7208','PARIGI BARAT'),('7208023','7208','PARIGI UTARA'),('7208024','7208','PARIGI TENGAH'),('7208030','7208','AMPIBABO'),('7208031','7208','KASIMBAR'),('7208032','7208','TORIBULU'),('7208033','7208','SINIU'),('7208040','7208','TINOMBO'),('7208041','7208','TINOMBO SELATAN'),('7208042','7208','SIDOAN'),('7208050','7208','TOMINI'),('7208051','7208','MEPANGA'),('7208052','7208','PALASA'),('7208060','7208','MOUTONG'),('7208061','7208','BOLANO LAMBUNU'),('7208062','7208','TAOPA'),('7208063','7208','BOLANO'),('7208064','7208','ONGKA MALINO'),('7209010','7209','TOJO BARAT'),('7209020','7209','TOJO'),('7209030','7209','ULUBONGKA'),('7209040','7209','AMPANA TETE'),('7209050','7209','AMPANA KOTA'),('7209051','7209','RATOLINDO'),('7209060','7209','UNA - UNA'),('7209061','7209','BATUDAKA'),('7209070','7209','TOGEAN'),('7209080','7209','WALEA KEPULAUAN'),('7209081','7209','WALEA BESAR'),('7209082','7209','TALATAKO'),('7210010','7210','PIPIKORO'),('7210020','7210','KULAWI SELATAN'),('7210030','7210','KULAWI'),('7210040','7210','LINDU'),('7210050','7210','NOKILALAKI'),('7210060','7210','PALOLO'),('7210070','7210','GUMBASA'),('7210080','7210','DOLO SELATAN'),('7210090','7210','DOLO BARAT'),('7210100','7210','TANAMBULAVA'),('7210110','7210','DOLO'),('7210120','7210','SIGI BIROMARU'),('7210130','7210','MARAWOLA'),('7210140','7210','MARAWOLA BARAT'),('7210150','7210','KINOVARO'),('7211010','7211','BANGKURUNG'),('7211020','7211','LABOBO'),('7211030','7211','BANGGAI UTARA'),('7211040','7211','BANGGAI'),('7211050','7211','BANGGAI TENGAH'),('7211060','7211','BANGGAI SELATAN'),('7211070','7211','BOKAN KEPULAUAN'),('7212010','7212','MORI ATAS'),('7212020','7212','LEMBO'),('7212030','7212','LEMBO RAYA'),('7212040','7212','PETASIA TIMUR'),('7212050','7212','PETASIA'),('7212060','7212','PETASIA BARAT'),('7212070','7212','MORI UTARA'),('7212080','7212','SOYO JAYA'),('7212090','7212','BUNGKU UTARA'),('7212100','7212','MAMOSALATO'),('7271010','7271','PALU BARAT'),('7271011','7271','TATANGA'),('7271012','7271','ULUJADI'),('7271020','7271','PALU SELATAN'),('7271030','7271','PALU TIMUR'),('7271031','7271','MANTIKULORE'),('7271040','7271','PALU UTARA'),('7271041','7271','TAWAELI'),('7301010','7301','PASIMARANNU'),('7301011','7301','PASILAMBENA'),('7301020','7301','PASIMASSUNGGU'),('7301021','7301','TAKABONERATE'),('7301022','7301','PASIMASSUNGGU TIMUR'),('7301030','7301','BONTOSIKUYU'),('7301040','7301','BONTOHARU'),('7301041','7301','BENTENG'),('7301042','7301','BONTOMANAI'),('7301050','7301','BONTOMATENE'),('7301051','7301','BUKI'),('7302010','7302','GANTARANG'),('7302020','7302','UJUNG BULU'),('7302021','7302','UJUNG LOE'),('7302030','7302','BONTO BAHARI'),('7302040','7302','BONTOTIRO'),('7302050','7302','HERO LANGE-LANGE'),('7302060','7302','KAJANG'),('7302070','7302','BULUKUMPA'),('7302080','7302','RILAU ALE'),('7302090','7302','KINDANG'),('7303010','7303','BISSAPPU'),('7303011','7303','ULUERE'),('7303012','7303','SINOA'),('7303020','7303','BANTAENG'),('7303021','7303','EREMERASA'),('7303030','7303','TOMPOBULU'),('7303031','7303','PA\'JUKUKANG'),('7303032','7303','GANTARANGKEKE'),('7304010','7304','BANGKALA'),('7304011','7304','BANGKALA BARAT'),('7304020','7304','TAMALATEA'),('7304021','7304','BONTORAMBA'),('7304030','7304','BINAMU'),('7304031','7304','TURATEA'),('7304040','7304','BATANG'),('7304041','7304','ARUNGKEKE'),('7304042','7304','TAROWANG'),('7304050','7304','KELARA'),('7304051','7304','RUMBIA'),('7305010','7305','MANGARA BOMBANG'),('7305020','7305','MAPPAKASUNGGU'),('7305021','7305','SANROBONE'),('7305030','7305','POLOMBANGKENG SELATAN'),('7305031','7305','PATTALLASSANG'),('7305040','7305','POLOMBANGKENG UTARA'),('7305050','7305','GALESONG SELATAN'),('7305051','7305','GALESONG'),('7305060','7305','GALESONG UTARA'),('7306010','7306','BONTONOMPO'),('7306011','7306','BONTONOMPO SELATAN'),('7306020','7306','BAJENG'),('7306021','7306','BAJENG BARAT'),('7306030','7306','PALLANGGA'),('7306031','7306','BAROMBONG'),('7306040','7306','SOMBA OPU'),('7306050','7306','BONTOMARANNU'),('7306051','7306','PATTALLASSANG'),('7306060','7306','PARANGLOE'),('7306061','7306','MANUJU'),('7306070','7306','TINGGIMONCONG'),('7306071','7306','TOMBOLO PAO'),('7306072','7306','PARIGI'),('7306080','7306','BUNGAYA'),('7306081','7306','BONTOLEMPANGAN'),('7306090','7306','TOMPOBULU'),('7306091','7306','BIRINGBULU'),('7307010','7307','SINJAI BARAT'),('7307020','7307','SINJAI BORONG'),('7307030','7307','SINJAI SELATAN'),('7307040','7307','TELLU LIMPOE'),('7307050','7307','SINJAI TIMUR'),('7307060','7307','SINJAI TENGAH'),('7307070','7307','SINJAI UTARA'),('7307080','7307','BULUPODDO'),('7307090','7307','PULAU SEMBILAN'),('7308010','7308','MANDAI'),('7308011','7308','MONCONGLOE'),('7308020','7308','MAROS BARU'),('7308021','7308','MARUSU'),('7308022','7308','TURIKALE'),('7308023','7308','LAU'),('7308030','7308','BONTOA'),('7308040','7308','BANTIMURUNG'),('7308041','7308','SIMBANG'),('7308050','7308','TANRALILI'),('7308051','7308','TOMPU BULU'),('7308060','7308','CAMBA'),('7308061','7308','CENRANA'),('7308070','7308','MALLAWA'),('7309010','7309','LIUKANG TANGAYA'),('7309020','7309','LIUKANG KALMAS'),('7309030','7309','LIUKANG TUPABBIRING'),('7309031','7309','LIUKANG TUPABBIRING UTARA'),('7309040','7309','PANGKAJENE'),('7309041','7309','MINASATENE'),('7309050','7309','BALOCCI'),('7309051','7309','TONDONG TALLASA'),('7309060','7309','BUNGORO'),('7309070','7309','LABAKKANG'),('7309080','7309','MA\'RANG'),('7309091','7309','SEGERI'),('7309092','7309','MANDALLE'),('7310010','7310','TANETE RIAJA'),('7310011','7310','PUJANANTING'),('7310020','7310','TANETE RILAU'),('7310030','7310','BARRU'),('7310040','7310','SOPPENG RIAJA'),('7310041','7310','BALUSU'),('7310050','7310','MALLUSETASI'),('7311010','7311','BONTOCANI'),('7311020','7311','KAHU'),('7311030','7311','KAJUARA'),('7311040','7311','SALOMEKKO'),('7311050','7311','TONRA'),('7311060','7311','PATIMPENG'),('7311070','7311','LIBURENG'),('7311080','7311','MARE'),('7311090','7311','SIBULUE'),('7311100','7311','CINA'),('7311110','7311','BAREBBO'),('7311120','7311','PONRE'),('7311130','7311','LAPPARIAJA'),('7311140','7311','LAMURU'),('7311141','7311','TELLU LIMPOE'),('7311150','7311','BENGO'),('7311160','7311','ULAWENG'),('7311170','7311','PALAKKA'),('7311180','7311','AWANGPONE'),('7311190','7311','TELLU SIATTINGE'),('7311200','7311','AMALI'),('7311210','7311','AJANGALE'),('7311220','7311','DUA BOCCOE'),('7311230','7311','CENRANA'),('7311710','7311','TANETE RIATTANG BARAT'),('7311720','7311','TANETE RIATTANG'),('7311730','7311','TANETE RIATTANG TIMUR'),('7312010','7312','MARIO RIWAWO'),('7312020','7312','LALABATA'),('7312030','7312','LILI RIAJA'),('7312031','7312','GANRA'),('7312032','7312','CITTA'),('7312040','7312','LILI RILAU'),('7312050','7312','DONRI DONRI'),('7312060','7312','MARIO RIAWA'),('7313010','7313','SABBANG PARU'),('7313020','7313','TEMPE'),('7313030','7313','PAMMANA'),('7313040','7313','BOLA'),('7313050','7313','TAKKALALLA'),('7313060','7313','SAJOANGING'),('7313061','7313','PENRANG'),('7313070','7313','MAJAULENG'),('7313080','7313','TANA SITOLO'),('7313090','7313','BELAWA'),('7313100','7313','MANIANG PAJO'),('7313101','7313','GILIRENG'),('7313110','7313','KEERA'),('7313120','7313','PITUMPANUA'),('7314010','7314','PANCA LAUTANG'),('7314020','7314','TELLULIMPO E'),('7314030','7314','WATANG PULU'),('7314040','7314','BARANTI'),('7314050','7314','PANCA RIJANG'),('7314051','7314','KULO'),('7314060','7314','MARITENGNGAE'),('7314061','7314','WATANG SIDENRENG'),('7314070','7314','PITU RIAWA'),('7314080','7314','DUAPITUE'),('7314081','7314','PITU RIASE'),('7315010','7315','SUPPA'),('7315020','7315','MATTIROSOMPE'),('7315021','7315','LANRISANG'),('7315030','7315','MATTIRO BULU'),('7315040','7315','WATANG SAWITTO'),('7315041','7315','PALETEANG'),('7315042','7315','TIROANG'),('7315050','7315','PATAMPANUA'),('7315060','7315','CEMPA'),('7315070','7315','DUAMPANUA'),('7315071','7315','BATULAPPA'),('7315080','7315','LEMBANG'),('7316010','7316','MAIWA'),('7316011','7316','BUNGIN'),('7316020','7316','ENREKANG'),('7316021','7316','CENDANA'),('7316030','7316','BARAKA'),('7316031','7316','BUNTU BATU'),('7316040','7316','ANGGERAJA'),('7316041','7316','MALUA'),('7316050','7316','ALLA'),('7316051','7316','CURIO'),('7316052','7316','MASALLE'),('7316053','7316','BAROKO'),('7317010','7317','LAROMPONG'),('7317011','7317','LAROMPONG SELATAN'),('7317020','7317','SULI'),('7317021','7317','SULI BARAT'),('7317030','7317','BELOPA'),('7317031','7317','KAMANRE'),('7317032','7317','BELOPA UTARA'),('7317040','7317','BAJO'),('7317041','7317','BAJO BARAT'),('7317050','7317','BASSESANGTEMPE'),('7317051','7317','LATIMOJONG'),('7317052','7317','BASSESANGTEMPE UTARA'),('7317060','7317','BUPON'),('7317061','7317','PONRANG'),('7317062','7317','PONRANG SELATAN'),('7317070','7317','BUA'),('7317080','7317','WALENRANG'),('7317081','7317','WALENRANG TIMUR'),('7317090','7317','LAMASI'),('7317091','7317','WALENRANG UTARA'),('7317092','7317','WALENRANG BARAT'),('7317093','7317','LAMASI TIMUR'),('7318010','7318','BONGGAKARADENG'),('7318011','7318','SIMBUANG'),('7318012','7318','RANO'),('7318013','7318','MAPPAK'),('7318020','7318','MENGKENDEK'),('7318021','7318','GANDANG BATU SILANAN'),('7318030','7318','SANGALLA'),('7318031','7318','SANGALA SELATAN'),('7318032','7318','SANGALLA UTARA'),('7318040','7318','MAKALE'),('7318041','7318','MAKALE SELATAN'),('7318042','7318','MAKALE UTARA'),('7318050','7318','SALUPUTTI'),('7318051','7318','BITTUANG'),('7318052','7318','REMBON'),('7318053','7318','MASANDA'),('7318054','7318','MALIMBONG BALEPE'),('7318061','7318','RANTETAYO'),('7318067','7318','KURRA'),('7322010','7322','SABBANG'),('7322020','7322','BAEBUNTA'),('7322030','7322','MALANGKE'),('7322031','7322','MALANGKE BARAT'),('7322040','7322','SUKAMAJU'),('7322050','7322','BONE-BONE'),('7322051','7322','TANA LILI'),('7322120','7322','MASAMBA'),('7322121','7322','MAPPEDECENG'),('7322122','7322','RAMPI'),('7322130','7322','LIMBONG'),('7322131','7322','SEKO'),('7325010','7325','BURAU'),('7325020','7325','WOTU'),('7325030','7325','TOMONI'),('7325031','7325','TOMONI TIMUR'),('7325040','7325','ANGKONA'),('7325050','7325','MALILI'),('7325060','7325','TOWUTI'),('7325070','7325','NUHA'),('7325071','7325','WASUPONDA'),('7325080','7325','MANGKUTANA'),('7325081','7325','KALAENA'),('7326010','7326','SOPAI'),('7326020','7326','KESU'),('7326030','7326','SANGGALANGI'),('7326040','7326','BUNTAO'),('7326050','7326','RANTEBUA'),('7326060','7326','NANGGALA'),('7326070','7326','TONDON'),('7326080','7326','TALLUNGLIPU'),('7326090','7326','RANTEPAO'),('7326100','7326','TIKALA'),('7326110','7326','SESEAN'),('7326120','7326','BALUSU'),('7326130','7326','SA\'DAN'),('7326140','7326','BENGKELEKILA'),('7326150','7326','SESEAN SULOARA'),('7326160','7326','KAPALA PITU'),('7326170','7326','DENDE PIONGAN NAPO'),('7326180','7326','AWAN RANTE KARUA'),('7326190','7326','RINDINGALO'),('7326200','7326','BUNTU PEPASAN'),('7326210','7326','BARUPPU'),('7371010','7371','MARISO'),('7371020','7371','MAMAJANG'),('7371030','7371','TAMALATE'),('7371031','7371','RAPPOCINI'),('7371040','7371','MAKASSAR'),('7371050','7371','UJUNG PANDANG'),('7371060','7371','WAJO'),('7371070','7371','BONTOALA'),('7371080','7371','UJUNG TANAH'),('7371081','7371','KEPULAUAN SANGKARRANG'),('7371090','7371','TALLO'),('7371100','7371','PANAKKUKANG'),('7371101','7371','MANGGALA'),('7371110','7371','BIRING KANAYA'),('7371111','7371','TAMALANREA'),('7372010','7372','BACUKIKI'),('7372011','7372','BACUKIKI BARAT'),('7372020','7372','UJUNG'),('7372030','7372','SOREANG'),('7373010','7373','WARA SELATAN'),('7373011','7373','SENDANA'),('7373020','7373','WARA'),('7373021','7373','WARA TIMUR'),('7373022','7373','MUNGKAJANG'),('7373030','7373','WARA UTARA'),('7373031','7373','BARA'),('7373040','7373','TELLUWANUA'),('7373041','7373','WARA BARAT'),('7401050','7401','LASALIMU'),('7401051','7401','LASALIMU SELATAN'),('7401052','7401','SIONTAPINA'),('7401060','7401','PASAR WAJO'),('7401061','7401','WOLOWA'),('7401062','7401','WABULA'),('7401110','7401','KAPONTORI'),('7402010','7402','TONGKUNO'),('7402011','7402','TONGKUNO SELATAN'),('7402020','7402','PARIGI'),('7402021','7402','BONE'),('7402022','7402','MAROBO'),('7402030','7402','KABAWO'),('7402031','7402','KABANGKA'),('7402032','7402','KONTUKOWUNA'),('7402061','7402','KONTUNAGA'),('7402062','7402','WATOPUTE'),('7402070','7402','KATOBU'),('7402071','7402','LOHIA'),('7402072','7402','DURUKA'),('7402073','7402','BATALAIWORU'),('7402080','7402','NAPABALANO'),('7402081','7402','LASALEPA'),('7402083','7402','TOWEA'),('7402090','7402','WAKORUMBA SELATAN'),('7402091','7402','PASIR PUTIH'),('7402092','7402','PASI KOLAGA'),('7402111','7402','MALIGANO'),('7402112','7402','BATUKARA'),('7403090','7403','SOROPIA'),('7403091','7403','LALONGGASUMEETO'),('7403100','7403','SAMPARA'),('7403101','7403','BONDOALA'),('7403102','7403','BESULUTU'),('7403103','7403','KAPOIALA'),('7403104','7403','ANGGALOMOARE'),('7403105','7403','MOROSI'),('7403130','7403','LAMBUYA'),('7403131','7403','UEPAI'),('7403132','7403','PURIALA'),('7403133','7403','ONEMBUTE'),('7403140','7403','PONDIDAHA'),('7403141','7403','WONGGEDUKU'),('7403142','7403','AMONGGEDO'),('7403143','7403','WONGGEDUKU BARAT'),('7403150','7403','WAWOTOBI'),('7403151','7403','MELUHU'),('7403152','7403','KONAWE'),('7403153','7403','ANGGOTOA'),('7403170','7403','UNAAHA'),('7403171','7403','ANGGABERI'),('7403180','7403','ABUKI'),('7403181','7403','LATOMA'),('7403182','7403','TONGAUNA'),('7403183','7403','ASINUA'),('7403184','7403','PADANGGUNI'),('7403185','7403','TONGAUNA UTARA'),('7403193','7403','ROUTA'),('7404010','7404','WATUBANGGA'),('7404011','7404','TANGGETADA'),('7404012','7404','TOARI'),('7404013','7404','POLINGGONA'),('7404020','7404','POMALAA'),('7404030','7404','WUNDULAKO'),('7404031','7404','BAULA'),('7404060','7404','KOLAKA'),('7404061','7404','LATAMBAGA'),('7404070','7404','WOLO'),('7404071','7404','SAMATURU'),('7404072','7404','IWOIMENDAA'),('7405010','7405','TINANGGEA'),('7405011','7405','LALEMBUU'),('7405020','7405','ANDOOLO'),('7405021','7405','BUKE'),('7405022','7405','ANDOOLO BARAT'),('7405030','7405','PALANGGA'),('7405031','7405','PALANGGA SELATAN'),('7405032','7405','BAITO'),('7405040','7405','LAINEA'),('7405041','7405','LAEYA'),('7405050','7405','KOLONO'),('7405051','7405','KOLONO TIMUR'),('7405060','7405','LAONTI'),('7405070','7405','MORAMO'),('7405071','7405','MORAMO UTARA'),('7405080','7405','KONDA'),('7405081','7405','WOLASI'),('7405090','7405','RANOMEETO'),('7405091','7405','RANOMEETO BARAT'),('7405100','7405','LANDONO'),('7405101','7405','MOWILA'),('7405102','7405','SABULAKOA'),('7405110','7405','ANGATA'),('7405111','7405','BENUA'),('7405112','7405','BASALA'),('7406010','7406','KABAENA'),('7406011','7406','KABAENA UTARA'),('7406012','7406','KABAENA SELATAN'),('7406013','7406','KABAENA BARAT'),('7406020','7406','KABAENA TIMUR'),('7406021','7406','KABAENA TENGAH'),('7406030','7406','RUMBIA'),('7406031','7406','MATA OLEO'),('7406032','7406','KEP. MASALOKA RAYA'),('7406033','7406','RUMBIA TENGAH'),('7406040','7406','RAROWATU'),('7406041','7406','RAROWATU UTARA'),('7406042','7406','MATA USU'),('7406043','7406','LANTARI JAYA'),('7406050','7406','POLEANG TIMUR'),('7406051','7406','POLEANG UTARA'),('7406052','7406','POLEANG SELATAN'),('7406053','7406','POLEANG TENGGARA'),('7406060','7406','POLEANG'),('7406061','7406','POLEANG BARAT'),('7406062','7406','TONTONUNU'),('7406063','7406','POLEANG TENGAH'),('7407010','7407','BINONGKO'),('7407011','7407','TOGO BINONGKO'),('7407020','7407','TOMIA'),('7407021','7407','TOMIA TIMUR'),('7407030','7407','KALEDUPA'),('7407031','7407','KALEDUPA SELATAN'),('7407040','7407','WANGI-WANGI'),('7407050','7407','WANGI-WANGI SELATAN'),('7408010','7408','RANTEANGIN'),('7408011','7408','LAMBAI'),('7408012','7408','WAWO'),('7408020','7408','LASUSUA'),('7408021','7408','KATOI'),('7408030','7408','KODEOHA'),('7408031','7408','TIWU'),('7408040','7408','NGAPA'),('7408041','7408','WATUNOHU'),('7408050','7408','PAKUE'),('7408051','7408','PAKUE UTARA'),('7408052','7408','PAKUE TENGAH'),('7408060','7408','BATU PUTIH'),('7408061','7408','POREHU'),('7408062','7408','TOLALA'),('7409100','7409','BONEGUNU'),('7409101','7409','KAMBOWA'),('7409110','7409','WAKORUMBA'),('7409120','7409','KULISUSU'),('7409121','7409','KULISUSU BARAT'),('7409122','7409','KULISUSU UTARA'),('7410010','7410','SAWA'),('7410011','7410','MOTUI'),('7410020','7410','LEMBO'),('7410030','7410','LASOLO'),('7410031','7410','WAWOLESEA'),('7410032','7410','LASOLO KEPULAUAN'),('7410040','7410','MOLAWE'),('7410050','7410','ASERA'),('7410051','7410','ANDOWIA'),('7410052','7410','OHEO'),('7410060','7410','LANGGIKIMA'),('7410070','7410','WIWIRANO'),('7410071','7410','LANDAWE'),('7411010','7411','AERE'),('7411020','7411','LAMBANDIA'),('7411030','7411','POLI-POLIA'),('7411040','7411','DANGIA'),('7411050','7411','LADONGI'),('7411060','7411','LOEA'),('7411070','7411','TIRAWUTA'),('7411080','7411','LALOLAE'),('7411090','7411','MOWEWE'),('7411100','7411','TINONDO'),('7411110','7411','ULUIWOI'),('7411120','7411','UEESI'),('7412010','7412','WAWONII TENGGARA'),('7412020','7412','WAWONII TIMUR'),('7412030','7412','WAWONII TIMUR LAUT'),('7412040','7412','WAWONII UTARA'),('7412050','7412','WAWONII SELATAN'),('7412060','7412','WAWONII TENGAH'),('7412070','7412','WAWONII BARAT'),('7413010','7413','TIWORO KEPULAUAN'),('7413020','7413','MAGINTI'),('7413030','7413','TIWORO TENGAH'),('7413040','7413','TIWORO SELATAN'),('7413050','7413','TIWORO UTARA'),('7413060','7413','LAWA'),('7413070','7413','SAWERIGADI'),('7413080','7413','BARANGKA'),('7413090','7413','WA DAGA'),('7413100','7413','KUSAMBI'),('7413110','7413','NAPANO KUSAMBI'),('7414010','7414','TALAGA RAYA'),('7414020','7414','MAWASANGKA'),('7414030','7414','MAWASANGKA TENGAH'),('7414040','7414','MAWASANGKA TIMUR'),('7414050','7414','LAKUDO'),('7414060','7414','GU'),('7414070','7414','SANGIA WAMBULU'),('7415010','7415','BATU ATAS'),('7415020','7415','LAPANDEWA'),('7415030','7415','SAMPOLAWA'),('7415040','7415','BATAUGA'),('7415050','7415','SIOMPU BARAT'),('7415060','7415','SIOMPU'),('7415070','7415','KADATUA'),('7471010','7471','MANDONGA'),('7471011','7471','BARUGA'),('7471012','7471','PUUWATU'),('7471013','7471','KADIA'),('7471014','7471','WUA-WUA'),('7471020','7471','POASIA'),('7471021','7471','ABELI'),('7471022','7471','KAMBU'),('7471023','7471','NAMBO'),('7471030','7471','KENDARI'),('7471031','7471','KENDARI BARAT'),('7472010','7472','BETOAMBARI'),('7472011','7472','MURHUM'),('7472012','7472','BATUPOARO'),('7472020','7472','WOLIO'),('7472021','7472','KOKALUKUNA'),('7472030','7472','SORAWOLIO'),('7472040','7472','BUNGI'),('7472041','7472','LEA-LEA'),('7501031','7501','MANANGGU'),('7501040','7501','TILAMUTA'),('7501041','7501','DULUPI'),('7501042','7501','BOTUMOITO'),('7501050','7501','PAGUYAMAN'),('7501051','7501','WONOSARI'),('7501052','7501','PAGUYAMAN PANTAI'),('7502010','7502','BATUDAA PANTAI'),('7502011','7502','BILUHU'),('7502020','7502','BATUDAA'),('7502021','7502','BONGOMEME'),('7502022','7502','TABONGO'),('7502023','7502','DUNGALIYO'),('7502030','7502','TIBAWA'),('7502031','7502','PULUBALA'),('7502040','7502','BOLIYOHUTO'),('7502041','7502','MOOTILANGO'),('7502042','7502','TOLANGOHULA'),('7502043','7502','ASPARAGA'),('7502044','7502','BILATO'),('7502070','7502','LIMBOTO'),('7502071','7502','LIMBOTO BARAT'),('7502080','7502','TELAGA'),('7502081','7502','TELAGA BIRU'),('7502082','7502','TILANGO'),('7502083','7502','TELAGA JAYA'),('7503010','7503','POPAYATO'),('7503011','7503','POPAYATO BARAT'),('7503012','7503','POPAYATO TIMUR'),('7503020','7503','LEMITO'),('7503021','7503','WANGGARASI'),('7503030','7503','MARISA'),('7503031','7503','PATILANGGIO'),('7503032','7503','BUNTULIA'),('7503033','7503','DUHIADAA'),('7503040','7503','RANDANGAN'),('7503041','7503','TALUDITI'),('7503050','7503','PAGUAT'),('7503051','7503','DENGILO'),('7504010','7504','TAPA'),('7504011','7504','BULANGO UTARA'),('7504012','7504','BULANGO SELATAN'),('7504013','7504','BULANGO TIMUR'),('7504014','7504','BULANGO ULU'),('7504020','7504','KABILA'),('7504021','7504','BOTU PINGGE'),('7504022','7504','TILONGKABILA'),('7504030','7504','SUWAWA'),('7504031','7504','SUWAWA SELATAN'),('7504032','7504','SUWAWA TIMUR'),('7504033','7504','SUWAWA TENGAH'),('7504034','7504','PINOGU'),('7504040','7504','BONEPANTAI'),('7504041','7504','KABILA BONE'),('7504042','7504','BONE RAYA'),('7504043','7504','BONE'),('7504044','7504','BULAWA'),('7505010','7505','ATINGGOLA'),('7505011','7505','GENTUMA RAYA'),('7505020','7505','KWANDANG'),('7505021','7505','TOMILITO'),('7505022','7505','PONELO KEPULAUAN'),('7505030','7505','ANGGREK'),('7505031','7505','MONANO'),('7505040','7505','SUMALATA'),('7505041','7505','SUMALATA TIMUR'),('7505050','7505','TOLINGGULA'),('7505051','7505','BIAU'),('7571010','7571','KOTA BARAT'),('7571011','7571','DUNGINGI'),('7571020','7571','KOTA SELATAN'),('7571021','7571','KOTA TIMUR'),('7571022','7571','HULONTHALANGI'),('7571023','7571','DUMBO RAYA'),('7571030','7571','KOTA UTARA'),('7571031','7571','KOTA TENGAH'),('7571032','7571','SIPATANA'),('7601010','7601','BANGGAE'),('7601011','7601','BANGGAE TIMUR'),('7601020','7601','PAMBOANG'),('7601030','7601','SENDANA'),('7601031','7601','TAMMERODO'),('7601033','7601','TUBO SENDANA'),('7601040','7601','MALUNDA'),('7601041','7601','ULUMANDA'),('7602010','7602','TINAMBUNG'),('7602011','7602','BALANIPA'),('7602012','7602','LIMBORO'),('7602020','7602','TUBBI TARAMANU'),('7602021','7602','ALU'),('7602030','7602','CAMPALAGIAN'),('7602031','7602','LUYO'),('7602040','7602','WONOMULYO'),('7602041','7602','MAPILLI'),('7602042','7602','TAPANGO'),('7602043','7602','MATAKALI'),('7602044','7602','B U L O'),('7602050','7602','POLEWALI'),('7602051','7602','BINUANG'),('7602052','7602','ANREAPI'),('7602061','7602','MATANGNGA'),('7603010','7603','SUMARORONG'),('7603020','7603','MESSAWA'),('7603030','7603','PANA'),('7603031','7603','NOSU'),('7603040','7603','TABANG'),('7603050','7603','MAMASA'),('7603060','7603','TANDUK KALUA'),('7603061','7603','BALLA'),('7603070','7603','SESENAPADANG'),('7603071','7603','TAWALIAN'),('7603080','7603','MAMBI'),('7603081','7603','BAMBANG'),('7603082','7603','RANTEBULAHAN TIMUR'),('7603083','7603','MEHALAAN'),('7603090','7603','ARALLE'),('7603091','7603','BUNTU MALANGKA'),('7603100','7603','TABULAHAN'),('7604010','7604','TAPALANG'),('7604011','7604','TAPALANG BARAT'),('7604020','7604','MAMUJU'),('7604022','7604','SIMBORO'),('7604023','7604','BALABALAKANG'),('7604030','7604','KALUKKU'),('7604031','7604','PAPALANG'),('7604032','7604','SAMPAGA'),('7604033','7604','TOMMO'),('7604040','7604','KALUMPANG'),('7604041','7604','BONEHAU'),('7605010','7605','SARUDU'),('7605011','7605','DAPURANG'),('7605012','7605','DURIPOKU'),('7605020','7605','BARAS'),('7605021','7605','BULU TABA'),('7605022','7605','LARIANG'),('7605030','7605','PASANGKAYU'),('7605031','7605','TIKKE RAYA'),('7605032','7605','PEDONGGA'),('7605040','7605','BAMBALAMOTU'),('7605041','7605','BAMBAIRA'),('7605042','7605','SARJO'),('7606010','7606','PANGALE'),('7606020','7606','BUDONG-BUDONG'),('7606030','7606','TOBADAK'),('7606040','7606','TOPOYO'),('7606050','7606','KAROSSA'),('8101040','8101','TANIMBAR SELATAN'),('8101041','8101','WER TAMRIAN'),('8101042','8101','WER MAKTIAN'),('8101043','8101','SELARU'),('8101050','8101','TANIMBAR UTARA'),('8101051','8101','YARU'),('8101052','8101','WUAR LABOBAR'),('8101053','8101','NIRUNMAS'),('8101054','8101','KORMOMOLIN'),('8101055','8101','MOLU MARU'),('8102010','8102','KEI KECIL'),('8102012','8102','KEI KECIL BARAT'),('8102013','8102','KEI KECIL TIMUR'),('8102014','8102','HOAT SORBAY'),('8102015','8102','MANYEUW'),('8102016','8102','KEI KECIL TIMUR SELATAN'),('8102020','8102','KEI BESAR'),('8102021','8102','KEI BESAR UTARA TIMUR'),('8102022','8102','KEI BESAR SELATAN'),('8102023','8102','KEI BESAR UTARA BARAT'),('8102024','8102','KEI BESAR SELATAN BARAT'),('8103010','8103','BANDA'),('8103040','8103','TEHORU'),('8103041','8103','TELUTIH'),('8103050','8103','AMAHAI'),('8103051','8103','KOTA MASOHI'),('8103052','8103','TELUK ELPAPUTIH'),('8103060','8103','TEON NILA SERUA'),('8103080','8103','SAPARUA'),('8103081','8103','NUSALAUT'),('8103082','8103','SAPARUA TIMUR'),('8103090','8103','P. HARUKU'),('8103100','8103','SALAHUTU'),('8103110','8103','LEIHITU'),('8103111','8103','LEIHITU BARAT'),('8103140','8103','SERAM UTARA'),('8103141','8103','SERAM UTARA BARAT'),('8103142','8103','SERAM UTARA TIMUR KOBI'),('8103143','8103','SERAM UTARA TIMUR SETI'),('8104020','8104','NAMLEA'),('8104021','8104','WAEAPO'),('8104022','8104','WAPLAU'),('8104023','8104','BATA BUAL'),('8104024','8104','TELUK KAIELY'),('8104025','8104','WAELATA'),('8104026','8104','LOLONG GUBA'),('8104027','8104','LILIALY'),('8104030','8104','AIR BUAYA'),('8104031','8104','FENA LEISELA'),('8105010','8105','ARU SELATAN'),('8105011','8105','ARU SELATAN TIMUR'),('8105012','8105','ARU SELATAN UTARA'),('8105020','8105','ARU TENGAH'),('8105021','8105','ARU TENGAH TIMUR'),('8105022','8105','ARU TENGAH SELATAN'),('8105030','8105','PULAU-PULAU ARU'),('8105031','8105','ARU UTARA'),('8105032','8105','ARU UTARA TIMUR BATULEY'),('8105033','8105','SIR-SIR'),('8106010','8106','HUAMUAL BELAKANG'),('8106011','8106','KEPULAUAN MANIPA'),('8106020','8106','SERAM BARAT'),('8106021','8106','HUAMUAL'),('8106030','8106','KAIRATU'),('8106031','8106','KAIRATU BARAT'),('8106032','8106','INAMOSOL'),('8106033','8106','AMALATU'),('8106034','8106','ELPAPUTIH'),('8106040','8106','TANIWEL'),('8106041','8106','TANIWEL TIMUR'),('8107010','8107','PULAU GOROM'),('8107011','8107','WAKATE'),('8107012','8107','TEOR'),('8107013','8107','GOROM TIMUR'),('8107014','8107','PULAU PANJANG'),('8107020','8107','SERAM TIMUR'),('8107021','8107','TUTUK TOLU'),('8107022','8107','KILMURY'),('8107023','8107','LIAN VITU'),('8107024','8107','KIAN DARAT'),('8107030','8107','WERINAMA'),('8107031','8107','SIWALALAT'),('8107040','8107','BULA'),('8107041','8107','BULA BARAT'),('8107042','8107','TELUK WARU'),('8108010','8108','WETAR'),('8108011','8108','WETAR BARAT'),('8108012','8108','WETAR UTARA'),('8108013','8108','WETAR TIMUR'),('8108020','8108','PP. TERSELATAN'),('8108021','8108','KISAR UTARA'),('8108022','8108','KEPULAUAN ROMANG'),('8108030','8108','LETTI'),('8108041','8108','MOA'),('8108042','8108','LAKOR'),('8108050','8108','DAMER'),('8108060','8108','MDONA HIERA'),('8108070','8108','PP. BABAR'),('8108071','8108','PULAU WETANG'),('8108080','8108','BABAR TIMUR'),('8108081','8108','PULAU MASELA'),('8108082','8108','DAWELOR DAWERA'),('8109010','8109','KEPALA MADAN'),('8109020','8109','LEKSULA'),('8109021','8109','FENA FAFAN'),('8109030','8109','NAMROLE'),('8109040','8109','WAISAMA'),('8109050','8109','AMBALAU'),('8171010','8171','NUSANIWE'),('8171020','8171','SIRIMAU'),('8171021','8171','LEITIMUR SELATAN'),('8171030','8171','TELUK AMBON BAGUALA'),('8171031','8171','TELUK AMBON'),('8172010','8172','PP. KUR'),('8172011','8172','KUR SELATAN'),('8172020','8172','TAYANDO TAM'),('8172030','8172','PULAU DULLAH UTARA'),('8172040','8172','PULAU DULLAH SELATAN'),('8201090','8201','JAILOLO'),('8201091','8201','JAILOLO SELATAN'),('8201100','8201','SAHU'),('8201101','8201','SAHU TIMUR'),('8201130','8201','IBU'),('8201131','8201','IBU SELATAN'),('8201132','8201','TABARU'),('8201140','8201','LOLODA'),('8202030','8202','WEDA'),('8202031','8202','WEDA SELATAN'),('8202032','8202','WEDA UTARA'),('8202033','8202','WEDA TENGAH'),('8202034','8202','WEDA TIMUR'),('8202041','8202','PULAU GEBE'),('8202042','8202','PATANI'),('8202043','8202','PATANI UTARA'),('8202044','8202','PATANI BARAT'),('8202045','8202','PATANI TIMUR'),('8203010','8203','SULA BESI BARAT'),('8203011','8203','SULABESI SELATAN'),('8203020','8203','SANANA'),('8203021','8203','SULA BESI TENGAH'),('8203022','8203','SULABESI TIMUR'),('8203023','8203','SANANA UTARA'),('8203030','8203','MANGOLI TIMUR'),('8203031','8203','MANGOLI TENGAH'),('8203032','8203','MANGOLI UTARA TIMUR'),('8203040','8203','MANGOLI BARAT'),('8203041','8203','MANGOLI UTARA'),('8203042','8203','MANGOLI SELATAN'),('8204010','8204','OBI SELATAN'),('8204020','8204','OBI'),('8204021','8204','OBI BARAT'),('8204022','8204','OBI TIMUR'),('8204023','8204','OBI UTARA'),('8204030','8204','BACAN'),('8204031','8204','MANDIOLI SELATAN'),('8204032','8204','MANDIOLI UTARA'),('8204033','8204','BACAN SELATAN'),('8204034','8204','BATANG LOMANG'),('8204040','8204','BACAN TIMUR'),('8204041','8204','BACAN TIMUR SELATAN'),('8204042','8204','BACAN TIMUR TENGAH'),('8204050','8204','BACAN BARAT'),('8204051','8204','KASIRUTA BARAT'),('8204052','8204','KASIRUTA TIMUR'),('8204053','8204','BACAN BARAT UTARA'),('8204060','8204','KAYOA'),('8204061','8204','KAYOA BARAT'),('8204062','8204','KAYOA SELATAN'),('8204063','8204','KAYOA UTARA'),('8204070','8204','PULAU MAKIAN'),('8204071','8204','MAKIAN BARAT'),('8204080','8204','GANE BARAT'),('8204081','8204','GANE BARAT SELATAN'),('8204082','8204','GANE BARAT UTARA'),('8204083','8204','KEPULAUAN JORONGA'),('8204090','8204','GANE TIMUR'),('8204091','8204','GANE TIMUR TENGAH'),('8204092','8204','GANE TIMUR SELATAN'),('8205010','8205','MALIFUT'),('8205011','8205','KAO TELUK'),('8205020','8205','KAO'),('8205021','8205','KAO BARAT'),('8205022','8205','KAO UTARA'),('8205030','8205','TOBELO SELATAN'),('8205031','8205','TOBELO BARAT'),('8205032','8205','TOBELO TIMUR'),('8205040','8205','TOBELO'),('8205041','8205','TOBELO TENGAH'),('8205042','8205','TOBELO UTARA'),('8205050','8205','GALELA'),('8205051','8205','GALELA SELATAN'),('8205052','8205','GALELA BARAT'),('8205053','8205','GALELA UTARA'),('8205060','8205','LOLODA UTARA'),('8205061','8205','LOLODA KEPULAUAN'),('8206010','8206','MABA SELATAN'),('8206011','8206','KOTA MABA'),('8206020','8206','WASILE SELATAN'),('8206030','8206','WASILE'),('8206031','8206','WASILE TIMUR'),('8206032','8206','WASILE TENGAH'),('8206033','8206','WASILE UTARA'),('8206040','8206','MABA'),('8206041','8206','MABA TENGAH'),('8206042','8206','MABA UTARA'),('8207010','8207','MOROTAI SELATAN'),('8207020','8207','MOROTAI TIMUR'),('8207030','8207','MOROTAI SELATAN BARAT'),('8207040','8207','MOROTAI JAYA'),('8207050','8207','MOROTAI UTARA'),('8208010','8208','TALIABU BARAT'),('8208020','8208','TALIABU SELATAN'),('8208030','8208','TABONA'),('8208040','8208','TALIABU TIMUR SELATAN'),('8208050','8208','TALIABU TIMUR'),('8208060','8208','TALIABU UTARA'),('8208070','8208','LEDE'),('8208080','8208','TALIABU BARAT LAUT'),('8271010','8271','PULAU TERNATE'),('8271011','8271','MOTI'),('8271012','8271','PULAU BATANG DUA'),('8271013','8271','PULAU HIRI'),('8271014','8271','TERNATE BARAT'),('8271020','8271','TERNATE SELATAN'),('8271021','8271','TERNATE TENGAH'),('8271030','8271','TERNATE UTARA'),('8272010','8272','TIDORE SELATAN'),('8272020','8272','TIDORE UTARA'),('8272030','8272','TIDORE'),('8272031','8272','TIDORE TIMUR'),('8272040','8272','OBA'),('8272041','8272','OBA SELATAN'),('8272050','8272','OBA UTARA'),('8272051','8272','OBA TENGAH'),('9101050','9101','FAKFAK TIMUR'),('9101051','9101','KARAS'),('9101052','9101','FAKFAK TIMUR TENGAH'),('9101060','9101','FAKFAK'),('9101061','9101','FAKFAK TENGAH'),('9101062','9101','PARIWARI'),('9101070','9101','FAKFAK BARAT'),('9101071','9101','WARTUTIN'),('9101080','9101','KOKAS'),('9101081','9101','TELUK PATIPI'),('9101082','9101','KRAMONGMONGGA'),('9101083','9101','BOMBERAY'),('9101084','9101','ARGUNI'),('9101085','9101','MBAHAMDANDARA'),('9101086','9101','FURWAGI'),('9101087','9101','KAYAUNI'),('9101088','9101','TOMAGE'),('9102010','9102','BURUWAY'),('9102020','9102','TELUK ARGUNI'),('9102021','9102','TELUK ARGUNI BAWAH'),('9102030','9102','KAIMANA'),('9102031','9102','KAMBRAU'),('9102040','9102','TELUK ETNA'),('9102041','9102','YAMOR'),('9103010','9103','NAIKERE'),('9103020','9103','WONDIBOY'),('9103021','9103','RASIEY'),('9103022','9103','KURI WAMESA'),('9103030','9103','WASIOR'),('9103040','9103','DUAIRI'),('9103041','9103','ROON'),('9103050','9103','WINDESI'),('9103051','9103','NIKIWAR'),('9103060','9103','WAMESA'),('9103061','9103','ROSWAR'),('9103070','9103','RUMBERPON'),('9103071','9103','SOUG JAYA'),('9104010','9104','FAFURWAR'),('9104020','9104','BABO'),('9104021','9104','SUMURI'),('9104022','9104','AROBA'),('9104023','9104','KAITARO'),('9104030','9104','KURI'),('9104040','9104','WAMESA'),('9104050','9104','BINTUNI'),('9104051','9104','MANIMERI'),('9104052','9104','TUHIBA'),('9104053','9104','DATARAN BEIMES'),('9104060','9104','TEMBUNI'),('9104070','9104','ARANDAY'),('9104071','9104','KAMUNDAN'),('9104072','9104','TOMU'),('9104073','9104','WERIAGAR'),('9104080','9104','MOSKONA SELATAN'),('9104081','9104','MEYADO'),('9104082','9104','MOSKONA BARAT'),('9104090','9104','MERDEY'),('9104091','9104','BISCOOP'),('9104092','9104','MASYETA'),('9104100','9104','MOSKONA UTARA'),('9104101','9104','MOSKONA TIMUR'),('9105110','9105','WARMARE'),('9105120','9105','PRAFI'),('9105141','9105','MANOKWARI BARAT'),('9105142','9105','MANOKWARI TIMUR'),('9105143','9105','MANOKWARI UTARA'),('9105144','9105','MANOKWARI SELATAN'),('9105146','9105','TANAH RUBU'),('9105170','9105','MASNI'),('9105171','9105','SIDEY'),('9106010','9106','INANWATAN'),('9106011','9106','METEMANI'),('9106020','9106','KOKODA'),('9106021','9106','KAIS'),('9106022','9106','KOKODA UTARA'),('9106023','9106','KAIS DARAT'),('9106060','9106','MOSWAREN'),('9106070','9106','TEMINABUAN'),('9106071','9106','SEREMUK'),('9106072','9106','WAYER'),('9106073','9106','KONDA'),('9106074','9106','SAIFI'),('9106080','9106','SAWIAT'),('9106081','9106','FOKOUR'),('9106082','9106','SALKMA'),('9107061','9107','KLASO'),('9107062','9107','SAENGKEDUK'),('9107100','9107','MAKBON'),('9107101','9107','KLAYILI'),('9107110','9107','BERAUR'),('9107111','9107','KLAMONO'),('9107112','9107','KLABOT'),('9107113','9107','KLAWAK'),('9107114','9107','BAGUN'),('9107115','9107','KLASAFET'),('9107116','9107','MALABOTOM'),('9107118','9107','BOTAIN'),('9107119','9107','KONHIR'),('9107120','9107','SALAWATI'),('9107121','9107','MAYAMUK'),('9107122','9107','SALAWATI TIMUR'),('9107123','9107','HOBARD'),('9107124','9107','BUK'),('9107130','9107','SEGET'),('9107131','9107','SEGUN'),('9107132','9107','SALAWATI SELATAN'),('9107133','9107','SALAWATI TENGAH'),('9107170','9107','AIMAS'),('9107171','9107','MARIAT'),('9107172','9107','SORONG'),('9107180','9107','SAYOSA'),('9107181','9107','MAUDUS'),('9107182','9107','WEMAK'),('9107183','9107','SAYOSA TIMUR'),('9107184','9107','SUNOOK'),('9108011','9108','MISOOL SELATAN'),('9108012','9108','MISOOL BARAT'),('9108020','9108','MISOOL'),('9108021','9108','KOFIAU'),('9108022','9108','MISOOL TIMUR'),('9108023','9108','KEPULAUAN SEMBILAN'),('9108031','9108','SALAWATI UTARA'),('9108033','9108','SALAWATI TENGAH'),('9108034','9108','SALAWATI BARAT'),('9108035','9108','BATANTA SELATAN'),('9108036','9108','BATANTA UTARA'),('9108040','9108','WAIGEO SELATAN'),('9108041','9108','TELUK MAYALIBIT'),('9108042','9108','MEOS MANSAR'),('9108043','9108','KOTA WAISAI'),('9108044','9108','TIPLOL MAYALIBIT'),('9108050','9108','WAIGEO BARAT'),('9108051','9108','WAIGEO BARAT KEPULAUAN'),('9108060','9108','WAIGEO UTARA'),('9108061','9108','WARWARBOMI'),('9108062','9108','SUPNIN'),('9108070','9108','KEPULAUAN AYAU'),('9108071','9108','AYAU'),('9108080','9108','WAIGEO TIMUR'),('9109010','9109','FEF'),('9109011','9109','SYUJAK'),('9109012','9109','ASES'),('9109013','9109','TINGGOUW'),('9109020','9109','MIYAH'),('9109021','9109','MIYAH SELATAN'),('9109022','9109','IRERES'),('9109023','9109','WILHEM ROUMBOUTS'),('9109030','9109','ABUN'),('9109040','9109','KWOOR'),('9109041','9109','TOBOUW'),('9109042','9109','KWESEFO'),('9109050','9109','SAUSAPOR'),('9109051','9109','BIKAR'),('9109060','9109','YEMBUN'),('9109061','9109','BAMUSBAMA'),('9109070','9109','KEBAR'),('9109071','9109','KEBAR TIMUR'),('9109072','9109','KEBAR SELATAN'),('9109073','9109','MANEKAR'),('9109080','9109','SENOPI'),('9109081','9109','MAWABUAN'),('9109090','9109','AMBERBAKEN'),('9109091','9109','MPUR'),('9109092','9109','AMBERBAKEN BARAT'),('9109100','9109','MUBARNI / ARFU'),('9109110','9109','MORAID'),('9109111','9109','SELEMKAI'),('9110010','9110','AITINYO BARAT/ATHABU'),('9110011','9110','AYAMARU SELATAN JAYA'),('9110020','9110','AITINYO'),('9110021','9110','AITINYO TENGAH'),('9110030','9110','AIFAT SELATAN'),('9110031','9110','AIFAT TIMUR SELATAN'),('9110040','9110','AIFAT'),('9110050','9110','AITINYO UTARA'),('9110051','9110','AITINYO RAYA'),('9110060','9110','AYAMARU TIMUR'),('9110061','9110','AYAMARU TIMUR SELATAN'),('9110070','9110','AYAMARU'),('9110071','9110','AYAMARU SELATAN'),('9110072','9110','AYAMARU JAYA'),('9110073','9110','AYAMARU TENGAH'),('9110074','9110','AYAMARU BARAT'),('9110080','9110','AYAMARU UTARA'),('9110081','9110','AYAMARU UTARA TIMUR'),('9110090','9110','MARE'),('9110091','9110','MARE SELATAN'),('9110100','9110','AIFAT UTARA'),('9110110','9110','AIFAT TIMUR'),('9110111','9110','AIFAT TIMUR TENGAH'),('9110112','9110','AIFAT TIMUR JAUH'),('9111010','9111','TAHOTA'),('9111020','9111','DATARAN ISIM'),('9111030','9111','NENEI'),('9111040','9111','MOMI WAREN'),('9111050','9111','RANSIKI'),('9111060','9111','ORANSBARI'),('9112010','9112','DIDOHU'),('9112020','9112','SURUREY'),('9112030','9112','ANGGI GIDA'),('9112040','9112','MEMBEY'),('9112050','9112','ANGGI'),('9112060','9112','TAIGE'),('9112070','9112','HINGK'),('9112080','9112','MENYAMBOUW'),('9112090','9112','CATUBOUW'),('9112100','9112','TESTEGA'),('9171010','9171','SORONG BARAT'),('9171011','9171','SORONG KEPULAUAN'),('9171012','9171','MALADUM MES'),('9171020','9171','SORONG TIMUR'),('9171021','9171','SORONG UTARA'),('9171022','9171','SORONG'),('9171023','9171','SORONG MANOI'),('9171024','9171','KLAURUNG'),('9171025','9171','MALAIMSIMSA'),('9171026','9171','SORONG KOTA'),('9401010','9401','KIMAAM'),('9401011','9401','WAAN'),('9401012','9401','TABONJI'),('9401013','9401','ILWAYAB'),('9401020','9401','OKABA'),('9401021','9401','TUBANG'),('9401022','9401','NGGUTI'),('9401023','9401','KAPTEL'),('9401030','9401','KURIK'),('9401031','9401','MALIND'),('9401032','9401','ANIMHA'),('9401040','9401','MERAUKE'),('9401041','9401','SEMANGGA'),('9401042','9401','TANAH MIRING'),('9401043','9401','JAGEBOB'),('9401044','9401','SOTA'),('9401045','9401','NAUKENJERAI'),('9401050','9401','MUTING'),('9401051','9401','ELIGOBEL'),('9401052','9401','ULILIN'),('9402110','9402','WAMENA'),('9402111','9402','ASOLOKOBAL'),('9402112','9402','WALELAGAMA'),('9402113','9402','TRIKORA'),('9402114','9402','NAPUA'),('9402115','9402','WALAIK'),('9402116','9402','WOUMA'),('9402117','9402','WALESI'),('9402118','9402','ASOTIPO'),('9402119','9402','MAIMA'),('9402120','9402','HUBIKOSI'),('9402121','9402','PELEBAGA'),('9402122','9402','IBELE'),('9402123','9402','TAILAREK'),('9402124','9402','HUBIKIAK'),('9402180','9402','ASOLOGAIMA'),('9402181','9402','MUSATFAK'),('9402182','9402','SILO KARNO DOGA'),('9402183','9402','PYRAMID'),('9402184','9402','MULIAMA'),('9402185','9402','WAME'),('9402190','9402','KURULU'),('9402191','9402','USILIMO'),('9402192','9402','WITA WAYA'),('9402193','9402','LIBAREK'),('9402194','9402','WADANGKU'),('9402195','9402','PISUGI'),('9402220','9402','BOLAKME'),('9402221','9402','WOLLO'),('9402222','9402','YALENGGA'),('9402223','9402','TAGIME'),('9402224','9402','MOLAGALOME'),('9402225','9402','TAGINERI'),('9402226','9402','BUGI'),('9402227','9402','BPIRI'),('9402228','9402','KORAGI'),('9402611','9402','ITLAY HASIGE'),('9402612','9402','SIEPKOSI'),('9402614','9402','POPUGOBA'),('9403080','9403','KAUREH'),('9403081','9403','AIRU'),('9403082','9403','YAPSI'),('9403140','9403','KEMTUK'),('9403150','9403','KEMTUK GRESI'),('9403151','9403','GRESI SELATAN'),('9403160','9403','NIMBORAN'),('9403161','9403','NIMBORAN TIMUR / NAMBLONG'),('9403170','9403','NIMBOKRANG'),('9403180','9403','UNURUM GUAY'),('9403200','9403','DEMTA'),('9403201','9403','YOKARI'),('9403210','9403','DEPAPRE'),('9403211','9403','RAVENIRARA'),('9403220','9403','SENTANI BARAT'),('9403221','9403','WAIBU'),('9403230','9403','SENTANI'),('9403231','9403','EBUNGFAU'),('9403240','9403','SENTANI TIMUR'),('9404050','9404','UWAPA'),('9404051','9404','MENOU'),('9404052','9404','DIPA'),('9404060','9404','YAUR'),('9404061','9404','TELUK UMAR'),('9404070','9404','WANGGAR'),('9404071','9404','NABIRE BARAT'),('9404080','9404','NABIRE'),('9404081','9404','TELUK KIMI'),('9404090','9404','NAPAN'),('9404091','9404','MAKIMI'),('9404092','9404','WAPOGA'),('9404093','9404','KEPULAUAN MOORA'),('9404100','9404','SIRIWO'),('9404110','9404','YARO'),('9408040','9408','YAPEN TIMUR'),('9408041','9408','PANTURA YAPEN'),('9408042','9408','TELUK AMPIMOI'),('9408043','9408','RAIMBAWI'),('9408044','9408','PULAU KURUDU'),('9408050','9408','ANGKAISERA'),('9408051','9408','KEP. AMBAI'),('9408052','9408','YAWAKUKAT'),('9408060','9408','YAPEN SELATAN'),('9408061','9408','KOSIWO'),('9408062','9408','ANATAUREI'),('9408070','9408','YAPEN BARAT'),('9408071','9408','WONAWA'),('9408072','9408','PULAU YERUI'),('9408080','9408','POOM'),('9408081','9408','WINDESI'),('9409010','9409','NUMFOR BARAT'),('9409011','9409','ORKERI'),('9409020','9409','NUMFOR TIMUR'),('9409021','9409','BRUYADORI'),('9409022','9409','POIRU'),('9409030','9409','PADAIDO'),('9409031','9409','AIMANDO PADAIDO'),('9409040','9409','BIAK TIMUR'),('9409041','9409','ORIDEK'),('9409050','9409','BIAK KOTA'),('9409060','9409','SAMOFA'),('9409070','9409','YENDIDORI'),('9409080','9409','BIAK UTARA'),('9409081','9409','ANDEY'),('9409090','9409','WARSA'),('9409091','9409','YAWOSI'),('9409092','9409','BONDIFUAR'),('9409100','9409','BIAK BARAT'),('9409101','9409','SWANDIWE'),('9410030','9410','PANIAI TIMUR'),('9410031','9410','YATAMO'),('9410032','9410','KEBO'),('9410033','9410','PUGO DAGI'),('9410034','9410','WEGE MUKA'),('9410035','9410','WEGEE BINO'),('9410036','9410','YAGAI'),('9410040','9410','BIBIDA'),('9410041','9410','DUMADAMA'),('9410070','9410','ARADIDE'),('9410071','9410','EKADIDE'),('9410072','9410','AWEIDA'),('9410073','9410','FAJAR TIMUR'),('9410074','9410','TOPIYAI'),('9410080','9410','PANIAI BARAT'),('9410081','9410','SIRIWO'),('9410082','9410','MUYE'),('9410083','9410','NAKAMA'),('9410084','9410','TELUK DEYA'),('9410090','9410','BOGOBAIDA'),('9411040','9411','FAWI'),('9411041','9411','DAGAI'),('9411042','9411','KIYAGE'),('9411050','9411','MULIA'),('9411053','9411','YAMBI'),('9411054','9411','ILAMBURAWI'),('9411055','9411','MUARA'),('9411056','9411','PAGALEME'),('9411057','9411','GURAGE'),('9411058','9411','IRIMULI'),('9411060','9411','ILU'),('9411061','9411','TORERE'),('9411063','9411','YAMONERI'),('9411064','9411','WAEGI'),('9411065','9411','NUME'),('9411066','9411','NIOGA'),('9411067','9411','GUBUME'),('9411068','9411','TAGANOMBAK'),('9411070','9411','TINGGINAMBUT'),('9411071','9411','KALOME'),('9411072','9411','WANWI'),('9411080','9411','MEWOLUK'),('9411081','9411','LUMO'),('9411082','9411','MOLANIKIME'),('9411090','9411','YAMO'),('9411091','9411','DOKOME'),('9412010','9412','MIMIKA BARAT'),('9412011','9412','MIMIKA BARAT JAUH'),('9412012','9412','MIMIKA BARAT TENGAH'),('9412013','9412','AMAR'),('9412020','9412','MIMIKA TIMUR'),('9412021','9412','MIMIKA TENGAH'),('9412022','9412','MIMIKA TIMUR JAUH'),('9412030','9412','MIMIKA BARU'),('9412031','9412','KUALA KENCANA'),('9412032','9412','TEMBAGAPURA'),('9412033','9412','WANIA'),('9412034','9412','IWAKA'),('9412035','9412','KWAMKI NARAMA'),('9412040','9412','AGIMUGA'),('9412041','9412','JILA'),('9412042','9412','JITA'),('9412043','9412','ALAMA'),('9412044','9412','HOYA'),('9413010','9413','JAIR'),('9413011','9413','SUBUR'),('9413013','9413','KIA'),('9413020','9413','MINDIPTANA'),('9413021','9413','INIYANDIT'),('9413022','9413','KOMBUT'),('9413023','9413','SESNUK'),('9413030','9413','MANDOBO'),('9413031','9413','FOFI'),('9413032','9413','ARIMOP'),('9413040','9413','KOUH'),('9413041','9413','BOMAKIA'),('9413042','9413','FIRIWAGE'),('9413043','9413','MANGGELUM'),('9413044','9413','YANIRUMA'),('9413045','9413','KAWAGIT'),('9413046','9413','KOMBAY'),('9413050','9413','WAROPKO'),('9413051','9413','AMBATKWI'),('9413052','9413','NINATI'),('9414010','9414','NAMBIOMAN BAPAI'),('9414011','9414','MINYAMUR'),('9414020','9414','EDERA'),('9414021','9414','VENAHA'),('9414022','9414','SYAHCAME'),('9414023','9414','BAMGI'),('9414024','9414','YAKOMI'),('9414030','9414','OBAA'),('9414031','9414','PASSUE'),('9414040','9414','HAJU'),('9414050','9414','ASSUE'),('9414060','9414','CITAKMITAK'),('9414061','9414','KAIBAR'),('9414062','9414','PASSUE BAWAH'),('9414063','9414','TI-ZAIN'),('9415010','9415','PANTAI KASUARI'),('9415011','9415','KOPAY'),('9415012','9415','DER KOUMUR'),('9415013','9415','SAFAN'),('9415014','9415','AWYU'),('9415020','9415','FAYIT'),('9415021','9415','ASWI'),('9415030','9415','ATSY'),('9415031','9415','SIRETS'),('9415032','9415','AYIP'),('9415033','9415','BECTBAMU'),('9415040','9415','SUATOR'),('9415041','9415','KOLF BRAZA'),('9415042','9415','JOUTU'),('9415043','9415','KOROWAY BULUANOP'),('9415050','9415','AKAT'),('9415051','9415','JETSY'),('9415060','9415','AGATS'),('9415070','9415','SAWA ERMA'),('9415071','9415','SURU-SURU'),('9415072','9415','UNIR SIRAU'),('9415073','9415','JOERAT'),('9415074','9415','PULAU TIGA'),('9416010','9416','KURIMA'),('9416011','9416','MUSAIK'),('9416013','9416','DEKAI'),('9416014','9416','OBIO'),('9416015','9416','PASEMA'),('9416016','9416','AMUMA'),('9416017','9416','SURU-SURU'),('9416018','9416','WUSAMA'),('9416019','9416','SILIMO'),('9416020','9416','NINIA'),('9416021','9416','HOLUWON'),('9416022','9416','LOLAT'),('9416023','9416','LANGDA'),('9416024','9416','BOMELA'),('9416025','9416','SUNTAMON'),('9416026','9416','SOBAHAM'),('9416027','9416','KORUPUN'),('9416028','9416','SELA'),('9416029','9416','KWELAMDUA'),('9416030','9416','ANGGRUK'),('9416031','9416','PANGGEMA'),('9416032','9416','WALMA'),('9416033','9416','KOSAREK'),('9416034','9416','UBAHAK'),('9416035','9416','NALCA'),('9416036','9416','PULDAMA'),('9416037','9416','NIPSAN'),('9416041','9416','SAMENAGE'),('9416042','9416','TANGMA'),('9416043','9416','SOBA'),('9416044','9416','MUGI'),('9416045','9416','YOGOSEM'),('9416046','9416','KAYO'),('9416047','9416','SUMO'),('9416048','9416','HOGIO'),('9416049','9416','UKHA'),('9416051','9416','WERIMA'),('9416052','9416','SOLOIKMA'),('9416053','9416','SERADALA'),('9416054','9416','KABIANGGAMA'),('9416055','9416','KWIKMA'),('9416056','9416','HILIPUK'),('9416057','9416','YAHULIAMBUT'),('9416058','9416','HEREAPINI'),('9416059','9416','UBALIHI'),('9416061','9416','TALAMBO'),('9416062','9416','PRONGGOLI'),('9416063','9416','ENDOMEN'),('9416065','9416','KONA'),('9416066','9416','DURAM'),('9416067','9416','DIRWEMNA'),('9417010','9417','IWUR'),('9417011','9417','KAWOR'),('9417012','9417','TARUP'),('9417013','9417','AWINBON'),('9417020','9417','OKSIBIL'),('9417021','9417','PEPERA'),('9417022','9417','ALEMSOM'),('9417023','9417','SERAMBAKON'),('9417024','9417','KOLOMDOL'),('9417025','9417','OKSOP'),('9417026','9417','OK BAPE'),('9417027','9417','OK AON'),('9417030','9417','BORME'),('9417031','9417','BIME'),('9417032','9417','EPUMEK'),('9417033','9417','WEIME'),('9417034','9417','PAMEK'),('9417035','9417','NONGME'),('9417036','9417','BATANI'),('9417040','9417','OKBI'),('9417041','9417','ABOY'),('9417042','9417','OKBAB'),('9417043','9417','TEIRAPLU'),('9417044','9417','YEFTA'),('9417050','9417','KIWIROK'),('9417051','9417','KIWIROK TIMUR'),('9417052','9417','OKSEBANG'),('9417053','9417','OKHIKA'),('9417054','9417','OKLIP'),('9417055','9417','OKSAMOL'),('9417056','9417','OKBEMTA'),('9417060','9417','BATOM'),('9417061','9417','MURKIM'),('9417062','9417','MOFINOP'),('9418010','9418','KANGGIME'),('9418011','9418','WONIKI'),('9418012','9418','NABUNAGE'),('9418013','9418','GILUBANDU'),('9418014','9418','WAKUO'),('9418015','9418','AWEKU'),('9418016','9418','BOGONUK'),('9418020','9418','KARUBAGA'),('9418021','9418','GOYAGE'),('9418022','9418','WUNIN'),('9418023','9418','KONDAGA'),('9418024','9418','NELAWI'),('9418025','9418','KUARI'),('9418026','9418','LIANOGOMA'),('9418027','9418','BIUK'),('9418030','9418','BOKONDINI'),('9418031','9418','BOKONERI'),('9418032','9418','BEWANI'),('9418040','9418','KEMBU'),('9418041','9418','WINA'),('9418042','9418','UMAGI'),('9418043','9418','PANAGA'),('9418044','9418','POGANERI'),('9418045','9418','KAMBONERI'),('9418046','9418','AIR GARAM'),('9418047','9418','DOW'),('9418048','9418','WARI / TAIYEVE'),('9418049','9418','EGIAM'),('9418051','9418','NUNGGAWI'),('9418060','9418','KUBU'),('9418061','9418','ANAWI'),('9418062','9418','WUGI'),('9418070','9418','GEYA'),('9418071','9418','WENAM'),('9418080','9418','NUMBA'),('9418081','9418','KAI'),('9418090','9418','DUNDU'),('9418100','9418','GUNDAGI'),('9418110','9418','TIMORI'),('9418121','9418','YUNERI'),('9418125','9418','TAGIME'),('9418126','9418','DANIME'),('9418127','9418','YUKO'),('9418541','9418','TELENGGEME'),('9418542','9418','GIKA'),('9418543','9418','TAGINERI'),('9419021','9419','PANTAI TIMUR BAGIAN BARAT'),('9419022','9419','PANTAI TIMUR'),('9419024','9419','SUNGAI BIRI'),('9419025','9419','VEEN'),('9419031','9419','BONGGO'),('9419032','9419','BONGGO TIMUR'),('9419033','9419','BONGGO BARAT'),('9419040','9419','TOR ATAS'),('9419041','9419','ISMARI'),('9419050','9419','SARMI'),('9419051','9419','SARMI TIMUR'),('9419052','9419','SARMI SELATAN'),('9419053','9419','SOBEY'),('9419054','9419','MUARA TOR'),('9419055','9419','VERKAM'),('9419060','9419','PANTAI BARAT'),('9419061','9419','APAWER HULU'),('9419062','9419','APAWER HILIR'),('9419063','9419','APAWER TENGAH'),('9420010','9420','WEB'),('9420011','9420','TOWE'),('9420012','9420','YAFFI'),('9420020','9420','SENGGI'),('9420021','9420','KAISENAR'),('9420030','9420','WARIS'),('9420040','9420','ARSO'),('9420041','9420','ARSO TIMUR'),('9420042','9420','ARSO BARAT'),('9420043','9420','MANNEM'),('9420050','9420','SKANTO'),('9426010','9426','WAROPEN BAWAH'),('9426011','9426','INGGERUS'),('9426012','9426','UREI FAISEI'),('9426013','9426','OUDATE'),('9426014','9426','WAPOGA'),('9426020','9426','MASIREI'),('9426021','9426','RISEI SAYATI'),('9426022','9426','DEMBA'),('9426023','9426','SOYOI MAMBAI'),('9426024','9426','WONTI'),('9426030','9426','WALANI'),('9426040','9426','KIRIHI'),('9427010','9427','SUPIORI SELATAN'),('9427011','9427','KEPULAUAN ARURI'),('9427020','9427','SUPIORI UTARA'),('9427021','9427','SUPIORI BARAT'),('9427030','9427','SUPIORI TIMUR'),('9428030','9428','WAROPEN ATAS'),('9428031','9428','BENUKI'),('9428032','9428','SAWAI'),('9428040','9428','MAMBERAMO ILIR'),('9428050','9428','MAMBERAMO TENGAH'),('9428051','9428','IWASO'),('9428060','9428','MAMBERAMO TENGAH TIMUR'),('9428070','9428','ROFAER'),('9428080','9428','MAMBERAMO ULU'),('9429010','9429','WOSAK'),('9429011','9429','MOBA'),('9429012','9429','PIJA'),('9429013','9429','KORA'),('9429020','9429','KENYAM'),('9429021','9429','MBUWA TENGAH'),('9429022','9429','KREPKURI'),('9429023','9429','EMBETPEM'),('9429030','9429','GESELMA'),('9429031','9429','KILMID'),('9429032','9429','YENGGELO'),('9429033','9429','ALAMA'),('9429034','9429','MEBOROK'),('9429040','9429','MAPENDUMA'),('9429041','9429','KROPTAK'),('9429042','9429','PARO'),('9429043','9429','KEGAYEM'),('9429050','9429','MUGI'),('9429051','9429','YAL'),('9429052','9429','MAM'),('9429060','9429','YIGI'),('9429061','9429','DAL'),('9429062','9429','NIRKURI'),('9429063','9429','INIKGAL'),('9429070','9429','MBUWA'),('9429071','9429','INIYE'),('9429072','9429','WUTPAGA'),('9429073','9429','NENGGEANGIN'),('9429074','9429','MBULMU YALMA'),('9429080','9429','GEAREK'),('9429081','9429','PASIR PUTIH'),('9429082','9429','WUSI'),('9430010','9430','MAKKI'),('9430011','9430','GUPURA'),('9430012','9430','KOLAWA'),('9430013','9430','GELOK BEAM'),('9430014','9430','AWINA'),('9430020','9430','PIRIME'),('9430021','9430','BUGUK GONA'),('9430022','9430','MILIMBO'),('9430023','9430','GOLLO'),('9430024','9430','WIRINGGABUT'),('9430030','9430','TIOM'),('9430031','9430','NOGI'),('9430032','9430','MOKONI'),('9430033','9430','NINAME'),('9430034','9430','YIGINUA'),('9430035','9430','TIOM OLLO'),('9430036','9430','YUGUNWI'),('9430037','9430','LANNYNA'),('9430040','9430','BALINGGA'),('9430041','9430','BALINGGA BARAT'),('9430042','9430','BRUWA'),('9430043','9430','AYUMNATI'),('9430050','9430','KUYAWAGE'),('9430051','9430','WANO BARAT'),('9430060','9430','MALAGAINERI'),('9430061','9430','MELAGAI'),('9430070','9430','TIOMNERI'),('9430071','9430','WEREKA'),('9430080','9430','DIMBA'),('9430081','9430','KELULOME'),('9430082','9430','NIKOGWE'),('9430090','9430','GAMELIA'),('9430091','9430','KARU'),('9430092','9430','YILUK'),('9430093','9430','GUNA'),('9430100','9430','POGA'),('9430101','9430','MUARA'),('9431010','9431','KOBAKMA'),('9431020','9431','ILUGWA'),('9431030','9431','KELILA'),('9431040','9431','ERAGAYAM'),('9431050','9431','MEGAMBILIS'),('9432010','9432','WELAREK'),('9432020','9432','APALAPSILI'),('9432030','9432','ABENAHO'),('9432040','9432','ELELIM'),('9432050','9432','BENAWA'),('9433010','9433','AGADUGUME'),('9433011','9433','LAMBEWI'),('9433012','9433','ONERI'),('9433020','9433','GOME'),('9433021','9433','AMUNGKALPIA'),('9433022','9433','GOME UTARA'),('9433023','9433','ERELMAKAWIA'),('9433030','9433','ILAGA'),('9433031','9433','ILAGA UTARA'),('9433032','9433','MABUGI'),('9433033','9433','OMUKIA'),('9433040','9433','SINAK'),('9433041','9433','SINAK BARAT'),('9433042','9433','MAGEÁBUME'),('9433043','9433','YUGUMUAK'),('9433050','9433','POGOMA'),('9433051','9433','KEMBRU'),('9433052','9433','BINA'),('9433060','9433','WANGBE'),('9433061','9433','OGAMANIM'),('9433070','9433','BEOGA'),('9433071','9433','BEOGA BARAT'),('9433072','9433','BEOGA TIMUR'),('9433080','9433','DOUFO'),('9433081','9433','DERVOS'),('9434010','9434','SUKIKAI SELATAN'),('9434020','9434','PIYAIYE'),('9434030','9434','MAPIA BARAT'),('9434040','9434','MAPIA TENGAH'),('9434050','9434','MAPIA'),('9434060','9434','DOGIYAI'),('9434070','9434','KAMU SELATAN'),('9434080','9434','KAMU'),('9434090','9434','KAMU TIMUR'),('9434100','9434','KAMU UTARA'),('9435010','9435','HOMEYO'),('9435020','9435','SUGAPA'),('9435030','9435','HITADIPA'),('9435040','9435','AGISIGA'),('9435050','9435','BIANDOGA'),('9435060','9435','WANDAI'),('9436010','9436','KAPIRAYA'),('9436020','9436','TIGI BARAT'),('9436030','9436','TIGI'),('9436040','9436','TIGI TIMUR'),('9436050','9436','BOWOBADO'),('9471010','9471','MUARA TAMI'),('9471020','9471','ABEPURA'),('9471021','9471','HERAM'),('9471030','9471','JAYAPURA SELATAN'),('9471040','9471','JAYAPURA UTARA');
/*!40000 ALTER TABLE `tb_kecamatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kelengkapan`
--

DROP TABLE IF EXISTS `tb_kelengkapan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kelengkapan` (
  `id_kelengkapan` varchar(20) NOT NULL,
  `id_berkas_mhs` int(11) DEFAULT NULL,
  `draft` text,
  `urlsourcecode` text,
  `poster` text,
  `lembar_pengesahan` text,
  PRIMARY KEY (`id_kelengkapan`),
  KEY `fk_memiliki_berkas_mhs` (`id_berkas_mhs`),
  CONSTRAINT `fk_memiliki_berkas_mhs` FOREIGN KEY (`id_berkas_mhs`) REFERENCES `tb_berkas_mhs` (`id_berkas_mhs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kelengkapan`
--

LOCK TABLES `tb_kelengkapan` WRITE;
/*!40000 ALTER TABLE `tb_kelengkapan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kelengkapan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kerjasama_perusahaan`
--

DROP TABLE IF EXISTS `tb_kerjasama_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kerjasama_perusahaan` (
  `id_kerjasama_perusahaan` varchar(50) NOT NULL,
  `nama_kerjasama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kerjasama_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kerjasama_perusahaan`
--

LOCK TABLES `tb_kerjasama_perusahaan` WRITE;
/*!40000 ALTER TABLE `tb_kerjasama_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kerjasama_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_konsultasi_bimbingan`
--

DROP TABLE IF EXISTS `tb_konsultasi_bimbingan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_konsultasi_bimbingan` (
  `id_konsultasi_bimbingan` varchar(30) NOT NULL,
  `id_dosen_bimbingan_mhs` varchar(30) DEFAULT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `tanggal_konsultasi_bimbingan` date DEFAULT NULL,
  `materi_konsultasi_bimbingan` text,
  `tanggapan_dosen` text,
  PRIMARY KEY (`id_konsultasi_bimbingan`),
  KEY `fk_memiliki_konsultasi_bimbingan_dosen_mhs` (`id_dosen_bimbingan_mhs`),
  KEY `fk_memiliki_status_konsultasi_bimbingan` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_konsultasi_bimbingan_dosen_mhs` FOREIGN KEY (`id_dosen_bimbingan_mhs`) REFERENCES `tb_dosen_bimbingan_mhs` (`id_dosen_bimbingan_mhs`),
  CONSTRAINT `fk_memiliki_status_konsultasi_bimbingan` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_konsultasi_bimbingan`
--

LOCK TABLES `tb_konsultasi_bimbingan` WRITE;
/*!40000 ALTER TABLE `tb_konsultasi_bimbingan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_konsultasi_bimbingan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kop_surat`
--

DROP TABLE IF EXISTS `tb_kop_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kop_surat` (
  `id_kop_surat` varchar(30) NOT NULL,
  `nama_kop_surat` varchar(100) DEFAULT NULL,
  `extensi_kop_surat` varchar(10) DEFAULT NULL,
  `tanggal_upload_kop_surat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kop_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kop_surat`
--

LOCK TABLES `tb_kop_surat` WRITE;
/*!40000 ALTER TABLE `tb_kop_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kop_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layout_surat`
--

DROP TABLE IF EXISTS `tb_layout_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layout_surat` (
  `id_layout_surat` varchar(20) NOT NULL,
  `jenis_layout_surat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_layout_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layout_surat`
--

LOCK TABLES `tb_layout_surat` WRITE;
/*!40000 ALTER TABLE `tb_layout_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_layout_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_level`
--

DROP TABLE IF EXISTS `tb_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `id_master_level` varchar(20) DEFAULT NULL,
  `nama_level` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_level`),
  KEY `fk_mempunyai_master_level` (`id_master_level`),
  CONSTRAINT `fk_mempunyai_master_level` FOREIGN KEY (`id_master_level`) REFERENCES `tb_master_level` (`id_master_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_level`
--

LOCK TABLES `tb_level` WRITE;
/*!40000 ALTER TABLE `tb_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mahasiswa`
--

DROP TABLE IF EXISTS `tb_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `id_tahun_akademik` varchar(50) DEFAULT NULL,
  `id_program_studi` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama_mahasiswa` varchar(100) DEFAULT NULL,
  `alamat_mhs` text,
  `jenis_kelamin_mhs` varchar(15) DEFAULT NULL,
  `email_mhs` varchar(255) DEFAULT NULL,
  `tempat_lahir_mhs` varchar(100) DEFAULT NULL,
  `tanggal_lahir_mhs` date DEFAULT NULL,
  `no_hp_mahasiswa` varchar(50) DEFAULT NULL,
  `nama_orangtua_mhs` varchar(100) DEFAULT NULL,
  `no_hp_orangtua_mhs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `fk_memiliki_mhs_ps` (`id_program_studi`),
  KEY `fk_mempunyai_mhs` (`id_tahun_akademik`),
  CONSTRAINT `fk_memiliki_mhs_ps` FOREIGN KEY (`id_program_studi`) REFERENCES `tb_program_studi` (`id_program_studi`),
  CONSTRAINT `fk_mempunyai_mhs` FOREIGN KEY (`id_tahun_akademik`) REFERENCES `tahun_akademik` (`id_tahun_akademik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mahasiswa`
--

LOCK TABLES `tb_mahasiswa` WRITE;
/*!40000 ALTER TABLE `tb_mahasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_master_level`
--

DROP TABLE IF EXISTS `tb_master_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_master_level` (
  `id_master_level` varchar(20) NOT NULL,
  `nama_master_level` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_master_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_master_level`
--

LOCK TABLES `tb_master_level` WRITE;
/*!40000 ALTER TABLE `tb_master_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_master_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mhs_pilih_perusahaan`
--

DROP TABLE IF EXISTS `tb_mhs_pilih_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mhs_pilih_perusahaan` (
  `id_mahasiswa_perusahaan` varchar(30) NOT NULL,
  `id_transaksi_surat_mhs` varchar(20) DEFAULT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `id_perusahaan` varchar(50) DEFAULT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `no_balasan_surat` varchar(50) DEFAULT NULL,
  `tanggal_balasan_surat` date DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa_perusahaan`),
  KEY `fk_memilih_mhs_perusahaan` (`nim`),
  KEY `fk_memiliki_perusahaan_mhs` (`id_perusahaan`),
  KEY `fk_memiliki_pilihan_perusahaan` (`id_transaksi_surat_mhs`),
  KEY `fk_memiliki_pilih_ststus_perusahaan` (`id_status_pkl`),
  CONSTRAINT `fk_memilih_mhs_perusahaan` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`),
  CONSTRAINT `fk_memiliki_perusahaan_mhs` FOREIGN KEY (`id_perusahaan`) REFERENCES `tb_perusahaan` (`id_perusahaan`),
  CONSTRAINT `fk_memiliki_pilih_ststus_perusahaan` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_pilihan_perusahaan` FOREIGN KEY (`id_transaksi_surat_mhs`) REFERENCES `tb_transaksi_surat_mhs` (`id_transaksi_surat_mhs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mhs_pilih_perusahaan`
--

LOCK TABLES `tb_mhs_pilih_perusahaan` WRITE;
/*!40000 ALTER TABLE `tb_mhs_pilih_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs_pilih_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_monev`
--

DROP TABLE IF EXISTS `tb_monev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_monev` (
  `id_monev` varchar(30) NOT NULL,
  `id_dosen_bimbingan_mhs` varchar(30) DEFAULT NULL,
  `nip_nik` varchar(20) DEFAULT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_monev`),
  KEY `fk_memiliki_dosen_bimbingan_mhs_monev` (`id_dosen_bimbingan_mhs`),
  KEY `fk_memiliki_dosen_monev` (`nip_nik`),
  KEY `fk_memiliki_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_dosen_bimbingan_mhs_monev` FOREIGN KEY (`id_dosen_bimbingan_mhs`) REFERENCES `tb_dosen_bimbingan_mhs` (`id_dosen_bimbingan_mhs`),
  CONSTRAINT `fk_memiliki_dosen_monev` FOREIGN KEY (`nip_nik`) REFERENCES `tb_pegawai` (`nip_nik`),
  CONSTRAINT `fk_memiliki_mhs_pilih_perusahaan` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_monev`
--

LOCK TABLES `tb_monev` WRITE;
/*!40000 ALTER TABLE `tb_monev` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_monev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_negara`
--

DROP TABLE IF EXISTS `tb_negara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_negara` (
  `id_negara` varchar(30) NOT NULL,
  `nama_negara` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_negara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_negara`
--

LOCK TABLES `tb_negara` WRITE;
/*!40000 ALTER TABLE `tb_negara` DISABLE KEYS */;
INSERT INTO `tb_negara` VALUES ('1','Indonesia');
/*!40000 ALTER TABLE `tb_negara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nilai_isi_surat`
--

DROP TABLE IF EXISTS `tb_nilai_isi_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_nilai_isi_surat` (
  `id_nilai_isi_surat` varchar(20) NOT NULL,
  `id_isi_surat` varchar(20) DEFAULT NULL,
  `nilai_isi_surat` text,
  PRIMARY KEY (`id_nilai_isi_surat`),
  KEY `fk_memiliki_nilai_isi_surat` (`id_isi_surat`),
  CONSTRAINT `fk_memiliki_nilai_isi_surat` FOREIGN KEY (`id_isi_surat`) REFERENCES `tb_isi_surat` (`id_isi_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nilai_isi_surat`
--

LOCK TABLES `tb_nilai_isi_surat` WRITE;
/*!40000 ALTER TABLE `tb_nilai_isi_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nilai_isi_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nilai_komponen`
--

DROP TABLE IF EXISTS `tb_nilai_komponen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_nilai_komponen` (
  `id_nilai_komponen` varchar(20) NOT NULL,
  `komponen_nilai` varchar(100) DEFAULT NULL,
  `bobot` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nilai_komponen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nilai_komponen`
--

LOCK TABLES `tb_nilai_komponen` WRITE;
/*!40000 ALTER TABLE `tb_nilai_komponen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nilai_komponen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nilai_seminar`
--

DROP TABLE IF EXISTS `tb_nilai_seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_nilai_seminar` (
  `id_nilai_seminar` varchar(20) NOT NULL,
  `nilai_seminar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nilai_seminar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nilai_seminar`
--

LOCK TABLES `tb_nilai_seminar` WRITE;
/*!40000 ALTER TABLE `tb_nilai_seminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nilai_seminar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pangkat_golongan`
--

DROP TABLE IF EXISTS `tb_pangkat_golongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pangkat_golongan` (
  `id_pangkat_golongan` varchar(30) NOT NULL,
  `nama_golongan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pangkat_golongan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pangkat_golongan`
--

LOCK TABLES `tb_pangkat_golongan` WRITE;
/*!40000 ALTER TABLE `tb_pangkat_golongan` DISABLE KEYS */;
INSERT INTO `tb_pangkat_golongan` VALUES ('ANG1','Pesawat Terbang'),('ANG2','Kapal Laut'),('ANG3','Mobil Pribadi'),('ANG4','Angkutan Umum'),('ANG5','Motor'),('ANG6','Transportasi Online');
/*!40000 ALTER TABLE `tb_pangkat_golongan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pegawai`
--

DROP TABLE IF EXISTS `tb_pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pegawai` (
  `nip_nik` varchar(20) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `id_pangkat_golongan` varchar(30) DEFAULT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `alamat_pegawai` text,
  `jk_pegawai` varchar(20) DEFAULT NULL,
  `email_pegawai` varchar(100) DEFAULT NULL,
  `tempat_lahir_pegawai` varchar(100) DEFAULT NULL,
  `tanggal_lahir_pegawai` date DEFAULT NULL,
  `no_hp_pegawai` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nip_nik`),
  KEY `fk_memiliki_pangkat_golongan` (`id_pangkat_golongan`),
  KEY `fk_memiliki_status_pegawai` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_pangkat_golongan` FOREIGN KEY (`id_pangkat_golongan`) REFERENCES `tb_pangkat_golongan` (`id_pangkat_golongan`),
  CONSTRAINT `fk_memiliki_status_pegawai` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pegawai`
--

LOCK TABLES `tb_pegawai` WRITE;
/*!40000 ALTER TABLE `tb_pegawai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pembimbing_lapangan`
--

DROP TABLE IF EXISTS `tb_pembimbing_lapangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pembimbing_lapangan` (
  `id_pembimbing_lapangan` varchar(20) NOT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `id_perusahaan` varchar(50) DEFAULT NULL,
  `nama_pembimbing` varchar(100) DEFAULT NULL,
  `jabatan_pembimbing` varchar(50) DEFAULT NULL,
  `alamat_pembimbing` text,
  `telepon_pembimbing` varchar(15) DEFAULT NULL,
  `hp_pembimbing` varchar(15) DEFAULT NULL,
  `nama_hrd` varchar(100) DEFAULT NULL,
  `no_hrd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pembimbing_lapangan`),
  KEY `fk_memiliki_pembimbing` (`id_perusahaan`),
  KEY `fk_memiliki_pembimbing_lapangan_status` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_pembimbing` FOREIGN KEY (`id_perusahaan`) REFERENCES `tb_perusahaan` (`id_perusahaan`),
  CONSTRAINT `fk_memiliki_pembimbing_lapangan_status` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pembimbing_lapangan`
--

LOCK TABLES `tb_pembimbing_lapangan` WRITE;
/*!40000 ALTER TABLE `tb_pembimbing_lapangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pembimbing_lapangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perusahaan`
--

DROP TABLE IF EXISTS `tb_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_perusahaan` (
  `id_perusahaan` varchar(50) NOT NULL,
  `id_negara` varchar(30) DEFAULT NULL,
  `id_provinsi` varchar(30) DEFAULT NULL,
  `id_kerjasama_perusahaan` varchar(50) DEFAULT NULL,
  `id_kecamatan` varchar(30) DEFAULT NULL,
  `id_kab_kota` varchar(30) DEFAULT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `id_program_studi` varchar(50) DEFAULT NULL,
  `nama_perusahaan` varchar(100) DEFAULT NULL,
  `alamat_perusahaan` text,
  `telepon_perusahaan` varchar(20) DEFAULT NULL,
  `long_perusahaan` varchar(10) DEFAULT NULL,
  `lat_perusahaan` varchar(10) DEFAULT NULL,
  `kuota_pkl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_perusahaan`),
  KEY `fk_memiliki_kab_kota` (`id_kab_kota`),
  KEY `fk_memiliki_kecamatan_kota` (`id_kecamatan`),
  KEY `fk_memiliki_kerjasama_perusahaan` (`id_kerjasama_perusahaan`),
  KEY `fk_memiliki_negara` (`id_negara`),
  KEY `fk_memiliki_provinsi_negara` (`id_provinsi`),
  KEY `fk_memiliki_ps_perusahaan` (`id_program_studi`),
  KEY `fk_memiliki_status_perusahaan` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_kab_kota` FOREIGN KEY (`id_kab_kota`) REFERENCES `tb_kabupaten_kota` (`id_kab_kota`),
  CONSTRAINT `fk_memiliki_kecamatan_kota` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id_kecamatan`),
  CONSTRAINT `fk_memiliki_kerjasama_perusahaan` FOREIGN KEY (`id_kerjasama_perusahaan`) REFERENCES `tb_kerjasama_perusahaan` (`id_kerjasama_perusahaan`),
  CONSTRAINT `fk_memiliki_negara` FOREIGN KEY (`id_negara`) REFERENCES `tb_negara` (`id_negara`),
  CONSTRAINT `fk_memiliki_provinsi_negara` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`),
  CONSTRAINT `fk_memiliki_ps_perusahaan` FOREIGN KEY (`id_program_studi`) REFERENCES `tb_program_studi` (`id_program_studi`),
  CONSTRAINT `fk_memiliki_status_perusahaan` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perusahaan`
--

LOCK TABLES `tb_perusahaan` WRITE;
/*!40000 ALTER TABLE `tb_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perusahaan_sementara`
--

DROP TABLE IF EXISTS `tb_perusahaan_sementara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_perusahaan_sementara` (
  `id_perusahaan_sementara` varchar(30) NOT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `id_status_pkl` varchar(30) DEFAULT NULL,
  `nama_perusahaan_sementara` varchar(100) DEFAULT NULL,
  `alamat_perusahaan_sementara` text,
  `telepon_perusahaan_sementara` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_perusahaan_sementara`),
  KEY `fk_memiliki_perusahaan_sementara` (`nim`),
  KEY `fk_memiliki_status_perusahaan_sementara` (`id_status_pkl`),
  CONSTRAINT `fk_memiliki_perusahaan_sementara` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`),
  CONSTRAINT `fk_memiliki_status_perusahaan_sementara` FOREIGN KEY (`id_status_pkl`) REFERENCES `tb_status_pkl` (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perusahaan_sementara`
--

LOCK TABLES `tb_perusahaan_sementara` WRITE;
/*!40000 ALTER TABLE `tb_perusahaan_sementara` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_perusahaan_sementara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_program_studi`
--

DROP TABLE IF EXISTS `tb_program_studi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_program_studi` (
  `id_program_studi` varchar(50) NOT NULL,
  `nama_program_studi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_program_studi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_program_studi`
--

LOCK TABLES `tb_program_studi` WRITE;
/*!40000 ALTER TABLE `tb_program_studi` DISABLE KEYS */;
INSERT INTO `tb_program_studi` VALUES ('PST1','Teknik Informatika'),('PST2','Teknologi Industri Pertanian'),('PST3','Mesin Otomotif'),('PST4','Akuntansi');
/*!40000 ALTER TABLE `tb_program_studi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_provinsi`
--

DROP TABLE IF EXISTS `tb_provinsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_provinsi` (
  `id_provinsi` varchar(30) NOT NULL,
  `id_negara` varchar(30) DEFAULT NULL,
  `nama_provinsi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_provinsi`),
  KEY `fk_memiliki_provinsi` (`id_negara`),
  CONSTRAINT `fk_memiliki_provinsi` FOREIGN KEY (`id_negara`) REFERENCES `tb_negara` (`id_negara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_provinsi`
--

LOCK TABLES `tb_provinsi` WRITE;
/*!40000 ALTER TABLE `tb_provinsi` DISABLE KEYS */;
INSERT INTO `tb_provinsi` VALUES ('11','1','ACEH'),('12','1','SUMATERA UTARA'),('13','1','SUMATERA BARAT'),('14','1','RIAU'),('15','1','JAMBI'),('16','1','SUMATERA SELATAN'),('17','1','BENGKULU'),('18','1','LAMPUNG'),('19','1','KEPULAUAN BANGKA BELITUNG'),('21','1','KEPULAUAN RIAU'),('31','1','DKI JAKARTA'),('32','1','JAWA BARAT'),('33','1','JAWA TENGAH'),('34','1','DI YOGYAKARTA'),('35','1','JAWA TIMUR'),('36','1','BANTEN'),('51','1','BALI'),('52','1','NUSA TENGGARA BARAT'),('53','1','NUSA TENGGARA TIMUR'),('61','1','KALIMANTAN BARAT'),('62','1','KALIMANTAN TENGAH'),('63','1','KALIMANTAN SELATAN'),('64','1','KALIMANTAN TIMUR'),('65','1','KALIMANTAN UTARA'),('71','1','SULAWESI UTARA'),('72','1','SULAWESI TENGAH'),('73','1','SULAWESI SELATAN'),('74','1','SULAWESI TENGGARA'),('75','1','GORONTALO'),('76','1','SULAWESI BARAT'),('81','1','MALUKU'),('82','1','MALUKU UTARA'),('91','1','PAPUA BARAT'),('94','1','PAPUA');
/*!40000 ALTER TABLE `tb_provinsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ruang_seminar`
--

DROP TABLE IF EXISTS `tb_ruang_seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ruang_seminar` (
  `id_ruang_seminar` varchar(20) NOT NULL,
  `nama_ruang_seminar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ruang_seminar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ruang_seminar`
--

LOCK TABLES `tb_ruang_seminar` WRITE;
/*!40000 ALTER TABLE `tb_ruang_seminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ruang_seminar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_status_pkl`
--

DROP TABLE IF EXISTS `tb_status_pkl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_status_pkl` (
  `id_status_pkl` varchar(30) NOT NULL,
  `nama_status_pkl` varchar(100) DEFAULT NULL,
  `keterangan_status_pkl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_status_pkl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_status_pkl`
--

LOCK TABLES `tb_status_pkl` WRITE;
/*!40000 ALTER TABLE `tb_status_pkl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_status_pkl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_kuisioner_mhs`
--

DROP TABLE IF EXISTS `tb_transaksi_kuisioner_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_kuisioner_mhs` (
  `id_transaksi_kuisioner_mhs` varchar(20) NOT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  `id_jenis_kuisioner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_kuisioner_mhs`),
  KEY `fk_memiliki_pilih_mhs_transaksi_kuisioner_mhs` (`id_mahasiswa_perusahaan`),
  KEY `fk_memiliki_transaksi_kuisioner_mhs` (`id_jenis_kuisioner`),
  CONSTRAINT `fk_memiliki_pilih_mhs_transaksi_kuisioner_mhs` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_transaksi_kuisioner_mhs` FOREIGN KEY (`id_jenis_kuisioner`) REFERENCES `tb_jenis_kuisioner` (`id_jenis_kuisioner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_kuisioner_mhs`
--

LOCK TABLES `tb_transaksi_kuisioner_mhs` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_kuisioner_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_kuisioner_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_kuisioner_pem_lap`
--

DROP TABLE IF EXISTS `tb_transaksi_kuisioner_pem_lap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_kuisioner_pem_lap` (
  `id_transaksi_kuisioner_pem_lap` varchar(20) NOT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  `id_jenis_kuisioner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_kuisioner_pem_lap`),
  KEY `fk_memiliki_jenis_transaksi_kuisioner_pem_lap` (`id_jenis_kuisioner`),
  KEY `fk_memiliki_mhs_pilih_transaksi_kuisioner_pem_lap` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_jenis_transaksi_kuisioner_pem_lap` FOREIGN KEY (`id_jenis_kuisioner`) REFERENCES `tb_jenis_kuisioner` (`id_jenis_kuisioner`),
  CONSTRAINT `fk_memiliki_mhs_pilih_transaksi_kuisioner_pem_lap` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_kuisioner_pem_lap`
--

LOCK TABLES `tb_transaksi_kuisioner_pem_lap` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_kuisioner_pem_lap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_kuisioner_pem_lap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_monev`
--

DROP TABLE IF EXISTS `tb_transaksi_monev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_monev` (
  `id_transaksi_monev` varchar(30) NOT NULL,
  `id_monev` varchar(30) DEFAULT NULL,
  `id_jenis_kuisioner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_monev`),
  KEY `fk_memiliki_hasil_monev` (`id_monev`),
  KEY `fk_memiliki_jenis_transaksi_kuisioner` (`id_jenis_kuisioner`),
  CONSTRAINT `fk_memiliki_hasil_monev` FOREIGN KEY (`id_monev`) REFERENCES `tb_monev` (`id_monev`),
  CONSTRAINT `fk_memiliki_jenis_transaksi_kuisioner` FOREIGN KEY (`id_jenis_kuisioner`) REFERENCES `tb_jenis_kuisioner` (`id_jenis_kuisioner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_monev`
--

LOCK TABLES `tb_transaksi_monev` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_monev` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_monev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_nilai`
--

DROP TABLE IF EXISTS `tb_transaksi_nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_nilai` (
  `id_transaksi_nilai` varchar(20) NOT NULL,
  `id_nilai_komponen` varchar(20) DEFAULT NULL,
  `id_jenis_nilai` varchar(20) DEFAULT NULL,
  `id_nilai_seminar` varchar(20) DEFAULT NULL,
  `niilai_akhir` float DEFAULT NULL,
  `nilai` float DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_nilai`),
  KEY `fk_memiliki_jenis_nilai` (`id_jenis_nilai`),
  KEY `fk_memiliki_komponen_nilai` (`id_nilai_komponen`),
  KEY `fk_memiliki_nilai_seminar` (`id_nilai_seminar`),
  CONSTRAINT `fk_memiliki_jenis_nilai` FOREIGN KEY (`id_jenis_nilai`) REFERENCES `tb_jenis_nilai` (`id_jenis_nilai`),
  CONSTRAINT `fk_memiliki_komponen_nilai` FOREIGN KEY (`id_nilai_komponen`) REFERENCES `tb_nilai_komponen` (`id_nilai_komponen`),
  CONSTRAINT `fk_memiliki_nilai_seminar` FOREIGN KEY (`id_nilai_seminar`) REFERENCES `tb_nilai_seminar` (`id_nilai_seminar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_nilai`
--

LOCK TABLES `tb_transaksi_nilai` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_nilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_surat_dosen`
--

DROP TABLE IF EXISTS `tb_transaksi_surat_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_surat_dosen` (
  `id_transaksi_surat_dosen` varchar(20) NOT NULL,
  `id_program_studi` varchar(50) DEFAULT NULL,
  `nip_nik` varchar(20) DEFAULT NULL,
  `id_jenis_surat` varchar(20) DEFAULT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  `id_ttd_pimpinan` varchar(30) DEFAULT NULL,
  `id_kop_surat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_surat_dosen`),
  KEY `fk_memiliki_jenis_surat_dsn` (`id_jenis_surat`),
  KEY `fk_memiliki_kop_surat_dosen` (`id_kop_surat`),
  KEY `fk_memiliki_pilihan_perusahaan_dsn` (`id_mahasiswa_perusahaan`),
  KEY `fk_memiliki_transaksi_surat` (`nip_nik`),
  KEY `fk_memiliki_transaksi_surat_dosen` (`id_program_studi`),
  KEY `fk_memiliki_ttd_pemimpin` (`id_ttd_pimpinan`),
  CONSTRAINT `fk_memiliki_jenis_surat_dsn` FOREIGN KEY (`id_jenis_surat`) REFERENCES `tb_jenis_surat` (`id_jenis_surat`),
  CONSTRAINT `fk_memiliki_kop_surat_dosen` FOREIGN KEY (`id_kop_surat`) REFERENCES `tb_kop_surat` (`id_kop_surat`),
  CONSTRAINT `fk_memiliki_pilihan_perusahaan_dsn` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_transaksi_surat` FOREIGN KEY (`nip_nik`) REFERENCES `tb_pegawai` (`nip_nik`),
  CONSTRAINT `fk_memiliki_transaksi_surat_dosen` FOREIGN KEY (`id_program_studi`) REFERENCES `tb_program_studi` (`id_program_studi`),
  CONSTRAINT `fk_memiliki_ttd_pemimpin` FOREIGN KEY (`id_ttd_pimpinan`) REFERENCES `tb_ttd_pimpinan` (`id_ttd_pimpinan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_surat_dosen`
--

LOCK TABLES `tb_transaksi_surat_dosen` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_surat_dosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_surat_dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_surat_kelulusan`
--

DROP TABLE IF EXISTS `tb_transaksi_surat_kelulusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_surat_kelulusan` (
  `id_transaksi_surat_kelulusan` varchar(20) NOT NULL,
  `id_jenis_surat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_surat_kelulusan`),
  KEY `fk_memiliki_jenis_surat_lls` (`id_jenis_surat`),
  CONSTRAINT `fk_memiliki_jenis_surat_lls` FOREIGN KEY (`id_jenis_surat`) REFERENCES `tb_jenis_surat` (`id_jenis_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_surat_kelulusan`
--

LOCK TABLES `tb_transaksi_surat_kelulusan` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_surat_kelulusan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_surat_kelulusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi_surat_mhs`
--

DROP TABLE IF EXISTS `tb_transaksi_surat_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi_surat_mhs` (
  `id_transaksi_surat_mhs` varchar(20) NOT NULL,
  `id_ttd_pimpinan` varchar(30) DEFAULT NULL,
  `id_program_studi` varchar(50) DEFAULT NULL,
  `id_mahasiswa_perusahaan` varchar(30) DEFAULT NULL,
  `id_jenis_surat` varchar(20) DEFAULT NULL,
  `id_kop_surat` varchar(30) DEFAULT NULL,
  `nim` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_surat_mhs`),
  KEY `fk_memiliki_jenis_surat_mhs` (`id_jenis_surat`),
  KEY `fk_memiliki_kop_surat_mhs` (`id_kop_surat`),
  KEY `fk_memiliki_pilihan_perusahaan2` (`id_mahasiswa_perusahaan`),
  KEY `fk_memiliki_program_studi_mhs` (`id_program_studi`),
  KEY `fk_memiliki_transaksi_surat_mhs` (`nim`),
  KEY `fk_memiliki_ttd_pimpinan_mhs` (`id_ttd_pimpinan`),
  CONSTRAINT `fk_memiliki_jenis_surat_mhs` FOREIGN KEY (`id_jenis_surat`) REFERENCES `tb_jenis_surat` (`id_jenis_surat`),
  CONSTRAINT `fk_memiliki_kop_surat_mhs` FOREIGN KEY (`id_kop_surat`) REFERENCES `tb_kop_surat` (`id_kop_surat`),
  CONSTRAINT `fk_memiliki_pilihan_perusahaan2` FOREIGN KEY (`id_mahasiswa_perusahaan`) REFERENCES `tb_mhs_pilih_perusahaan` (`id_mahasiswa_perusahaan`),
  CONSTRAINT `fk_memiliki_program_studi_mhs` FOREIGN KEY (`id_program_studi`) REFERENCES `tb_program_studi` (`id_program_studi`),
  CONSTRAINT `fk_memiliki_transaksi_surat_mhs` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`),
  CONSTRAINT `fk_memiliki_ttd_pimpinan_mhs` FOREIGN KEY (`id_ttd_pimpinan`) REFERENCES `tb_ttd_pimpinan` (`id_ttd_pimpinan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi_surat_mhs`
--

LOCK TABLES `tb_transaksi_surat_mhs` WRITE;
/*!40000 ALTER TABLE `tb_transaksi_surat_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksi_surat_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ttd_pimpinan`
--

DROP TABLE IF EXISTS `tb_ttd_pimpinan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ttd_pimpinan` (
  `id_ttd_pimpinan` varchar(30) NOT NULL,
  `nip_nik_ttd_pimpinan` varchar(50) DEFAULT NULL,
  `nama_ttd_pimpinan` varchar(100) DEFAULT NULL,
  `jabatan_tdd_pimpinan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ttd_pimpinan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ttd_pimpinan`
--

LOCK TABLES `tb_ttd_pimpinan` WRITE;
/*!40000 ALTER TABLE `tb_ttd_pimpinan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ttd_pimpinan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_validasi_nilai`
--

DROP TABLE IF EXISTS `tb_validasi_nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_validasi_nilai` (
  `id_validasi_nilai` varchar(20) NOT NULL,
  `id_transaksi_nilai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_validasi_nilai`),
  KEY `fk_memiliki_validasi_nilai` (`id_transaksi_nilai`),
  CONSTRAINT `fk_memiliki_validasi_nilai` FOREIGN KEY (`id_transaksi_nilai`) REFERENCES `tb_transaksi_nilai` (`id_transaksi_nilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_validasi_nilai`
--

LOCK TABLES `tb_validasi_nilai` WRITE;
/*!40000 ALTER TABLE `tb_validasi_nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_validasi_nilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_waktu_seminar`
--

DROP TABLE IF EXISTS `tb_waktu_seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_waktu_seminar` (
  `id_waktu_seminar` varchar(20) NOT NULL,
  `id_ruang_seminar` varchar(20) DEFAULT NULL,
  `waktu_seminar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_waktu_seminar`),
  KEY `fk_memiliki_ruang_waktu_seminar` (`id_ruang_seminar`),
  CONSTRAINT `fk_memiliki_ruang_waktu_seminar` FOREIGN KEY (`id_ruang_seminar`) REFERENCES `tb_ruang_seminar` (`id_ruang_seminar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_waktu_seminar`
--

LOCK TABLES `tb_waktu_seminar` WRITE;
/*!40000 ALTER TABLE `tb_waktu_seminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_waktu_seminar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-05  9:20:04
