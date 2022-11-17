
<%
	
	Cookie[] cookies = request.getCookies();
	boolean flag = false;

	for(int i=0; cookies !=null && i<cookies.length; i++) {
		
		if(cookies[i].getName().equals("nomeAdmin") && cookies[i+1].getName().equals("cognomeAdmin"))
			flag = true;
		
	}
	
	if(session.getAttribute("nomeAdmin") != null && session.getAttribute("cognomeAdmin") != null)
		flag = true;

	if(flag) {
	
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

	<a href="include/logout.jsp">logout</a>

	<div class="container">
		<div class="table-responsive table-striped">
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
					Corsista[] c = AmministratoreFacade.getInstance().getiscritti();
					for (int i = 0; i < c.length; i++){	
				%>
					
					<tr>
						<td>#<%= c[i].getCodCorsista() %></td>
						<td><%= c[i].getNomeCorsista()%></td>
						<td><%= c[i].getCognomeCorsista()%></td>
						<% if(c[i].getPrecedentiFormativi() == 1){%>
						<td><i class="glyphicon glyphicon-ok"></i></td>
						<% }else{ %>
						<td><i class="glyphicon glyphicon-remove"></i></td>
						<% } %>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
		<a href="reportCorsi.jsp">
			Report corsi
		</a>
	</div>

</body>
</html>

<%
	
	} else {
		
		response.sendRedirect("index.jsp");
		
	}

%>