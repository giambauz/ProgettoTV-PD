<%@page import="java.util.Locale"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.utilities.Statistiche"%>
<%
	if(session.getAttribute("statistica") == null){
		session.setAttribute("statistica", "null");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
    <% if(session.getAttribute("statistica").toString().equals("null")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null" selected></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("nCorsistiTotali")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali" selected>Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<table>
		<thead>
			<tr><td>Numero di corsisti totali</td></tr>
		</thead>
		<tbody>
			<tr><td><%= AmministratoreFacade.getInstance().getCountCorsista() %></td></tr>
		</tbody>
	</table>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("corsoPiuFrequentato")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato" selected>Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("dataInizioUltimoCorso")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso" selected>Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% Statistiche stats = new Statistiche(); %>
	<table>
		<thead>
			<tr><td>Data inizio ultimo corso</td></tr>
		</thead>
		<tbody>
			<% DateFormat df = DateFormat.getDateInstance(DateFormat.FULL,Locale.ITALY);
			%>
			<tr><td><%= df.format(stats.getCorsoUltimaData()) %></td></tr>
		</tbody>
	</table>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("durataMediaCorsi")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi" selected>Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% Statistiche stats = new Statistiche(); %>
	<table>
		<thead>
			<tr><td>Data inizio ultimo corso</td></tr>
		</thead>
		<tbody>
			<tr><td><%= stats.getDurataMediaCorsi() %></td></tr>
		</tbody>
	</table>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("numeroCommenti")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti" selected>Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% Statistiche stats = new Statistiche(); %>
	<table>
		<thead>
			<tr><td>Numero di commenti</td></tr>
		</thead>
		<tbody>
			<tr><td><%= stats.getCountCommenti() %></td></tr>
		</tbody>
	</table>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("elencoCorsisti")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti" selected>Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("docentePiuCorsi")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi" selected>Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili">Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% } %>
	<% if(session.getAttribute("statistica").toString().equals("corsiDisponibili")){ %>
	<form action="/<%= application.getServletContextName() %>/statistiche" method="get">
    <select name="stats">
    	<option value="null"></option>
    	<option value="nCorsistiTotali">Numero corsisti totali</option>
    	<option value="corsoPiuFrequentato">Corso pi&ugrave; frequentato</option>
    	<option value="dataInizioUltimoCorso">Data di inizio ultimo corso</option>
    	<option value="durataMediaCorsi">Durata media dei corsi</option>
    	<option value="numeroCommenti">Numero di commenti</option>
    	<option value="elencoCorsisti">Elenco dei corsisti</option>
        <option value="docentePiuCorsi">Docente con pi&ugrave; corsi</option>
        <option value="corsiDisponibili" selected>Corsi con posti disponibili</option>
    </select>
    <input type="submit" value="Elabora statistica">
	</form>
	<% } %>
</div>
</body>
</html>