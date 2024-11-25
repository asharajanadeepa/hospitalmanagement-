package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnecter {
	private static String url = "jdbc:mysql://localhost:3306/hospitalmanagement";
	private static String user = "root";
	private static String password = "";
	private static Connection con;

	public static Connection getConnection() {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
		}catch (SQLException e) {
            System.err.println("Connection failed! Check output console");
            e.printStackTrace();
        }catch (Exception e) {
			System.out.println("Database connection is not success");
		}

		return con;
	}
}
