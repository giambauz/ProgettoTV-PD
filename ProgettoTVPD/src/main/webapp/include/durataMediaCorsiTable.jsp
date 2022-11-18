<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="statistiche"
	class="com.betacom.trevisopadova.businesscomponent.utilities.Statistiche"></jsp:useBean>
<table class="table table-striped table-lt">
	<thead>
		<tr>
			<td>Durata media corsi</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><%=statistiche.getDurataMediaCorsi()%></td>
		</tr>
	</tbody>
</table>