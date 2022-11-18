<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corsista"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%
Corso[] corsiFrequentati = new Corso[(int) request.getAttribute("totale")];
Corsista corsista = (Corsista)request.getAttribute("corsista");
for (int i = 0; i < corsiFrequentati.length; i++)
	corsiFrequentati[i] = (Corso) request.getAttribute("corsoFrequentato" + i);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include/CDN.html"%>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Riepilogo Corsi Corsista</title>
</head>
<body>
	<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">

		<header class="page-header report-header-lt">
			<h3>Riepilogo corsi di <b><%=  corsista.getNomeCorsista() %> <%= corsista.getCognomeCorsista()%></b></h3>
		</header>

		<div class="table-responsive">
			<table class="table table-striped table-lt">
				<thead>
					<tr>
						<th>Codice Corso</th>
						<th>Nome Corso</th>
						<th>Data Inizio Corso</th>
						<th>Data Fine Corso</th>
						<th>Costo Corso</th>
						<th>Commenti Corso</th>
						<th>Aula Corso</th>
						<th>Codice Docente</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < corsiFrequentati.length; i++) {
					%>
					<tr>
						<th><%=corsiFrequentati[i].getCodCorso()%></th>
						<th><%=corsiFrequentati[i].getNomeCorso()%></th>
						<th><%=corsiFrequentati[i].getDataInizioCorso()%></th>
						<th><%=corsiFrequentati[i].getDataFineCorso()%></th>
						<th><%=corsiFrequentati[i].getCostoCorso()%></th>
						<th><%=corsiFrequentati[i].getCommentiCorso()%></th>
						<th><%=corsiFrequentati[i].getAulaCorso()%></th>
						<th><%=corsiFrequentati[i].getCodDocente()%></th>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="include/footer.html"%>
</body>
</html>