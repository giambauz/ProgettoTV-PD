<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<table class="table table-striped table-lt">
	<thead>
		<tr>
			<td>Numero di corsisti totali</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><%=AmministratoreFacade.getInstance().getCountCorsista()%></td>
		</tr>
	</tbody>
</table>