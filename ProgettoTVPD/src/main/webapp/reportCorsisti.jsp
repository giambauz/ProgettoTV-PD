
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

	<div class="container">
	
		<header class="page-header" style="border-bottom: 1px solid #052E36 !important">
			<h3>Report corsisti</h3>	
		</header>
	
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Matricola</th>
						<th>Nome</th>
						<th>Cognome</th>
						<th>Precedenti Formativi</th>
						<th>Attualmente iscritti</th>
					</tr>
				</thead>
				<tbody>
				<%	
					
					Corsista[] c = AmministratoreFacade.getInstance().getAllCorsista();
					Corsista[] cc = AmministratoreFacade.getInstance().getiscritti();
					boolean flagicon = false;
					
					for (int i = 0; i < c.length; i++){	
						
				%>
					<tr>
						<td>#<%= c[i].getCodCorsista() %></td>
						<td><%= c[i].getNomeCorsista()%></td>
						<td><%= c[i].getCognomeCorsista()%></td>
						<td style="width: 200px;">
							<% 
								if(c[i].getPrecedentiFormativi() == 1){
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
						<td style="width: 150px;">
							<%
								for(int j = 0; j < cc.length; j++)
									if(c[i].getCodCorsista() == cc[j].getCodCorsista())
										flagicon = true;
								
								if(flagicon){
							%>
							<i class="glyphicon glyphicon-ok"></i>
							<% 
								}else{ 
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
		<a href="reportCorsi.jsp">
			Report corsi
		</a>
	</div>
	
	<%@ include file="include/footer.html" %>

</body>
</html>

<%
	
	} else {
		
		response.sendRedirect("index.jsp");
		
	}

%>