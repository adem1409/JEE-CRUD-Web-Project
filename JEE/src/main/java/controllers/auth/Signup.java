package controllers.auth;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/api/signup")
public class Signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String choice = request.getParameter("choice");

        // Declare user ID variable
        int userId = -1;

        // Create connection and PreparedStatement objects
    
        try (Connection connection = Database.getConnection()){
        	PreparedStatement statement;
        	if ("user".equals(choice)) {
        	statement =connection.prepareStatement("INSERT INTO users (email,username,password,phone,score) VALUES (?, ?, ?,?,0)", Statement.RETURN_GENERATED_KEYS);}
        	else {
            statement =connection.prepareStatement("INSERT INTO admins (email,username,password,phone) VALUES (?, ?, ?,?)", Statement.RETURN_GENERATED_KEYS);
        	}
        		// Set parameters
        	statement.setString(1, email);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, phone);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // User registered successfully
                // Save user information in the session
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userId = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Failed to retrieve auto-generated user ID.");
                    }
                }
                HttpSession session = request.getSession();
                if ("user".equals(choice)) {
                session.setAttribute("userId", userId);
                }
                else {
                	session.setAttribute("adminId", userId);
                }
                // Redirect to the home page or any other page
                response.sendRedirect("/JEE");
            } else {
                // Failed to register user
                response.getWriter().println("Failed to register user.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database access error", e);
        }} 
    
}
