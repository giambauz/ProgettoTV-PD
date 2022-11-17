<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="include/CDN.html" %>
	<link rel="stylesheet" href="css/style.css">
	<title>Report Corsisti</title>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<a href="include/logout.jsp">logout</a>
<div class="container">
<form action="rimuoviCorsi" method="post">
<table class="table table-hover">
  <thead>
    <tr>
      <th>Nome</th>
      <th>Data inizio</th>
      <th>Data fine</th>
      <th>Costo</th>
      <th>Commenti</th>
      <th>Aula</th>
      <th>Docente</th>
      <th><input type="submit" value="Cancella selezionati" class="btn btn-warning"></th>
    </tr>
  </thead>
  <tbody>
<%	
	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");
	AmministratoreFacade aF = AmministratoreFacade.getInstance(); 
	for (Corso c : aF.getAllDopoDataOdiernaCorso(new Date())){
%>
    <tr>
      <th><%= c.getNomeCorso() %></th>
      <th><%= formatDate.format(c.getDataInizioCorso()) %></th>
      <th><%= formatDate.format(c.getDataFineCorso()) %></th>
      <th><%= String.format("%.2f", c.getCostoCorso()) %></th>
      <th><%= (c.getCommentiCorso() == null) ? "nessun commento" : c.getCommentiCorso() %></th>
      <th><%= c.getAulaCorso() %></th>
      <th><%= c.getCodDocente() %></th>
      <th>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="codCorso" value="<%= c.getCodCorso() %>"> Seleziona
          </label>
        </div>
      </th>
    </tr>
<%
	}
%>
  </tbody>
</table>
</form>
</div>
</body>
</html>
<%
	} else {
		
		response.sendRedirect("index.jsp");
		
	}
%>