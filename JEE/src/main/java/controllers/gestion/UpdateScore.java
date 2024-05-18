package controllers.gestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;

import controllers.auth.Database;

@WebServlet("/api/UpdateScore")
public class UpdateScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user ID and new score from request parameters
  
        String email = (String) request.getParameter("email");
        int newScore;
         if (request.getParameter("rightAnswers") == "") {
        	 newScore = 0;
         } else {
        	 newScore = Integer.parseInt(request.getParameter("rightAnswers"));
        }

        // Update user's score in the database
        updateScore(email, newScore);


        // Redirect to a confirmation page or back to the user's profile page
        response.sendRedirect("/JEE/profile");
    }

    // Method to update user's score in the database
    private void updateScore(String email, int newScore) {
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE users SET score = ? WHERE email = ?")) {
            statement.setInt(1, newScore);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




}
