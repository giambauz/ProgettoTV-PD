<%

	if(session.getAttribute("nomeAdmin") != null && session.getAttribute("cognomeAdmin") != null)
		response.sendRedirect("test.jsp");
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
<body>
	
	<div class="container">
	
		<h1><strong>
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
		<p class="p_login">Benvenuto nella nostra area di accesso per gli amministratori</p>
		
		<form class="form-horizontal col-md-4" action="/<%=application.getServletContextName()%>/login" method="POST">
			
			<div class="header_login">
				<span><i class="glyphicon glyphicon-user"></i></span>
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
						<input type="password" name="codAdmin" id="codAdmin" placeholder="Codice di accesso..." class="form-control">
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
			
			<div class="form-group">
				<div style="display: flex !important; align-items: center !important; ">
					<input type="checkbox" name="ricordami" style="margin: 0 !important;">
					<label style="margin: 0 !important;">&nbsp;&nbsp;Ricordami</label>
				</div>
			</div>
			
			<div class="row" style="margin-top: 30px; text-align: center;">
				<button type="submit" class="btn btn-warning">
					Login&nbsp;&nbsp;
					<span class="glyphicon glyphicon-log-in"></span>
				</button>
			</div>
		
		</form>
		
	</div>
	
</body>
</html>
<%
	}
%>
