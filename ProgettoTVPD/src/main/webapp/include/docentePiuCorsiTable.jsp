<%@page
	import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="statistiche"
	class="com.betacom.trevisopadova.businesscomponent.utilities.Statistiche"></jsp:useBean>
<table class="table table-striped table-lt">
	<thead>
		<tr>
			<td>Codice docente</td>
			<td>Nome</td>
			<td>Cognome</td>
			<td>CV</td>
		</tr>
	</thead>
	<tbody>
		<%
		for (Docente d : statistiche.getDocenteConPiuCorsi()) {
		%>
		<tr>
			<td><%=d.getCodDocente()%></td>
			<td><%=d.getNomeDocente()%></td>
			<td><%=d.getCognomeDocente()%></td>
			<td><a href="cv_pdf/<%=d.getCvDocente()%>" class="btn btn-info">
					Scarica PDF</a></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>