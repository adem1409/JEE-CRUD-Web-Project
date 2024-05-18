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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/JEE/style.css" />
    <title>Home | Admin</title>
    <style>
      table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid #ddd;
        margin-top: 20px;
      }
      th,
      td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }
      th {
        background-color: #f2f2f2;
        font-weight: bold;
        color: #333;
      }
      td a {
        text-decoration: none;
        color: #007bff;
        margin-right: 10px;
      }
      td a:hover {
        
      }
      .overlay {
        opacity: 90%;
      }
      .pageTitle {
        text-align: center;
        font-size: 30px;
        margin-block: 50px;
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
          <a href="/JEE/login" class="button">Log Out</a>
        </div>
      </nav>
      <h2 class="pageTitle">User Management</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Username</th>
            <th>Passowrd</th>
            <th>Phone</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
            <%
            try (Connection connection = Database.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM users")) {

                   while (resultSet.next()) {
                       int userId = resultSet.getInt("id");
                       String email = resultSet.getString("email");
                       String username = resultSet.getString("username");
                       String password = resultSet.getString("password");
                       String phone = resultSet.getString("phone");
                       
                       %>
                       <tr>
                       <td><%= userId %></td>
                       <td><%= email %></td>
                       <td><%= username %></td>
                       <td><%= password %></td>
                       <td><%= phone %></td>
                       <td>
                        <a href="/JEE/homeAdmin/Update.jsp?id=<%= userId %>&username=<%= username %>&password=<%= password %>&email=<%= email %>&phone=<%= phone %>"><img src='/JEE/imgs/update.png' width='20px' /></a>
                        <a href='/JEE/api/deleteUser?id=<%= userId %>'><img src='/JEE/imgs/delete.png' width='20px' /></a>
                      </td>
                      <tr>
                        <%
                   }
               } catch (SQLException e) {
                   e.printStackTrace();
           }
           %>
        </tbody>
    </table>
   </div>
</body>
</html>