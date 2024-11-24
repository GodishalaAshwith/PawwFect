<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Pets</title>
    <link rel="stylesheet" href="./styles/viewPets.css?v=1.0">
    
  <link rel="icon" href="./styles/logo.png" type="image/png">
</head>
<body>
    <header class="navbar">
        <%@ include file="Navbar.jsp" %>
    </header>
    <div class="container">
        <div class="content-container">
            <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pawfect", "root", "root");

                stmt = conn.createStatement();
                String petDetails = "SELECT id, breed,name, age, location, gender, price, medicalStatus FROM pets";
                rs = stmt.executeQuery(petDetails);

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String breed = rs.getString("breed");
                    String age = rs.getString("age");
                    String location = rs.getString("location");
                    String gender = rs.getString("gender");
                    String price = rs.getString("price");
                    String medicalStatus = rs.getString("medicalStatus");
            %>
            <div class="info-card">
                <img src="getImage?id=<%= id %>" alt="Pet Image" class="pet-image">
                <p><strong>Name:</strong> <%= name %></p>
                <p><strong>Breed:</strong> <%= breed %></p>
                <p><strong>Age:</strong> <%= age %></p>
                <p><strong>Location:</strong> <%= location %></p>
                <p><strong>Gender:</strong> <%= gender %></p>
                <p><strong>Price:</strong> ₹<%= price %></p>
                <p><strong>Medical Status:</strong> <%= medicalStatus %></p>
            </div>
            <%
                }
            } catch (Exception e) {
            %>
            <div class="error-message">
                <p>Error loading pets: <%= e.getMessage() %></p>
            </div>
            <%
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("Error closing resources: " + e.getMessage());
                }
            }
            %>
        </div>
    </div>
</body>
</html>
