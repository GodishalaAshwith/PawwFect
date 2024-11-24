<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PawwFect</title>
  <link rel="stylesheet" href="./styles/petstyles.css">
  <link rel="icon" href="./styles/logo.png" type="image/png">
</head>
<body>
	<header class="navbar">
      <%@ include file="Navbar.jsp" %>
    </header>
  <div class="container">
    

    <!-- Centered Form -->
    <div class="form-container">
        <form class="form-box" action="AddPetServlet" method="post" enctype="multipart/form-data">
          <h2>Pet Details Entry Form</h2>
          
          <div class="input-group">
            <label for="animalType">Animal Type</label>
            <select id="animalType" name="animalType">
              <option value="dog">Dog</option>
              <option value="cat">Cat</option>
            </select>
          </div>
  
          <div class="input-group">
            <label for="age">Age (in years)</label>
            <input type="number" id="age" name="age" required>
          </div>
  
          <div class="input-group">
            <label for="breed">Breed</label>
            <input type="text" id="breed" name="breed" required>
          </div>
  
          <div class="input-group">
            <label for="name">Name (optional)</label>
            <input type="text" id="name" name="name">
          </div>
  
          <div class="input-group">
            <label for="location">Location</label>
            <input type="text" id="location" name="location" required>
          </div>
  
          <div class="input-group">
            <label for="gender">Gender</label>
            <select id="gender" name="gender">
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
          </div>
  
          <div class="input-group">
            <label for="medicalStatus">Medical Status</label>
            <input type="text" id="medicalStatus" name="medicalStatus" required>
          </div>
  
          <div class="input-group">
            <label for="price">Price (in rupees)</label>
            <input type="number" id="price" name="price" required>
          </div>
  
          <div class="input-group">
            <label for="email">Email of Current Owner</label>
            <input type="email" id="email" name="email" required>
          </div>
  
          <div class="input-group">
            <label for="picture">Picture of your Pet</label>
            <input type="file" id="picture" name="picture" accept="image/*" >
          </div>
  
          <button type="submit">Submit</button>
        </form>
      </div>
          <div class="error-message">
        <% 
            String status = (String) request.getAttribute("status");
            String errorMessage = (String) request.getAttribute("errorMessage");
        %>
    </div>

    <script>
        // Alert for status
        <% if ("success".equals(status)) { %>
            alert("Pet Added!");
        <% } else if ("failed".equals(status)) { %>
            alert("Failed. Please try again.");
        <% } %>

        // Alert for custom error message
        <% if (errorMessage != null) { %>
            alert("<%= errorMessage %>");
        <% } %>
    </script>
    </div>
</body>
</html>