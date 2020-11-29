package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	private static final String sgbd = "mysql";
	private static final String porta = "3306";
	private static final String usuario = "root";
	private static final String senha = "365Pass";
	private static final String banco = "empresafantasma";
	
	public static Connection getConnection() {
		
		String url = "jdbc:" + sgbd + "://localhost:" + porta + "/" + banco + "?useTimezone=true&serverTimezone=UTC";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			return DriverManager.getConnection(url,usuario,senha);	
		
		} catch (ClassNotFoundException e) {
			System.out.println("Classe Driver n�o encontrada!");
			e.printStackTrace();
			return null;
			
		} catch (SQLException e) {
			System.out.println("Erro na conex�o, verifique os parametros da conex�o na classe conex�o");
			e.printStackTrace();
			return null;
		} 
		
	}
	
}
