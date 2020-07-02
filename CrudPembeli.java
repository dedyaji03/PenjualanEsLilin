/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Pembeli;

/**
 *
 * @author Dedy Aji
 */
public class CrudPembeli {

    private Koneksi knk = new Koneksi();

    public int getSequence() throws SQLException{
        String sql = "SELECT last_number FROM user_sequences WHERE sequence_name = 'ID_PEMBELI'";
        ResultSet rs = knk.GetData(sql);
        rs.next();
        return rs.getInt("last_number");
    }
    
    public void create(String namaPembeli, String alamatPembeli) {
        String sql = "INSERT INTO pembeli_06963 VALUES (id_pembeli.NEXTVAL, '" + namaPembeli + "', '" + alamatPembeli + "')";
        knk.ManipulasiData(sql);
    }

    public ArrayList<Pembeli> read() throws SQLException {
        ArrayList<Pembeli> arrPembeli = new ArrayList<>();
        String sql = "SELECT * FROM pembeli_06963";
        ResultSet rs = knk.GetData(sql);
        while (rs.next()) {
            Pembeli p = new Pembeli();
            p.setIdPembeli(rs.getInt("id_pembeli"));
            p.setNamaPembeli(rs.getString("nama_pembeli"));
            p.setAlamatPembeli(rs.getString("alamat_pembeli"));

            arrPembeli.add(p);
        }
        return arrPembeli;
    }
    
    public void update(int idPembeli, String namaPembeli, String alamatPembeli) {
        String sql = "UPDATE pembeli_06963 SET nama_pembeli = '" + namaPembeli + "', alamat_pembeli = '" + alamatPembeli + "' WHERE id_pembeli = " + idPembeli;
        knk.ManipulasiData(sql);
    }
    
    public void delete(int idPembeli) {
        String sql = "DELETE FROM pembeli_06963 WHERE id_pembeli = " + idPembeli;
        knk.ManipulasiData(sql);
    }

}
