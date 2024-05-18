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
    <title>Quiz</title>
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
            <a href="#" class="active">Quiz</a>
            <a href="/JEE/profile">Profile</a>
          </div>
          <a href="/JEE/login">
            <img src="/JEE/imgs/logout.png" width="30px"
          /></a>
       </nav>
       
       
    <div class="quiz-app">
      <div class="quiz-info">
        <div class="count">Questions Count: <span></span></div>
      </div>
      <div class="quiz-area"></div>
      <div class="answers-area"></div>
      <div class="submit-button">Submit Answer</div>
      <div class="bullets">
        <div class="spans"></div>
        <div class="countdown"></div>
      </div>
      <div class="results"></div>
    </div>
     <form action="/JEE/api/UpdateScore" method="post">
      <input   hidden type="text"  name="rightAnswers" id="rightAnswersInput" >
      <input hidden type="text" name="email" value='<%= session.getAttribute("email") %>'>
      <button  hidden class="SubmitForm"></button>
    </form>
    <script src="main.js"></script>
  </body>
</html>