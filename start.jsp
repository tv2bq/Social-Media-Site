<!doctype html>
<html>
	<head>
		<script src="scripts/script.js" async></script>
		<link rel="stylesheet" href="styles/style.css">
	</head>
	<body>
		<div id="wrapper">
			<div class="header">
				<a href="start.jsp"><img src="coffeeguy.jpg" border="0"></a>
				<h1><a href="start.jsp" id="title">Opinionr</a></h1>
			</div>
			<br>
			<form action="SignInServlet">
				<table Cellspacing="0" Cellpadding="3" Border="0" >
					<tr><td colspan="4"><b>Welcome to Opinionr! Sign in to share</b></td></tr>
					<tr>
						<td>Username </td>
						<td><input autofocus type="text" name="username" size="15" maxLength="20"></td>
					<tr>
						<td>Password </td>
						<td><input type="text" name="password" size="15" maxLength="20"></td>
					</tr>
					<tr>
						<td colspan="4" ><input type="submit" value="Sign in" name="btn"></input>
					</tr>
				</table>
			</form>
			<b>Not a member? <a href="http://google.com">Register</a></b>
		</div>
	</body>
</html>