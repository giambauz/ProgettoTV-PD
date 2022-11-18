<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@page import="java.util.Map"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="statistiche"
	class="com.betacom.trevisopadova.businesscomponent.utilities.Statistiche"></jsp:useBean>
<table class="table table-striped table-lt">
	<thead>
		<tr>
			<td>Codice corso</td>
			<td>Nome</td>
			<td>Data inizio</td>
			<td>Data fine</td>
			<td>Costo</td>
			<td>Commento</td>
			<td>Aula</td>
			<td>Insegnante</td>
		</tr>
	</thead>
	<tbody>
		<%
		AmministratoreFacade aF = AmministratoreFacade.getInstance();
		Map<Long, Docente> mappaDocenti = new HashMap<Long, Docente>();
		for (Docente d : aF.getAllDocente())
			mappaDocenti.put(d.getCodDocente(), d);
		for (Corso c : statistiche.getPiuFrequentato()) {
		%>
		<tr>
			<td><%=c.getCodCorso()%></td>
			<td><%=c.getNomeCorso()%></td>
			<%
			DateFormat df = DateFormat.getDateInstance(DateFormat.FULL, Locale.ITALY);
			%>
			<td><%=df.format(c.getDataInizioCorso())%></td>
			<td><%=df.format(c.getDataFineCorso())%></td>
			<td><%=c.getCostoCorso()%></td>
			<td><%=c.getCommentiCorso()%></td>
			<td><%=c.getAulaCorso()%></td>
			<%
			Docente d = mappaDocenti.get(c.getCodDocente());
			%>
			<td><%=d.getNomeDocente()%> <%=d.getCognomeDocente()%></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>