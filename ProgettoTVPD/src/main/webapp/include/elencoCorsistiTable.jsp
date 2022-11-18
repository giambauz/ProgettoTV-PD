<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corsista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<table class="table table-striped table-lt">
	<thead>
		<tr>
			<td>Codice corsista</td>
			<td>Nome</td>
			<td>Cognome</td>
			<td>Precedenti formativi</td>
		</tr>
	</thead>
	<tbody>
		<%
		for (Corsista c : AmministratoreFacade.getInstance().getAllCorsista()) {
		%>
		<tr>
			<td><a class="btn btn-info"
				href="/<%=application.getServletContextName()%>/infoCorsista?codCorsista=<%=c.getCodCorsista()%>">
					Info corsista </a></td>
			<td><%=c.getNomeCorsista()%></td>
			<td><%=c.getCognomeCorsista()%></td>
			<td><%=c.getPrecedentiFormativi() == 1 ? "S&igrave;" : "No"%></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>