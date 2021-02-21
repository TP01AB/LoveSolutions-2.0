/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Auxiliar.Constantes;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author isra9
 */
public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            //String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "com.mysql.cj.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName("org.mariadb.jdbc.Driver");              
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);
            //Class.forName("com.mysql.jdbc.Driver"); 

            Conex = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/" + Constantes.BBDD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static Usuario existeUsuario(String email, String password) {
        Usuario existe = null;
        String sql = "SELECT * FROM " + Constantes.tabla_usuarios + " WHERE email = ? && password = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {

                if (ConexionEstatica.Conj_Registros.next()) {
                    //creamos el Usuario con sus datos
                    existe = new Usuario(Conj_Registros.getInt("id_user"), Conj_Registros.getString("email"), Conj_Registros.getString("dni"), Conj_Registros.getString("nick"),
                            Conj_Registros.getString("password"), Conj_Registros.getString("tlf"), Conj_Registros.getInt("age"), Conj_Registros.getBoolean("active"));

                    //consultamos el rol
                    String sql2 = "SELECT * FROM " + Constantes.tabla_roles + "," + Constantes.tabla_asignacion_roles
                            + " WHERE " + Constantes.tabla_asignacion_roles + ".user_id = ? AND " + Constantes.tabla_roles + ".id_rol = " + Constantes.tabla_asignacion_roles + ".Id";
                    PreparedStatement ps2 = null;
                    try {
                        ps = ConexionEstatica.Conex.prepareStatement(sql2);
                        ps.setInt(1, existe.getId_user());
                        ConexionEstatica.Conj_Registros = ps.executeQuery();

                    } catch (SQLException ex) {
                        System.out.println("Error de SQL: " + ex.getMessage());
                    } catch (Exception ex) {
                        System.out.println("Error general: " + ex.getMessage());
                    }
                    //Le añadimos el rol/es
                    while (Conj_Registros.next()) {
                        int rol = Conj_Registros.getInt("rol.id_rol");
                        existe.setRol(rol);
                    }
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
}
