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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<title>Report corsi</title>
</head>
<body>
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