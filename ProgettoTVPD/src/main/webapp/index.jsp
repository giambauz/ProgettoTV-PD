<%

	if(session.getAttribute("countTentativi") == null)
		session.setAttribute("countTentativi", (Integer)5);
	
	boolean flagAccessoSessione = false;
	
	if(session.getAttribute("sessionNominativo") != null)
		flagAccessoSessione = true;

	boolean flagCookieNominativo = false;
	boolean flagCognome = false;
	boolean flagIsBlock = false;
	
	Cookie[] cookies = request.getCookies();
	
	for(int i=0; cookies !=null && i < cookies.length; i++) {
		
		if(cookies[i].getName().equals("cookieNominativo"))
			flagCookieNominativo = true;
		
		if(cookies[i].getName().equals("isBlock"))
			flagIsBlock = true;
		
	}
	
	if(flagIsBlock || session.getAttribute("isblocK") != null)
		response.sendRedirect("error-page/accessonegato.jsp");
		
	if(flagCookieNominativo == true || flagAccessoSessione == true)
		response.sendRedirect("reportCorsisti.jsp");
	else {
			
%>

<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="include/CDN.html" %>
	<link rel="stylesheet" href="css/style.css">
	<title>Login amministratore</title>
</head>
<body style="background: radial-gradient(50% 50% at 50% 50%, #41908F 0%, #0C6677 100%) !important;">
	
	<img class="wallpaper_gen img-responsive" alt="wallpaper-login" src="img/wallpaper_index.png">
	
	<div class="container_login">
		<div class="body_login">
		
			<h1 class="titolo_login"><strong>
				<%
					Calendar now = Calendar.getInstance();
					if(now.get(Calendar.HOUR_OF_DAY) < 5) {	
				%>
				Buonanotte!
				<%
					} else if(now.get(Calendar.HOUR_OF_DAY) < 12) {
				%>
				Buongiorno!
				<%
					} else if(now.get(Calendar.HOUR_OF_DAY) < 17) {
				%>
				Buon pomeriggio!
				<%
					} else {
				%>
				Buonasera!
				<%
					}
				%>
			</strong></h1>
			<h1 class="sottotitolo_login">Benvenuto nella nostra area di accesso per gli amministratori</h1>
		
			<form class="form_login form-horizontal" action="/<%=application.getServletContextName()%>/login" method="POST">
				
				<div class="container header_login">
					<span><i class="glyphicon glyphicon-user icon_header_login"></i></span>
				</div>	
			
				<div class="form-group">
					<div class="inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" name="nomeAdmin" id="nomeAdmin" placeholder="Nome..." class="form-control" required>
						</div>
					</div>		
				</div>
				
	  			<div class="form-group">
					<div class="inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" name="cognomeAdmin" id="cognomeAdmin" placeholder="Cognome..." class="form-control" required>
						</div>
					</div>		
				</div>
				
				<div class="form-group">
					<div class="inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<input type="password" name="codAdmin" id="codAdmin" placeholder="Codice di accesso..." class="form-control" required>
							<span onclick="showHideLoginAmministratore()" class="input-group-addon">
								<i id="cod-icon" class="glyphicon glyphicon-eye-close"></i>
							</span>
						</div>
					</div>		
				</div>
				
				<script type="text/javascript">
				
					const codice = document.getElementById('codAdmin');
					const icon = document.getElementById('cod-icon');
					
					function showHideLoginAmministratore(){
					    if(codice.type === 'password'){
					        codice.setAttribute('type', 'text');
					        icon.classList.remove('glyphicon-eye-close');
					        icon.classList.add('glyphicon-eye-open');
					    }else{
					        codice.setAttribute('type', 'password');
					        icon.classList.remove('glyphicon-eye-open');
					        icon.classList.add('glyphicon-eye-close');
					    }
					}
				
				</script>
				
				<div class="form-group" style="display: flex;">
					<input type="checkbox" name="ricordami" id="ricordami">
					<label style="margin: 0 !important;">&nbsp;&nbsp;Ricordami</label>
				</div>
				
				<div class="row" style="margin-top: 30px; text-align: center;">
					<button type="submit" class="btn btn_login">
						Login&nbsp;&nbsp;
						<span class="glyphicon glyphicon-log-in"></span>
					</button>
				</div>
				
				<%
					if((Integer)session.getAttribute("countTentativi") > 0 &&
							(Integer)session.getAttribute("countTentativi") != 5 ) {
				%>
				<p class="tentativi_login">Tentativi rimasti:&nbsp;<strong><%= session.getAttribute("countTentativi") %></strong></p>
				<%
					}
				%>
			
			</form>
			
		</div>
		
		<div class="footer_login">
			<p>&copy;&nbsp;Copyright - Gestione corsi betacom Treviso-Padova<p>
		</div>
		
	</div>
	
</body>
</html>
<%
	} 
%>
