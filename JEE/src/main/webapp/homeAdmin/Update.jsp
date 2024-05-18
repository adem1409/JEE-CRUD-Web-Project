<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/JEE/style.css" />
    <title>Update</title>
    <style>
      .overlay {
        opacity: 95%;
      }
      nav {
        opacity: 0.1;
      }
      .fields {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
      }
      .fields .input input {
        width: 220px;
        font-size: 16px;
      }
      .fields .input label {
        font-size: 18px;
      }
    </style>
  </head>
  <body>
    <% 
    String userId = request.getParameter("id");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    
    %>
    <div class="overlay"></div>
    <div class="container">
      <nav>
        <div class="logo">
          <a href="index.html"><img src="/JEE/imgs/logo.png" /></a>
        </div>
        <div class="signup">
          <a href="/JEE/login" class="button">Log Out</a>
        </div>
      </nav>
      <div class="landing form login">
        <div class="box">
          <span class="title">Edit User N°<%= userId %></span>
          <form action="/JEE/api/updateUser" method="POST">
            <input value="<%= userId %>" name="id" type="text" hidden />
            <div class="fields">
              <div class="input">
                <label for="email">Email</label>
                <input
                  type="text"
                  placeholder="Enter Email"
                  id="email"
                  name="email"
                  value="<%= email %>"
                />
              </div>
              <div class="input">
                <label for="user">Username</label>
                <input
                  type="text"
                  placeholder="Enter Username"
                  id="user"
                  name="user"
                  value="<%= username %>"
                />
              </div>
              <div class="input">
                <label for="password">Password</label>
                <input
                  type="password"
                  placeholder="Enter Password"
                  id="password"
                  name="password"
                  value="<%= password %>"
                />
              </div>
				<div class="input">
                <label for="phone">Phone</label>
                <input
                  type="text"
                  placeholder="Enter Phone"
                  id="phone"
                  name="phone"
                  value="<%= phone %>"
                />
              </div>
            </div>
            <button class="button">Done</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
