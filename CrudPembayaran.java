/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Pembayaran;
import model.Pembeli;

/**
 *
 * @author Dedy Aji
 */
public class CrudPembayaran {

    private Koneksi knk = new Koneksi();

    public int getSequence() throws SQLException {
        String sql = "SELECT last_number FROM user_sequences WHERE sequence_name = 'ID_PEMBAYARAN'";
        ResultSet rs = knk.GetData(sql);
        rs.next();
        return rs.getInt("last_number");
    }

    public void create(int idPembeli, int idEs, int qty, int totalHarga, int totalBayar, int kembalian) {
        String tanggalString = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
        String sql = "INSERT INTO pembayaran_06963 VALUES (id_pembayaran.NEXTVAL, " + idPembeli + ", " + idEs + ", TO_DATE('" + tanggalString
                + "', 'dd/MM/yyyy'), " + qty + ", " + totalHarga + ", " + totalBayar + ", " + kembalian + ")";
        knk.ManipulasiData(sql);
    }

    public ArrayList<Pembayaran> read() throws SQLException {
        ArrayList<Pembayaran> arrPembayaran = new ArrayList<>();
        String sql = "SELECT a.id_pembayaran, a.id_es_lilin, a.tanggal, "
                + "a.qty, a.total_harga, a.total_bayar, a.kembalian, "
                + "b.id_pembeli, b.nama_pembeli, b.alamat_pembeli "
                + "FROM pembayaran_06963 a "
                + "JOIN pembeli_06963 b ON a.id_pembeli = b.id_pembeli";
        ResultSet rs = knk.GetData(sql);
        while (rs.next()) {
            Pembeli pb = new Pembeli();
            pb.setIdPembeli(rs.getInt("id_pembeli"));
            pb.setNamaPembeli(rs.getString("nama_pembeli"));
            pb.setAlamatPembeli(rs.getString("alamat_pembeli"));

            Pembayaran p = new Pembayaran();
            p.setIdPembayaran(rs.getInt("id_pembayaran"));
            p.setPembeli(pb);
            p.setIdEsLilin(rs.getInt("id_es_lilin"));
            p.setTanggal(rs.getDate("tanggal"));
            p.setQty(rs.getInt("qty"));
            p.setTotalHarga(rs.getInt("total_harga"));
            p.setTotalBayar(rs.getInt("total_bayar"));
            p.setKembalian(rs.getInt("kembalian"));

            arrPembayaran.add(p);
        }
        return arrPembayaran;
    }

}
