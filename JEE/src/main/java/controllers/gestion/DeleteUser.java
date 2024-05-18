package controllers.gestion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controllers.auth.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/deleteUser")
public class DeleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user ID to be deleted from the request parameter
        String userIdStr = request.getParameter("id");
        
        // Validate if userIdStr is not null or empty
        if(userIdStr != null && !userIdStr.isEmpty()) {
            try {
                // Parse the user ID to integer
                int userId = Integer.parseInt(userIdStr);
                
                // Call the delete method
                if(deleteUser(userId)) {
                    // User deleted successfully
                    response.sendRedirect("/JEE/homeAdmin");
                } else {
                    // Failed to delete user
                    response.getWriter().println("Failed to delete user.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                // Invalid user ID format
                response.getWriter().println("Invalid user ID format.");
            }
        } else {
            // User ID not provided
            response.getWriter().println("User ID not provided.");
        }
    }

    private boolean deleteUser(int userId) {
        // SQL query to delete user by ID
        String sql = "DELETE FROM users WHERE id = ?";
        
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            // Set the user ID parameter
            statement.setInt(1, userId);
            
            // Execute the delete statement
            int rowsAffected = statement.executeUpdate();
            
            // Check if any rows were affected (user deleted)
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Database error occurred
            return false;
        }
    }
}