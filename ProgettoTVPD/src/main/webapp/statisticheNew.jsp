<%@page import="java.util.ArrayList"%>
<%@page import="javafx.util.Pair"%>
<%@page import="javafx.animation.KeyValue"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.model.Corsista"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.DateFormat"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page
	import="com.betacom.trevisopadova.businesscomponent.utilities.Statistiche"%>
<%
Cookie[] cookies = request.getCookies();
boolean flagAccesso = false;

for (int i = 0; cookies != null && i < cookies.length; i++)
	if (cookies[i].getName().equals("cookieNominativo"))
		flagAccesso = true;

if (session.getAttribute("sessionNominativo") != null)
	flagAccesso = true;

if (!flagAccesso)
	response.sendRedirect("index.jsp");
else {
	AmministratoreFacade aF = AmministratoreFacade.getInstance();
	Map<Long, Docente> mappaDocenti = new HashMap<Long, Docente>();
	for (Docente d : aF.getAllDocente())
		mappaDocenti.put(d.getCodDocente(), d);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include/CDN.html"%>
<link rel="stylesheet" href="css/style.css">
<title>Report Corsisti</title>
</head>
<body>

	<jsp:include page="include/navbar.jsp"></jsp:include>

	<div class="container" style="width: 100%;">

		<header class="page-header report-header-lt">
			<h3>Statistiche</h3>
		</header>

		<form class="form form-select" method="get">
			<div class="row">
				<div class="col col-sm-4 col-md-3">
					<select name="stats" class="btn" style="width: 100%;">
						<%
						String selectedOption = request.getParameter("stats");
						if (selectedOption == null)
							selectedOption = "";
						ArrayList<Pair<String, String>> options = new ArrayList<>();
						options.add(new Pair<>("", ""));
						options.add(new Pair<>("nCorsistiTotali", "Numero corsisti totali"));
						options.add(new Pair<>("corsoPiuFrequentato", "Corso pi&ugrave; frequentato"));
						options.add(new Pair<>("dataInizioUltimoCorso", "Data di inizio ultimo corso"));
						options.add(new Pair<>("durataMediaCorsi", "Durata media dei corsi"));
						options.add(new Pair<>("numeroCommenti", "Numero di commenti"));
						options.add(new Pair<>("elencoCorsisti", "Elenco dei corsisti"));
						options.add(new Pair<>("docentePiuCorsi", "Docente con pi&ugrave; corsi"));
						options.add(new Pair<>("corsiDisponibili", "Corsi con posti disponibili"));

						for (Pair<String, String> o : options) {
						%>
						<option value="<%=o.getKey()%>"
							<%=selectedOption.equals(o.getKey()) ? "selected" : ""%>>
							<%=o.getValue()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="col col-sm-4 col-md-3">
					<button type="submit" value="Elabora statistica"
						class="btn btn-success" style="width: 100%;">
						<i class="glyphicon glyphicon-refresh"></i> &nbsp;Elabora
						statistica
					</button>
				</div>
			</div>
		</form>
		<div class="table-responsive">
			<%
			if (selectedOption.equals("")) {
			%>
			<jsp:include page="include/noSelectionTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("nCorsistiTotali")) {
			%>
			<jsp:include page="include/nCorsistiTotaliTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("corsoPiuFrequentato")) {
			%>
			<jsp:include page="include/corsoPiuFrequentatoTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("dataInizioUltimoCorso")) {
			%>
			<jsp:include page="include/dataInizioUltimoCorsoTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("durataMediaCorsi")) {
			%>
			<jsp:include page="include/durataMediaCorsiTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("numeroCommenti")) {
			%>
			<jsp:include page="include/numeroCommentiTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("elencoCorsisti")) {
			%>
			<jsp:include page="include/elencoCorsistiTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("docentePiuCorsi")) {
			%>
			<jsp:include page="include/docentePiuCorsiTable.jsp"></jsp:include>
			<%
			} else if (selectedOption.equals("corsiDisponibili")) {
			%>
			<jsp:include page="include/corsiDisponibiliTable.jsp"></jsp:include>
			<%
			}
			%>
		</div>
		<jsp:include page="include/otherPages.jsp">
			<jsp:param name="currentPage" value="statistiche" />
		</jsp:include>
	</div>
	<%@ include file="include/footer.html"%>
</body>
</html>

<%
}
%>