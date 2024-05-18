package controllers.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/api/login")
public class Login extends HttpServlet {
	

    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String choice = request.getParameter("choice");
        try {
        Connection connection = Database.getConnection();
        PreparedStatement statement;
        if (choice == "user") {
         statement = connection.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
        } else {
         statement = connection.prepareStatement("SELECT * FROM admins WHERE email = ? AND password = ?");
        }
        
        statement.setString(1, email);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();
        resultSet.next();
        
        // Save user information in the session
        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        
        // Redirect to the home page or any other page
        if ("admin".equals(choice)) { 
        	response.sendRedirect("/JEE/homeAdmin/");
        	} 
        else {
        	response.sendRedirect("/JEE/home/");
        }
        }
        catch (Exception e) {
            // Failed to connect DB
        	response.sendRedirect("/JEE/login?error="+e.getMessage());
        }
    }
}