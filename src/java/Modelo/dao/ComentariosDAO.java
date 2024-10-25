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
import Modelo.dto.Comentarios;
import java.sql.*;

public class ComentariosDAO {

    private Connection cnx;

    public ComentariosDAO() {
        cnx = new DBConexion().getConnection();
    }

    public boolean save(Comentarios comentario) {
        String sql = "INSERT INTO comentarios (flor_id, user_id, comentario, calificacion) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, comentario.getFlorId());
            ps.setInt(2, comentario.getUserId());
            ps.setString(3, comentario.getComentario());
            ps.setInt(4, comentario.getCalificacion());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Comentarios get(int id) {
        Comentarios comentario = null;
        PreparedStatement ps;
        ResultSet rs;

        // Consulta con INNER JOIN para obtener datos de la flor y del usuario
        String sql = "SELECT c.comentario_id, c.comentario, c.calificacion, "
                + "f.flor_id, f.nombre AS nombre_flor, "
                + "u.user_id, u.nombre AS nombre_usuario "
                + "FROM comentarios c "
                + "INNER JOIN flores f ON c.flor_id = f.flor_id "
                + "INNER JOIN usuarios u ON c.user_id = u.user_id "
                + "WHERE c.comentario_id = ?";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Crea un nuevo objeto Comentarios y añade los datos recuperados
                comentario = new Comentarios();
                comentario.setComentarioId(rs.getInt("comentario_id"));
                comentario.setFlorId(rs.getInt("flor_id"));  // flor_id como llave foránea
                comentario.setUserId(rs.getInt("user_id"));  // user_id como llave foránea
                comentario.setComentario(rs.getString("comentario"));
                comentario.setCalificacion(rs.getInt("calificacion"));

             
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return comentario;
    }

    public boolean update(Comentarios comentario) {
        String sql = "UPDATE comentarios SET flor_id = ?, user_id = ?, comentario = ?, calificacion = ? WHERE comentario_id = ?";
        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, comentario.getFlorId());
            ps.setInt(2, comentario.getUserId());
            ps.setString(3, comentario.getComentario());
            ps.setInt(4, comentario.getCalificacion());
            ps.setInt(5, comentario.getComentarioId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM comentarios WHERE comentario_id = ?";
        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
