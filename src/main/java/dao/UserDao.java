package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import db.DbConnect;

public class UserDao {

    public User validateUser(String username, String password) {
        // Get the Singleton instance of the User class
        User user = User.getInstance();
        String query = "SELECT * FROM User WHERE username = ? AND password = ?";

        try (DbConnect dbConnect = new DbConnect(); // Create DbConnect instance
             Connection conn = dbConnect.getConnection(); // Get connection
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username); // Set username
            stmt.setString(2, password); // Set password

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbUsername = rs.getString("username");
                if (username.equals(dbUsername)) {
                    // Instead of creating a new User object, modify the Singleton instance
                    user.setId(rs.getInt("id"));
                    user.setUsername(dbUsername);
                    user.setName(rs.getString("name"));
                    user.setRole(rs.getString("role"));
                } else {
                    // Handle the case where the user is not valid (reset fields if needed)
                    user = null; // This ensures the Singleton instance is not reused for invalid users
                }
            } else {
                // If no user is found, reset the instance to null
                user = null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}