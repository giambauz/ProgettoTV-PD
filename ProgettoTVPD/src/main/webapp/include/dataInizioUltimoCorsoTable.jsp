<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="statistiche"
	class="com.betacom.trevisopadova.businesscomponent.utilities.Statistiche"></jsp:useBean>
<table class="table table-striped table-lt">
	<thead>
		<tr>
			<td>Data inizio ultimo corso</td>
		</tr>
	</thead>
	<tbody>
		<%
		DateFormat df = DateFormat.getDateInstance(DateFormat.FULL, Locale.ITALY);
		%>
		<tr>
			<td><%=df.format(statistiche.getCorsoUltimaData())%></td>
		</tr>
	</tbody>
</table>