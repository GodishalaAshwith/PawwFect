<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./styles/login.css">
</head>
<body>
	<div class="login-page">
		<div id="login_box">
			<form method="post" action="LoginServlet" >
				<div id="heading" class="login_cred">
            		<h1>Login</h1>
	        	</div>
		        <div class="login_cred">
		            <input name="uname" type="text" placeholder="username">
		        </div>
		        <div class="login_cred">
		            <input name="upwd" type="password" placeholder="password">
		        </div>
		        <div id="submit" class="login_cred">
		            <button type="submit" >Submit</button>
		        </div>
		        <div id="forgot_pass" class="login_cred">
		            <a href="">Forgot password</a>
		        </div>
			</form>
    	</div>
	
	</div>
    
</body>
</html>