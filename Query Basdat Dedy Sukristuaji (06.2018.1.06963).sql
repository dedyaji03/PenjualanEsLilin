MODUL 1 :
CREATE TABLESPACE penjual06963
datafile 'E:\Basdat\Praktikum\penjual06963.dbf'
size 30M;
CREATE USER dedyaji_06963
IDENTIFIED BY system
DEFAULT TABLESPACE penjual06963
QUOTA 30M ON penjual06963;
GRANT ALL PRIVILEGES TO dedyaji_06963;
CONN dedyaji_06963/system
CREATE TABLE Penjual_06963
(
Id_penjual NUMBER(38)
Nama_penjual VARCHAR2(100)
Alamat_penjual VARCHAR2(100)
No_telepon NUMBER(12)
constraint PK_penjual primary key (Id_penjual)
);
CREATE TABLE Pembeli_06963
(
Id_pembeli NUMBER(38)
Nama_penjual VARCHAR2(100)
Alamat_penjual VARCHAR2(100)
constraint PK_pembeli primary key (Id_pembeli)
);
CREATE TABLE Pembayaran_06963
(
Id_pembayaran NUMBER(38)
Id_pembeli NUMBER(38)
Id_es_lilin NUMBER(38)
Tanggal DATE
QTY NUMBER(38)
Total_harga NUMBER(38)
Total_bayar NUMBER(38)
Kembalian NUMBER(38)
constraint PK_pembayaran primary key (Id_pembayaran)
);
ALTER TABLE pembayaran_06963
ADD CONSTRAINT fk_pembeli FOREIGN KEY
(id_pembeli)
REFERENCES pembeli_06963(id_pembeli);
CREATE SEQUENCE id_penjual
MINVALUE 1
MAXVALUE 9999
START WITH 1
INCREMENT BY 1
CACHE 20;
INSERT INTO penjual_06963
(id_penjual, nama_penjual, alamat,
no_telepon) VALUES
(id_penjual.NEXTVAL, 'Dedy', 'Surabaya',
'085645789123');
ALTER TABLE penjual_06963
RENAME COLUMN alamat TO 06963_alamat;
RENAME COLUMN alamat TO 06963_alamat
ALTER TABLE penjual_06963
ADD CONSTRAINT unique_no_telepon
UNIQUE (no_telepon);
ALTER TABLE pembayaran_06963
MODIFY(qty NUMBER(38));

MODUL 2 :
insert into penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘11111’, ‘Dedy’, ‘Surabaya’,
‘08123456789’);
insert into penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘11112’, ‘Vino’, ‘Sidoarjo’,
‘08134567891’);
 insert all
into penjual_06963 (id_penjual, nama_penjual,
alamat_penjual, no_telepon) values (‘11113’,
‘Vina’, ‘Sidoarjo’, ‘08145678912’)
into penjual_06963 (id_penjual, nama_penjual,
alamat_penjual, no_telepon) values (‘11114’,
‘Yuli’, ‘Gresik’, ‘08156789123’)
into penjual_06963 (id_penjual, nama_penjual,
alamat_penjual, no_telepon) values (‘11115’,
‘Agus’, ‘Malang’, ‘08167891234’)
select 1 from dual;
 insert into penjual_06963 values
(id_penjual.NEXTVAL, ‘Dedy’, ‘Surabaya’,
‘08123456789’);
 update penjual_06963 set nama_penjual =
‘Dono’ where id_penjual like ‘%11115%’;
 update penjual_06963 set nama_penjual =
‘Tina’ where id_penjual like ‘%11114%’;
 update penjual_06963 set nama_penjual =
‘Sari’ where id_penjual like ‘%11113%’;
 update penjual_06963 set nama_penjual =
‘Riko’ where id_penjual like ‘%11112%’;
 update penjual_06963 set nama_penjual =
‘Yuli’ where id_penjual like ‘%11111%’;
 delete from penjual_06963 where
