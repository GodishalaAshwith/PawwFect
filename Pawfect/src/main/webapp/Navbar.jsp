<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PawwFect</title>
  <link rel="stylesheet" href="./styles/nav.css">
  <link rel="icon" href="./styles/logo.png" type="image/png">
</head>
<body>
  <nav class="nav">
    <header class="navbar">
      <div class="logo">
        <h1>PawFect Match</h1>
      </div>
      <nav class="menu">
        <button onclick="window.location.href='index.jsp';" >Home</button>
        <button onclick="window.location.href='AddPets.jsp';" >Add Pets</button>
        <button onclick="window.location.href='DisplayPets.jsp';" >Browse Pets</button>
        <button onclick="window.location.href='Login.jsp';" >Sign In</button>
        <button onclick="window.location.href='Register.jsp';" >Sign Up</button>
        <div class="profile-icon">
          <img src="./styles/logo.png" alt="Profile">
        </div>
      </nav>
    </header>
   </nav>
</body>
</html>

