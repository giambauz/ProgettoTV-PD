<%@page
	import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%

	Cookie[] cookies = request.getCookies();
	boolean flagAccesso = false;
	boolean flagIsBlock = false;
	
	for(int i=0; cookies != null && i < cookies.length; i++) {
		
		if(cookies[i].getName().equals("cookieNominativo"))
			flagAccesso = true;
		
		if(cookies[i].getName().equals("isBlock"))
			flagIsBlock = true;
		
	}
	
	if(session.getAttribute("sessionNominativo") != null)
		flagAccesso = true;
	
	if(!flagAccesso || flagIsBlock) 
		response.sendRedirect("index.jsp");
	else {
		
		AmministratoreFacade aF = AmministratoreFacade.getInstance();
		Map<Long, Docente> mappaDocenti = new HashMap<Long, Docente>();
		for (Docente d : aF.getAllDocente())
			mappaDocenti.put(d.getCodDocente(), d);
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include/CDN.html"%>
<link rel="stylesheet" href="css/style.css">
<title>Report Corsi</title>
</head>
<body>
	<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">
		<header class="page-header report-header-lt">
			<h3>Report corsi</h3>
		</header>
		
		<form action="rimuoviPiuCorsi" method="post">
			<div class="table-responsive">
				<table class="table table-striped table-lt">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Data inizio</th>
							<th>Data fine</th>
							<th>Costo</th>
							<th>Commenti</th>
							<th>Aula</th>
							<th>Docente</th>
							<th><input type="submit" value="Cancella selezionati"
								class="btn btn-warning"></th>
						</tr>
					</thead>
					<tbody>
						<%
						SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");
						for (Corso c : aF.getAllDopoDataOdiernaCorso(new Date())) {
							Docente d = mappaDocenti.get(c.getCodDocente());
						%>
						<tr>
							<td><%=c.getNomeCorso()%></td>
							<td><%=formatDate.format(c.getDataInizioCorso())%></td>
							<td><%=formatDate.format(c.getDataFineCorso())%></td>
							<td><%=String.format("%.2f", c.getCostoCorso())%></td>
							<td><%=(c.getCommentiCorso() == null) ? "nessun commento" : c.getCommentiCorso()%></td>
							<td><%=c.getAulaCorso()%></td>
							<td><%=d.getNomeDocente() + " " + d.getCognomeDocente()%></td>
							<td>
								<div class="checkbox">
									<label> <input type="checkbox" name="codCorso"
										value="<%=c.getCodCorso()%>"> Seleziona
									</label>
								</div>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	
	<%@ include file="include/footer.html" %>
	
</body>
</html>
<%
	} 
%>