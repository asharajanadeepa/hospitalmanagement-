package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect implements AutoCloseable { // Implementing AutoCloseable
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospitalmanagement";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private Connection connection;

    public DbConnect() {
        try {
            // Load the MySQL JDBC driver (optional in newer versions of JDBC)
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            this.connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            System.out.println("Connection to the database established successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Connection failed! Check output console");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return this.connection;
    }

    @Override
    public void close() { // Implementing the close method from AutoCloseable
        if (this.connection != null) {
            try {
                this.connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Failed to close the connection.");
                e.printStackTrace();
            }
        }
    }
}
