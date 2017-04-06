<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import="Assignment5.OpinionBean,java.util.ArrayList"%>

<!doctype html>
<% String username = (String) session.getAttribute("username");%>
<% ArrayList<OpinionBean> opinions = (ArrayList<OpinionBean>) session.getAttribute("opinions");%>
<html>
	<head>
		<script src="scripts/script.js" async></script>
		<link rel="stylesheet" href="styles/style.css">
	</head>
	<body>
		<div id="wrapper">
			<div class="header">
				<table>
				<a href="LoggedIn.jsp"><img src="coffeeguy.jpg" border="0"></a>
				<h1><a href="LoggedIn.jsp" id="title">Opinionr</a></h1>
			</div>
			<br>
			<center>
				Welcome <%=username%>! <br>
			</center>
			<form method="post" action="SignInServlet">
				What's your opinion? <br>
				<input type="text" id="assertion" name="assertion" size="50"><br><br>
				Why?<br>
				<textarea name="justification" id="justification" cols="51" rows="5"></textarea>
				<br><br>
				<input type="submit" value="Submit" onClick="return isEmpty()">
			</form>
			<hr width="450">
			<h2>What other Opinionrers said:</h2>
			<%
				int i;
				for (i = 0; i < opinions.size(); i++) {
					out.println("<div style=\"display:block;\">");
					out.println("<blockquote><b>" + opinions.get(i).getAssertion() + "</b>");
					out.println("<p>" + opinions.get(i).getJustification() + "</p>");
					out.println("<p><i>-" + opinions.get(i).getUsername() + "</p></i>");
					out.println("</blockquote>");
					out.println("<table border=\"1\">");
					out.println("	<tr>");
					if (!opinions.get(i).getUsername().equals(username)) {
						out.println("		<td>");
						out.println("			<div id = \"voting\">");
						out.println("				<form method=\"post\" action=\"SignInServlet\">");
						out.println("				<input type=\"radio\" name=\"vote\" value=\"Agreed\">Convinced");
						out.println("				<input type=\"radio\" name=\"vote\" value=\"Neutral\">Unsure");
						out.println("				<input type=\"radio\" name=\"vote\" value=\"Disagreed\">Disagree");
						out.println("				<input type=\"hidden\" name=\"opinionNumber\" value=\"" + i+ "\"/>");
						out.println("				<br>");
						out.println("				<input type=\"submit\" value=\"Vote\">");
						out.println("				</form>");
						out.println("			</div>");
						out.println("		</td>");
					}
					out.println("		<td>");
					out.println("		Agreed: " + opinions.get(i).getAgreed() + " Neutral: " + opinions.get(i).getNeutral() + " Disagreed: " + opinions.get(i).getDisagreed());
					if (opinions.get(i).getUsername().equals(username)) {
						out.println("		<form method=\"post\" action=\"SignInServlet\">");
						out.println("				<input type=\"hidden\" name=\"deleteOpinion\" value=\"" + i+ "\"/>");
						out.println("				<input type=\"submit\" value=\"Delete Opinion\">");
						out.println("		</form>");
					}
					out.println("		</td>");
					out.println("</table>");
					out.println("<br>");
					out.println("</div>");
				}
			%>
			<center>
			<form method="post" action="SignInServlet">
				<input type="submit" name="reset" value="reset">
			</form>
			</center>
		</div>
	</body>
</html>