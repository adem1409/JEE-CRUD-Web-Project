package controllers.gestion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import controllers.auth.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/updateUser")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Get form parameters
        String id = request.getParameter("id");
        String username = request.getParameter("user");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        String sql = "UPDATE users SET email = ?, username = ?, password = ?, phone = ? WHERE id = ?";
        
		try {
			Connection connection = Database.getConnection();
			PreparedStatement statement =connection.prepareStatement(sql);
			
			
			statement.setString(1, email);
		    statement.setString(2, username);
		    statement.setString(3, password);
		    statement.setString(4, phone);
		    statement.setString(5, id);
		    
		    int rowsUpdated = statement.executeUpdate();
		    if (rowsUpdated > 0) {
		        response.sendRedirect("/JEE/homeAdmin");
		    } ;

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("/JEE/errorPage?"+e.getMessage()); 
		}
    }
}