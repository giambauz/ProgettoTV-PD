<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");
%>
<jsp:useBean id="corsoBC" class="com.betacom.trevisopadova.businesscomponent.CorsoBC" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report corsi</title>
<form action="rimuoviCorsi" method="post">
<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Data inizio</th>
      <th>Data fine</th>
      <th>Costo</th>
      <th>Commenti</th>
      <th>Aula</th>
      <th>Docente</th>
      <th><input type="submit" value="Cancella selezionati"></th>
    </tr>
  </thead>
  <tbody>
<%	
	for (Corso c : corsoBC.getAllDopoDataOdierna(new Date())){
%>
    <tr>
      <th><%= c.getNomeCorso() %></th>
      <th><%= formatDate.format(c.getDataInizioCorso()) %></th>
      <th><%= formatDate.format(c.getDataFineCorso()) %></th>
      <th><%= String.format("%.2f", c.getCostoCorso()) %></th>
      <th><%= c.getCommentiCorso() %></th>
      <th><%= c.getAulaCorso() %></th>
      <th><%= c.getCodDocente() %></th>
      <th>
         <input type="checkbox" name="codCorso" value="<%= c.getCodCorso() %>">
      </th>
    </tr>
<%
	}
%>
  </tbody>
</table>
</form>
</head>
<body>

</body>
</html>