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
	
	if (session.getAttribute("statistica") == null)
		session.setAttribute("statistica", "null");

	Cookie[] cookies = request.getCookies();
	boolean flagAccesso = false;

	for(int i=0; cookies != null && i < cookies.length; i++)
		if(cookies[i].getName().equals("cookieNominativo"))
			flagAccesso = true;
	
	if(session.getAttribute("sessionNominativo") != null)
		flagAccesso = true;

	if(!flagAccesso) 
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

	<div class="container">
	
		<header class="page-header report-header-lt">
			<h3>Report corsisti iscritti ai corsi</h3>	
		</header>
	
		<%
			if (session.getAttribute("statistica").toString().equals("null")) {
		%>
		<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null" selected></option>
				<option value="nCorsistiTotali">Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success btn-statistica-lt">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
		<div class="table-responsive">
			<table class="table table-striped table-lt">
				<thead>
					<tr>
						<td>seleziona una base di ricerca</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>.....</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%
			}
		%>

			<%
			if (session.getAttribute("statistica").toString().equals("nCorsistiTotali")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" selected>Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>

		
			<div class="table-responsive">
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
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("corsoPiuFrequentato")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" >Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato"selected>Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
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
						for (Corso c : stats.getPiuFrequentato()) {
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
							<% Docente d = mappaDocenti.get(c.getCodDocente()); %>
							<td><%=d.getNomeDocente()%> <%= d.getCognomeDocente() %></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("dataInizioUltimoCorso")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" >Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso" selected>Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
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
							<td><%=df.format(stats.getCorsoUltimaData())%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("durataMediaCorsi")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" >Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi" selected>Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
				<table class="table table-striped table-lt">
					<thead>
						<tr>
							<td>Durata media corsi</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=stats.getDurataMediaCorsi()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("numeroCommenti")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" >Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti" selected>Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
				<table class="table table-striped table-lt">
					<thead>
						<tr>
							<td>Numero di commenti</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=stats.getCountCommenti()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("elencoCorsisti")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" >Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti" selected>Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
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
						<td>
							 <form action="/<%=application.getServletContextName()%>/infoCorsista" method="post">
		                      <input type="hidden" name="codCorsista" id="codCorsista" value="<%=c.getCodCorsista()%>">
		                      <input type="submit" name="submitCorsista" id="submitCorsista" value="<%=c.getCodCorsista()%>">
		                    </form>
						</td>	
						<td><%=c.getNomeCorsista()%></td>
							<td><%=c.getCognomeCorsista()%></td>
							<%
							int prec = c.getPrecedentiFormativi();
							if (prec == 1) {
							%>
							<td>Si</td>
							<%
							} else {
							%>
							<td>No</td>
							<%
							}
							%>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("docentePiuCorsi")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali">Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi"  selected>Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili">Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
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
						for (Docente d : stats.getDocenteConPiuCorsi()) {
						%>
						<tr>
							<td><%=d.getCodDocente()%></td>
							<td><%=d.getNomeDocente()%></td>
							<td><%=d.getCognomeDocente()%></td>
							<td><a href="cv_pdf/<%=d.getCvDocente()%>"><%=d.getCvDocente() %></a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<%
			if (session.getAttribute("statistica").toString().equals("corsiDisponibili")) {
			%>
			<form class="form-select" action="/<%=application.getServletContextName()%>/statistiche"method="get">
			<select name="stats" class="btn btn-light">
				<option value="null"></option>
				<option value="nCorsistiTotali" >Numero corsisti
					totali</option>
				<option value="corsoPiuFrequentato">Corso pi&ugrave;
					frequentato</option>
				<option value="dataInizioUltimoCorso">Data di inizio
					ultimo corso</option>
				<option value="durataMediaCorsi">Durata media dei corsi</option>
				<option value="numeroCommenti">Numero di commenti</option>
				<option value="elencoCorsisti">Elenco dei corsisti</option>
				<option value="docentePiuCorsi">Docente con pi&ugrave;
					corsi</option>
				<option value="corsiDisponibili" selected>Corsi con posti
					disponibili</option>
			</select> 
			<button type="submit" value="Elabora statistica" class="btn btn-success">
				<i class="glyphicon glyphicon-refresh"></i>
				&nbsp;Elabora statistica
			</button>
		</form>
			<div class="search-fields-lt">
			<%
			Statistiche stats = new Statistiche();
			%>
			<div class="table-responsive">
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
							<td>Posti disponibili</td>
						</tr>
					</thead>
					<tbody>
						<%
						for (Corso c : AmministratoreFacade.getInstance().getDisponibiliCorso()) {
							int disp = stats.getPostiDisponibiliCorsi(c.getCodCorso());
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
							<% Docente d = mappaDocenti.get(c.getCodDocente()); %>
							<td><%=d.getNomeDocente()%> <%= d.getCognomeDocente() %></td>
							<td><%= disp %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<% } %>
			
			<div class="container-fluid btn_navigazione">
		
			<div class="box">
				<a class="btn btn-warning btn_redirect" href="reportCorsisti.jsp">
					<i class="glyphicon glyphicon-stats"></i>
					Vai a report corsisti
				</a>
			</div>
			
			<div class="box">
				<a class="btn btn-warning btn_redirect" href="reportCorsi.jsp">
					<i class="glyphicon glyphicon-list-alt"></i>
					Vai a report corsi
				</a>
			</div>
			
			<div class="box">
				<a class="btn btn-primary btn_redirect btn_block" href="statistiche.jsp">
					<i class="glyphicon glyphicon-stats"></i>
					Vai a statistiche
				</a>
			</div>
			
		</div>
	
		</div>
		
	</div>
	<%@ include file="include/footer.html"%>
</body>
</html>

<%
	}
%>