id_penjual <11112 and alamat_penjual =
’Surabaya’;
savepoint point1;
savepoint point2;
commit;
rollback to point1;
rollback to point2;
select * from penjual_06963 order by
id_penjual asc;
select alamat_penjual from penjual_06963
group by alamat_penjual;

MODUL 3 :
insert into Penjual (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values ('1', 'Fani', 'Surabaya',
'123456789');
insert into Penjual (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values ('2', 'David', 'Surabaya',
'234567891');
insert into Penjual (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values ('3', 'Farhan', 'Sidoarjo',
'345678912');
insert into Penjual (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values ('4', 'Bambang', 'Gresik',
'456789123');
insert into Penjual (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values ('5', 'Marwah', 'Sidoarjo',
'567891234');
insert all
into Pembeli (id_pembeli, nama_pembeli,
alamat_pembeli) values ('1', 'Santo',
'Gresik')
into Pembeli (id_pembeli, nama_pembeli,
alamat_pembeli) values ('2', 'Fajar',
'Malang')
into Pembeli (id_pembeli, nama_pembeli,
alamat_pembeli) values ('3', 'Hartanto',
'Malang')
into Pembeli (id_pembeli, nama_pembeli,
alamat_pembeli) values ('4', 'Haris',
'Sidoarjo')
into Pembeli (id_pembeli, nama_pembeli,
alamat_pembeli) values ('5', 'Vardan',
'Surabaya')
select 1 from dual;
insert all
into Pembayaran (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
('1', '1', '1', to_date('01/01/2019',
'dd/mm/yyyy'), '5', '10000', '20000','10000')
into Pembayaran (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
('2', '2', '2', to_date('01/01/2019',
'dd/mm/yyyy'), '10', '20000', '20000','0')
into Pembayaran (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
('3', '3', '3', to_date('02/01/2019',
'dd/mm/yyyy'), '7', '14000', '15000','1000')
into Pembayaran (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
('4', '4', '4', to_date('02/01/2019',
'dd/mm/yyyy'), '5', '10000', '50000','40000')
into Pembayaran (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
('5', '5', '5', to_date('03/01/2019',
'dd/mm/yyyy'), '15', '30000',
'50000','20000')
select 1 from dual;
select id_pembayaran, MAX(total_harga)
AS
terbanyak, MIN(total_harga) AS terendah
FROM pembayaran
group by id_pembayaran;
select id_pembayaran, sum(total_bayar)
AS bayar_pembelian from pembayaran
where id_pembayaran = 3 group by
id_pembayaran;
select id_pembayaran,(select
sum(total_bayar) from pembayaran)
AS jumlah_bayar,
(select avg(total_bayar) from
pembayaran)
AS rata2_bayar from pembayaran;
select id_pembayaran,
count(id_pembayaran) AS total_bayar from
pembayaran
where id_pembayaran = 3 AND
id_pembayaran = 4 OR id_pembayaran = 2 group
by id_pembayaran;
select id_pembayaran,(select
MAX(kembalian) AS tertinggi from pembayaran)
AS tertinggi1,
(select MIN(kembalian) AS terendah from
pembayaran)
AS terendah1 from pembayaran;
select id_pembayaran,(select COUNT
(total_bayar) AS total_pembayaran
from pembayaran
where kembalian LIKE '%0%' OR
total_bayar LIKE '%0%' AND id_pembayaran <=5)
AS total_pembayaran from pembayaran;
select id_pembayaran,(select
sum(total_bayar) AS total_pembayaran FROM
pembayaran)
AS total_pembayaran from pembayaran;
select id_pembayaran,(select
avg(total_bayar) AS rata2_pembayaran FROM
pembayaran)
AS rata2_pembayaran FROM pembayaran;
select id_pembayaran,(select
avg(total_bayar) AS rata2_pembayaran FROM
pembayaran)
AS total_pembayaran FROM pembayaran
group by id_pembayaran;
select id_pembayaran FROM pembayaran
where id_pembayaran < (select
sum(id_pembayaran) AS data from pembayaran);
select id_pembayaran,(select
MAX(kembalian) FROM pembayaran
where id_pembayaran < (select
sum(total_harga) from pembayaran
where id_pembayaran < (select
avg(total_bayar) from pembayaran)))
AS kembali_tertinggi from pembayaran
;

MODUL 4 :
insert into Penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘1’, ‘Fani’, ‘Surabaya’,
‘1234567899’);
insert into Penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘2’, ‘Dava’, ‘Surabaya’,
‘1234567898’);
insert into Penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘3’, ‘Clarisa’, ‘Surabaya’,
‘1234567897’);
insert into Penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘4’, ‘Clara’, ‘Sidoarjo’,
‘1234567896’);
insert into Penjual_06963 (id_penjual,
nama_penjual, alamat_penjual, no_telepon)
values (‘5’, ‘Jarwo’, ‘Sidoarjo’,
‘1234567895’);
insert all
into Pembeli_06963 (id_pembeli, nama_pembeli,
alamat_pembeli) values (‘1’, ‘Claudia’,
‘Sidoarjo’)
into Pembeli_06963 (id_pembeli, nama_pembeli,
alamat_pembeli) values (‘2’, ‘Junet’,
‘Sidoarjo’)
into Pembeli_06963 (id_pembeli, nama_pembeli,
alamat_pembeli) values (‘3’, ‘Karmin’,
‘Gresik’)
into Pembeli_06963 (id_pembeli, nama_pembeli,
alamat_pembeli) values (‘4’, ‘Aguz’,
‘Gresik’)
into Pembeli_06963 (id_pembeli, nama_pembeli,
alamat_pembeli) values (‘5’, ‘Soleh’,
‘Gresik’)
select 1 from dual;
insert all
into Pembayaran_06963 (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
(‘1’, ‘1’, ‘1’, to_date(‘04/04/2020’,
‘dd/mm/yyyy’), ‘10’, ‘20000’, ‘20000’, ‘0’)
into Pembayaran_06963 (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
(‘2’, ‘2’, ‘2’, to_date(‘04/04/2020’,
‘dd/mm/yyyy’), ‘5’, ‘10000’, ‘20000’,
‘10000’)
into Pembayaran_06963 (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
(‘3’, ‘3’, ‘3’, to_date(‘05/05/2020’,
‘dd/mm/yyyy’), ‘15’, ‘30000’, ‘50000’,
‘20000’)
into Pembayaran_06963 (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
(‘4’, ‘4’, ‘4’, to_date(‘05/04/2020’,
‘dd/mm/yyyy’), ‘2’, ‘4000’, ‘5000’, ‘1000’)
into Pembayaran_06963 (id_pembayaran,
id_pembeli, id_es_lilin, tanggal, qty,
total_harga, total_bayar, kembalian) values
(‘5’, ‘5’, ‘5’, to_date(‘06/04/2020’,
‘dd/mm/yyyy’), ‘7’, ‘14000’, ‘20000’, ‘6000’)
select 1 from dual;
select a.total_harga, a.total_bayar,
a.kembalian, b.tanggal
from pembayaran_06963 a join
pembayaran_06963 b
on a.id_pembayaran = b.id_pembayaran
where rownum <=10;
select a.nama_pembeli, a.alamat_pembeli,
b.total_bayar, b.total_harga, b.kembalian,
c.tanggal, c.qty
from pembeli_06963 a
left join pembayaran_06963 b
on a.id_pembeli = b.id_pembeli
left join pembayaran_06963 c
on b.id_pembayaran = c.id_pembayaran
where rownum >= (select min(id_pembayaran)
from pembayaran_06963);
select a.tanggal, a.qty, b.total_bayar,
b.total_harga, b.kembalian, c.nama_pembeli,
c.alamat_pembeli
from pembayaran_06963 a
right join pembayaran_06963 b
on a.id_pembayaran = b.id_pembayaran
right join pembeli_06963 c
on b.id_pembeli = c.id_pembeli
where rownum >= (select min(id_pembayaran)
from pembayaran_06963
where rownum < (select max(id_pembayaran)
from pembayaran_06963)
where rownum >= (select avg(id_pembayaran)
from pembayaran_06963));
create view list_pembeli_06963 as
select * from pembeli_06963;
insert into list_pembeli_06963 values (‘6’,
‘Suep’, ‘Malang’);
create view list_pembayaran2a as
select a.nama_pembeli, a.alamat_pembeli,
b.total_bayar, b.total_harga, b.kembalian,
c.tanggal, c.qty
from pembeli_06963 a
left join pembayaran_06963 b
on a,id_pembeli = b.id_pembeli
left join pembayaran_06963 c
on b.id_pembayaran = c.id_pembayaran
where rownum >= (select min(id_pembayaran)
from pembayaran_06963);
create view list_pembayaran2b as
select a.tanggal, a.qty, b.total_bayar,
b.total_harga, b.kembalian, c.nama_pembeli,
c.alamat_pembeli
from pembayaran_06963 a
right join pembayaran_06963 b
on a.id_pembayaran = b.id_pembayaran
right join pembeli_06963 c
on b.id_pembeli = c.id.pembeli
where rownum >= (select min(id_pembayaran)
from pembayaran_0696
where rownum >= (select max(id_pembayaran)
from pembayaran_06963)
or rownum <= (select avg(id_pembayaran) from
pembayaran_06963));
SELECT * FROM LIST_PEMBAYARAN2A;
SELECT * FROM LIST_PEMBAYARAN2B;

MODUL 5 :
package database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Koneksi {
 private Connection connect;
 private Statement db;
 public Koneksi() {
 try {

Class.forName("oracle.jdbc.driver.OracleDriver");
 System.out.println("Class Driver
Ditemukan !");
 try {
 connect =
DriverManager.getConnection("jdbc:oracle:thin:@localh
ost:1521:xe", "dedyaji_06963", "system");
 System.out.println("Koneksi Database
Sukses !");
 } catch (SQLException ex) {
 System.out.println("Koneksi Database
Gagal : " + ex);
 }
 } catch (ClassNotFoundException e) {
 System.out.println("Class Driver Tidak
Ditemukan : " + e);
 }
 }
public ResultSet GetData(String sql) {
 try {
 db =
connect.createStatement(ResultSet.TYPE_SCROLL_INSENSI
TIVE, ResultSet.CONCUR_UPDATABLE);
 return db.executeQuery(sql);
 } catch (SQLException e) {
 return null;
 }
 }
 public int ManipulasiData(String sql) {
 try {
 db = connect.createStatement();
 return db.executeUpdate(sql);
 } catch (SQLException e) {
 return 0;
 }
 }
}
package database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Penjual;
public class CrudPenjual {
 private Koneksi knk = new Koneksi();
 public int getSequence() throws SQLException {
 String sql = "SELECT last_number FROM
user_sequences WHERE sequence_name = 'ID_PENJUAL'";
 ResultSet rs = knk.GetData(sql);
 rs.next();
 return rs.getInt("last_number");
 }
 public void create(String namaPenjual, String
alamatPenjual, int noTelepon) {
 String sql = "INSERT INTO penjual_06963 VALUES
(id_penjual.NEXTVAL, '" + namaPenjual + "', '" +
alamatPenjual + "', " + noTelepon + ")";
 knk.ManipulasiData(sql);
 }
public ArrayList<Penjual> read() throws
SQLException {
 ArrayList<Penjual> arrPenjual = new
ArrayList<>();
 String sql = "SELECT * FROM penjual_06963";
 ResultSet rs = knk.GetData(sql);
while (rs.next()) {
 Penjual p = new Penjual();
 p.setIdPenjual(rs.getInt("id_penjual"));

p.setNamaPenjual(rs.getString("nama_penjual"));

p.setAlamatPenjual(rs.getString("alamat_penjual"));
 p.setNoTelepon(rs.getInt("no_telepon"));
 arrPenjual.add(p);
 }
 return arrPenjual;
 }
 public void update(int idPenjual, String
namaPenjual, String alamatPenjual, int noTelp) {
 String sql = "UPDATE penjual_06963 SET
nama_penjual = '" + namaPenjual + "', alamat_penjual
= '" + alamatPenjual + "', no_telepon = " + noTelp +
"' WHERE id_penjual = " + idPenjual;
 knk.ManipulasiData(sql);
 }
 public void delete(int idPenjual) {
 String sql = "DELETE FROM penjual_06963 WHERE
id_penjual = " + idPenjual;
 knk.ManipulasiData(sql);
 }
}
public ArrayList<Pembayaran> read() throws
SQLException {
 ArrayList<Pembayaran> arrPembayaran = new
ArrayList<>();
 String sql = "SELECT a.id_pembayaran,
a.id_es_lilin, a.tanggal, "
 + "a.qty, a.total_harga,
a.total_bayar, a.kembalian, "
 + "b.id_pembeli, b.nama_pembeli,
b.alamat_pembeli "
 + "FROM pembayaran_06963 a "
 + "JOIN pembeli_06963 b ON
a.id_pembeli = b.id_pembeli";
package view;
import database.CrudPembeli;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;
import model.Pembeli;
public class MenuInsertPembeli extends
javax.swing.JFrame {
 CrudPembeli crudPembeli = new CrudPembeli();
 public MenuInsertPembeli() throws SQLException {
 initComponents();
 this.setLayout(null);

this.tfId.setText(String.valueOf(crudPembeli.getSequen
ce()));
 this.tfId.setEnabled(false);
 this.showTabelPembeli();
 this.setVisible(true);
 }
 private void showTabelPembeli() throws
SQLException {
 DefaultTableModel dtmPembeli = new
DefaultTableModel(new String[]{"ID Pembeli", "Nama
Pembeli", "Alamat Pembeli"}, 0);
 ArrayList<Pembeli> arrPembeli =
crudPembeli.read();
 for (int i = 0; i < arrPembeli.size(); i++) {
 dtmPembeli.addRow(new
String[]{String.valueOf(arrPembeli.get(i).getIdPembeli
()), arrPembeli.get(i).getNamaPembeli(),

arrPembeli.get(i).getAlamatPembeli()});
}
 this.tblPembeli.setModel(dtmPembeli);
 }
private void
btnKembaliActionPerformed(java.awt.event.ActionEvent
evt) {
 MenuPenjual menuPenjual = new MenuPenjual();
 this.dispose();
 }
 private void
btnInsertActionPerformed(java.awt.event.ActionEvent
evt) {
 int idPembeli =
Integer.parseInt(tfId.getText());
 String namaPembeli = tfNama.getText();
 String alamat = tfAlamat.getText();
 crudPembeli.create(namaPembeli, alamat);
 try {
 this.showTabelPembeli();

tfId.setText(String.valueOf(crudPembeli.getSequence()
));
 } catch (SQLException ex) {

Logger.getLogger(MenuInsertPenjual.class.getName()).l
og(Level.SEVERE, null, ex);
 }
 }
 // Variables declaration - do not modify
 private javax.swing.JButton btnInsert;
 private javax.swing.JButton btnKembali;
 private javax.swing.JLabel jLabel1;
 private javax.swing.JLabel jLabel2;
 private javax.swing.JLabel jLabel3;
 private javax.swing.JLabel jLabel4;
 private javax.swing.JScrollPane jScrollPane1;
 private javax.swing.JTable tblPembeli;
 private javax.swing.JTextField tfAlamat;
 private javax.swing.JTextField tfId;
 private javax.swing.JTextField tfNama;
 // End of variables declaration
}

