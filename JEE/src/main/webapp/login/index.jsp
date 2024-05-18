<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/JEE/style.css" />
    <title>Login</title>
  </head>
  <body>
    <div class="overlay"></div>
    <div class="container">
      <nav>
        <div class="logo">
          <a href="/JEE/"><img src="/JEE/imgs/logo.png" /></a>
        </div>
        <div class="signup">
          <a href="/JEE/signup" class="button">Sign Up</a>
        </div>
      </nav>
      <div class="landing form login">
        <div class="box">
          <span class="title">Login</span>
          <form action="/JEE/api/login" method="POST">
            <div class="radio">
              <div class="input">
                <input value="admin" name="choice" type="radio" id="admin"/>
                <label for="admin">Admin</label>
              </div>
              <div class="input">
                <input value="user" name="choice" type="radio" id="user"/>
                <label for="user">User</label>
              </div>
            </div>
            <div class="fields">
              <div class="input">
                <label for="email">Email</label>
                <input
                  type="email"
                  placeholder="Enter Email"
                  id="email"
                  name="email"
                />
              </div>
              <div class="input">
                <label for="password">Password</label>
                <input
                  type="password"
                  placeholder="Enter Password"
                  id="password"
                  name="password"
                />
              </div>
            </div>
            <button class="button">Login</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
