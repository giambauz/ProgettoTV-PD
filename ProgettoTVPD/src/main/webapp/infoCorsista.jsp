<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%
	Corso[] corsiFrequentati = new Corso[(int)request.getAttribute("totale")];
	for(int i = 0; i < corsiFrequentati.length; i++)
		corsiFrequentati[i] = (Corso)request.getAttribute("corsoFrequentato" + i);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Riepilogo Corsi Corsista</title>
</head>
<body>
<%
	for(Corso c : corsiFrequentati){
%>
<h1><%=c.toString() %></h1>
<%
	}
%>
</body>
</html>