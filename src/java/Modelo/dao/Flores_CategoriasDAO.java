/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;

/**
 *
 * @author Joaquin
 */

import Servicio.DBConexion;
import Modelo.dto.Flores_Categorias;
import java.sql.*;

public class Flores_CategoriasDAO {
    private Connection cnx;

    public Flores_CategoriasDAO() {
        cnx = new DBConexion().getConnection();
    }

     public Flores_Categorias getDetalles(int florId, int categoriaId) {
        Flores_Categorias fc = null;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT f.nombre AS flor_nombre, c.nombre AS categoria_nombre " +
                     "FROM flores_categorias fc " +
                     "JOIN flores f ON fc.flor_id = f.flor_id " +
                     "JOIN categorias c ON fc.categoria_id = c.categoria_id " +
                     "WHERE fc.flor_id = ? AND fc.categoria_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, florId);
            ps.setInt(2, categoriaId);
            rs = ps.executeQuery();

            if (rs.next()) {
                fc = new Flores_Categorias(
                    florId,
                    categoriaId,
                    rs.getString("flor_nombre"),
                    rs.getString("categoria_nombre")
                );
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return fc;
    }
}

