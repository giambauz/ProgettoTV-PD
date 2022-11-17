<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	
	Cookie[] cookies = request.getCookies();
	boolean flagBloccato = false;
	
	for(int i=0; cookies !=null && i < cookies.length; i++) {
		
		if(cookies[i].getName().equals("bloccato") && cookies[i].getValue() != null)
			flagBloccato = true;
		
	}
	
	if(!flagBloccato)
		response.sendRedirect("../index.jsp");
	else {
		
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/CDN.html" %>
	<link rel="stylesheet" href="../css/style.css">
	<title>Accesso bloccato</title>
</head>
<body style="background: radial-gradient(50% 50% at 50% 50%, #41908F 0%, #0C6677 100%) !important;">

	<img class="wallpaper_gen img-responsive" alt="wallpaper-login" src="../img/wallpaper_index.png">
	
	<div class="container_accessonegato">
		
		<div>
		
			<header class="page-header">
				<h3>Accesso bloccato</h3>	
			</header>
		
			<div class="panel panel-danger">
				
				<div class="panel-heading">
					<h3>Mi dispiace, hai terminato i tuoi tentativi di accesso per oggi</h3>
				</div>
				
				<div class="panel-body">
					<p>Torna domani</p>
				</div>
				
			</div>
		
		</div>
		
		<div class="footer_login">
			<p>©&nbsp;Copyright - Gestione corsi betacom Treviso-Padova<p>
		</div>
	
	</div>

</body>
</html>
<%
	} 
%>