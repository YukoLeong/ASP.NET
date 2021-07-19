<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logindesign01.aspx.cs" Inherits="logindesign01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="logindesign01style/style.css" rel="stylesheet" />
</head>

	<body>
		<div id="container">
			<form runat="server" action="http://azmind.com/demo/login-form/welcome.html">
				<div class="login">LOGIN</div>
				<div class="username-text">Username:</div>
				<div class="password-text">Password:</div>
				<div class="username-field">
					<input type="text" name="username" value="azmind" />
				</div>
				<div class="password-field">
					<input type="password" name="password" value="azmind" />
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" /><label for="remember-me">Remember me</label>
				<div class="forgot-usr-pwd">Forgot <a href="#">username</a> or <a href="#">password</a>?</div>
				<input type="submit" name="submit" value="GO" />
			</form>
		</div>
		<div id="footer">
			By <a href="http://azmind.com/">Azmind.com</a> - <a href="http://azmind.com/2012/01/15/create-a-clean-web-2-0-login-form-part-2-html-css/">Download it here!</a>
		</div>
	</body>

</html>
