/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.16 : Database - db_isna
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tbl_absensi` */

CREATE TABLE `tbl_absensi` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `kary_id` int(11) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `absen` char(1) DEFAULT NULL,
  `alasan` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_cabang` */

CREATE TABLE `tbl_cabang` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `kode_cabang` varchar(100) NOT NULL,
  `cabang` varchar(100) DEFAULT NULL,
  `alamat` text,
  PRIMARY KEY (`kode_cabang`),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_inventory` */

CREATE TABLE `tbl_inventory` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `barang` varchar(100) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `satuan` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `kode_cabang` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_jabatan` */

CREATE TABLE `tbl_jabatan` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jabatan` varchar(100) NOT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_jabatan`),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_karyawan` */

CREATE TABLE `tbl_karyawan` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `IDKary` varchar(100) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `kode_jabatan` varchar(100) DEFAULT NULL,
  `kode_cabang` varchar(100) DEFAULT NULL,
  `gaji` int(11) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDKary`),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_kasir_penjualan` */

CREATE TABLE `tbl_kasir_penjualan` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `kode_penjualan` varchar(200) NOT NULL,
  `kode_customer` varchar(100) DEFAULT NULL,
  `kode_cabang` varchar(100) DEFAULT NULL,
  `waktu_jual` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `cust_dp` int(11) DEFAULT NULL,
  `cust_bayar` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_penjualan`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_master_customer` */

CREATE TABLE `tbl_master_customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `kode_customer` varchar(100) NOT NULL,
  `nama_customer` varchar(255) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_customer`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_master_finishing` */

CREATE TABLE `tbl_master_finishing` (
  `id_finishing` int(11) NOT NULL AUTO_INCREMENT,
  `finishing` varchar(100) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_finishing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_master_jeniskertas` */

CREATE TABLE `tbl_master_jeniskertas` (
  `id_jenis_kertas` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kertas` varchar(100) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_kertas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_menu` */

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_penjualan_detail` */

CREATE TABLE `tbl_penjualan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_penjualan` varchar(100) NOT NULL,
  `kode_customer` varchar(100) DEFAULT NULL,
  `id_jenis_kertas` int(11) DEFAULT NULL,
  `jumlah_kertas` int(11) DEFAULT NULL,
  `sisi_kertas` int(11) DEFAULT NULL,
  `id_finishing` int(11) DEFAULT NULL,
  `jumlah_finishing` int(11) DEFAULT NULL,
  `sisi_finishing` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_user_access` */

CREATE TABLE `tbl_user_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `kode_jabatan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_user_login` */

CREATE TABLE `tbl_user_login` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `IDKary` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `history_transaksi` */

DROP TABLE IF EXISTS `history_transaksi`;

/*!50001 CREATE TABLE  `history_transaksi`(
 `no` int(11) ,
 `kode_penjualan` varchar(200) ,
 `kode_customer` varchar(100) ,
 `kode_cabang` varchar(100) ,
 `waktu_jual` datetime ,
 `total` int(11) ,
 `diskon` int(11) ,
 `cust_dp` int(11) ,
 `cust_bayar` int(11) ,
 `status` int(11) ,
 `user_id` varchar(100) ,
 `jenis_kertas` varchar(100) ,
 `finishing` varchar(100) ,
 `jumlah_kertas` int(11) ,
 `sisi_kertas` int(11) ,
 `jumlah_finishing` int(11) ,
 `sisi_finishing` int(11) ,
 `subtotal` int(11) ,
 `nama_customer` varchar(255) ,
 `IDKary` varchar(100) ,
 `nama` varchar(255) 
)*/;

/*Table structure for table `view_access` */

DROP TABLE IF EXISTS `view_access`;

/*!50001 CREATE TABLE  `view_access`(
 `id` int(11) ,
 `menu_id` int(11) ,
 `kode_jabatan` varchar(100) ,
 `menu` varchar(100) ,
 `jabatan` varchar(100) 
)*/;

/*View structure for view history_transaksi */

/*!50001 DROP TABLE IF EXISTS `history_transaksi` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `history_transaksi` AS select `a`.`no` AS `no`,`a`.`kode_penjualan` AS `kode_penjualan`,`a`.`kode_customer` AS `kode_customer`,`a`.`kode_cabang` AS `kode_cabang`,`a`.`waktu_jual` AS `waktu_jual`,`a`.`total` AS `total`,`a`.`diskon` AS `diskon`,`a`.`cust_dp` AS `cust_dp`,`a`.`cust_bayar` AS `cust_bayar`,`a`.`status` AS `status`,`a`.`user_id` AS `user_id`,`f`.`jenis_kertas` AS `jenis_kertas`,`g`.`finishing` AS `finishing`,`b`.`jumlah_kertas` AS `jumlah_kertas`,`b`.`sisi_kertas` AS `sisi_kertas`,`b`.`jumlah_finishing` AS `jumlah_finishing`,`b`.`sisi_finishing` AS `sisi_finishing`,`b`.`subtotal` AS `subtotal`,`c`.`nama_customer` AS `nama_customer`,`d`.`IDKary` AS `IDKary`,`e`.`nama` AS `nama` from ((((((`tbl_kasir_penjualan` `a` join `tbl_penjualan_detail` `b` on((`a`.`kode_penjualan` = `b`.`kode_penjualan`))) join `tbl_master_customer` `c` on((`a`.`kode_customer` = `c`.`kode_customer`))) join `tbl_user_login` `d` on((`a`.`user_id` = `d`.`username`))) join `tbl_karyawan` `e` on((`d`.`IDKary` = `e`.`IDKary`))) join `tbl_master_jeniskertas` `f` on((`b`.`id_jenis_kertas` = `f`.`id_jenis_kertas`))) join `tbl_master_finishing` `g` on((`b`.`id_finishing` = `g`.`id_finishing`))) */;

/*View structure for view view_access */

/*!50001 DROP TABLE IF EXISTS `view_access` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_access` AS select `a`.`id` AS `id`,`a`.`menu_id` AS `menu_id`,`a`.`kode_jabatan` AS `kode_jabatan`,`b`.`menu` AS `menu`,`c`.`jabatan` AS `jabatan` from ((`tbl_user_access` `a` join `tbl_menu` `b` on((`a`.`menu_id` = `b`.`id_menu`))) join `tbl_jabatan` `c` on((`a`.`kode_jabatan` = `c`.`kode_jabatan`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
