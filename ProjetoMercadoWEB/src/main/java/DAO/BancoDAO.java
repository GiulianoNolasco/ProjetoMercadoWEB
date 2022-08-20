package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class BancoDAO {

    Connection conn;
    PreparedStatement ps;

    public BancoDAO() {
        String textoConexao = "jdbc:mysql://localhost:3306/projetomercado?user=root&password=";
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(textoConexao);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "BancoDAO.BancoDAO: " + e.getMessage());
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    public ResultSet retornaDados(String Comando) {
        ResultSet retorno = null;
        try {
            ps = conn.prepareStatement(Comando);
            retorno = ps.executeQuery();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "BancoDAO.retornaDados: " + ex.getMessage());
        }
        return retorno;
    }

    public boolean executaComando(String Comando) {
        try {
            ps = conn.prepareStatement(Comando);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "BancoDAO.executaComando: " + ex.getMessage());
            return false;
        }
    }
}
