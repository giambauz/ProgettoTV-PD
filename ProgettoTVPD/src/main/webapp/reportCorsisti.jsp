<%
	
	Cookie[] cookies = request.getCookies();
	boolean flagAccesso = false;

	for(int i=0; cookies != null && i < cookies.length; i++)
		if(cookies[i].getName().equals("cookieNominativo"))
			flagAccesso = true;
	
	if(session.getAttribute("sessionNominativo") != null)
		flagAccesso = true;

	if(!flagAccesso) 
		response.sendRedirect("index.jsp");
	else {
	
%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corsista"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include/CDN.html"%>
<link rel="stylesheet" href="css/style.css">
<title>Report Corsisti</title>
</head>
<body>

	<jsp:include page="include/navbar.jsp"></jsp:include>

	<div class="container">
	
		<header class="page-header report-header-lt">
			<h3>Report corsisti iscritti ai corsi</h3>	
		</header>
	
		<div class="table-responsive">
			<table class="table table-striped table-lt">
				<thead>
					<tr>
						<th>Matricola</th>
						<th>Nome</th>
						<th>Cognome</th>
						<th>Precedenti Formativi</th>
					</tr>
				</thead>
				<tbody>
				<%	
					
					Corsista[] allCorsisti = AmministratoreFacade.getInstance().getAllCorsista();
					Corsista[] iscritti = AmministratoreFacade.getInstance().getiscritti();
					boolean flagicon = false;
					
					for (int i = 0; i < iscritti.length; i++){	
						
				%>
					<tr>
						<td>#<%= iscritti[i].getCodCorsista() %></td>
						<td><%= iscritti[i].getNomeCorsista()%></td>
						<td><%= iscritti[i].getCognomeCorsista()%></td>
						<td style="width: 200px;">
							<% 
								if(iscritti[i].getPrecedentiFormativi() == 1){
							%>
							<i class="glyphicon glyphicon-ok"></i>
							<% 
								}else { 
							%>
							<i class="glyphicon glyphicon-remove"></i>
							<% 
								} 
							%>
						</td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
		
		<section>
			<a class="btn btn-warning btn_redirect" href="reportCorsi.jsp">
				<i class="glyphicon glyphicon-list-alt"></i>
				Vai alla pagina di report corsi
			</a>
			
			<a class="btn btn-warning btn_redirect" href="statistiche.jsp">
				<i class="glyphicon glyphicon-stats"></i>
				Vai alla pagina delle statistiche
			</a>
		</section>
		
	</div>
	
	<%@ include file="include/footer.html" %>

</body>
</html>

<%
	} 
%>