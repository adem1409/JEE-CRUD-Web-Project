<%@page import="java.sql.PreparedStatement"%>
<%@page import="controllers.auth.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/JEE/style.css" />
    <link rel="stylesheet" href="/JEE/home/styles.css" />
    <title>Home</title>
    <style>
	.sections {
  display: inline-flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 15px;
  background-color: rgb(56, 56, 56);
  padding: 10px 20px;
  border-radius: 10px;
  margin-right: 30px;
}
.sections a {
  padding: 10px 20px;
  font-size: 18px;
  border-radius: 10px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  background-color: white;
  color: black;
}
a.active {
  background-color: tomato;
  color: white;
}
        .profile {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            text-align:center;
        }
        .profile h2 {
            text-align: center;
        }
        .profile-info {
            margin-top: 20px;
        }
        .profile-info p {
            margin-bottom: 10px;
        }
        .error-message {
            color: red;
        }
		.avatar{
            display:flex;
            justify-content:center;
            margin-top: 30px;
        }
    </style>
  </head>
  <body>
    <div class="overlay"></div>
    <div class="container">
      <nav>
        <div class="logo">
          <img src="/JEE/imgs/logo.png" />
        </div>
        <div class="login">
          <div class="sections">
            <a href="/JEE/home">Quiz</a>
            <a href="#"  class="active">Profile</a>
          </div>
          <a href="/JEE/login">
            <img src="/JEE/imgs/logout.png" width="30px"
          /></a>
       </nav>
       <div class="profile">
        <h2>User Profile</h2>
        <div class="avatar">
        <img src="/JEE/imgs/avatar.png" width="300px">
        </div>
        <div class="profile-info">
            <% 
                String email = (String) session.getAttribute("email");
                if (email != null) {
                    try {
                        Connection connection = Database.getConnection();
                        PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
                        statement.setString(1, email);
                        ResultSet resultSet = statement.executeQuery();
                        if (resultSet.next()) {
                            String username = resultSet.getString("username");
                            int score = resultSet.getInt("score");
            %>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Username:</strong> <%= username %></p>
            <p><strong>Score:</strong> <%= score %></p>
            <%      }
                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (SQLException e) {
                        out.println("<p class=\"error-message\">Error retrieving user data.</p>");
                        e.printStackTrace();
                    }
                } else {
                    response.sendRedirect("/JEE/login");
                }
            %>
        </div>
    <script src="main.js"></script>
  </body>
</html>