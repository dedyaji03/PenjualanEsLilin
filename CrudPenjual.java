/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Penjual;

/**
 *
 * @author Dedy Aji
 */
public class CrudPenjual {

    private Koneksi knk = new Koneksi();

    public int getSequence() throws SQLException {
        String sql = "SELECT last_number FROM user_sequences WHERE sequence_name = 'ID_PENJUAL'";
        ResultSet rs = knk.GetData(sql);
        rs.next();
        return rs.getInt("last_number");
    }

    public void create(String namaPenjual, String alamatPenjual, int noTelepon) {
        String sql = "INSERT INTO penjual_06963 VALUES (id_penjual.NEXTVAL, '" + namaPenjual + "', '" + alamatPenjual + "', " + noTelepon + ")";
        knk.ManipulasiData(sql);
    }

    public ArrayList<Penjual> read() throws SQLException {
        ArrayList<Penjual> arrPenjual = new ArrayList<>();
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

    public void update(int idPenjual, String namaPenjual, String alamatPenjual, int noTelp) {
        String sql = "UPDATE penjual_06963 SET nama_penjual = '" + namaPenjual + "', alamat_penjual = '" + alamatPenjual + "', no_telepon = " + noTelp + " WHERE id_penjual = " + idPenjual;
        knk.ManipulasiData(sql);
    }

    public void delete(int idPenjual) {
        String sql = "DELETE FROM penjual_06963 WHERE id_penjual = " + idPenjual;
        knk.ManipulasiData(sql);
    }

}
