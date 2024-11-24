<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
  <link rel="icon" href="./styles/logo.png" type="image/png">
    <link rel="stylesheet" href="./styles/register.css?v=1.0">
</head>
  <body>
    <div class="img">
      <div class="pawfect">PAWFECT</div>
    </div>
    <main>
      <div id="register_box">
        <div id="heading">
          <h1>Sign Up</h1>
        </div>
        <div>
          <form method="post" action="RegisterServlet">
            <p>Name</p>
            <div class="signup_cred">
              <input name="name" type="text" required />
            </div>
            <p>Email</p>
            <div class="signup_cred">
              <input name="uemail" type="email" required />
            </div>
            <p>Username</p>
            <div class="signup_cred">
              <input name="uname" type="text" required />
            </div>
            <p>Number</p>
            <div class="signup_cred">
              <input name="number" type="tel" required />
            </div>
            <p>Password</p>
            <div class="signup_cred">
              <input name="pwd" type="password" required />
            </div>
            <p>Confirm Password</p>
            <div class="signup_cred">
              <input name="cpwd" type="password" required />
            </div>
            <div class="buttons">
              <div class="signup_cred" id="submit">
                <button type="submit">Submit</button>
              </div>
              <div class="error-message">
                <a href="Login.jsp">Login instead?</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </main>


    <div class="error-message">
        <% 
            String status = (String) request.getAttribute("status");
            String errorMessage = (String) request.getAttribute("errorMessage");
        %>
    </div>

    <script>
        // Alert for status
        <% if ("success".equals(status)) { %>
            alert("Registration Successful!");
        <% } else if ("failed".equals(status)) { %>
            alert("Registration Failed. Please try again.");
        <% } %>

        // Alert for custom error message
        <% if (errorMessage != null) { %>
            alert("<%= errorMessage %>");
        <% } %>
    </script>
</body>
</html>
