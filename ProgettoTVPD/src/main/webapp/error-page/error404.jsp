<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<%@ include file="../include/CDN.html" %>
	<link rel="stylesheet" href="../css/style.css">
	<title>Error page 404</title>
<body>

	<div class="container">
		
		<div class="page-header">
			<h3>Pagina non trovata</h3>	
		</div>
	
		<div class="panel panel-danger">
			
			<header class="panel-heading">
				<h4>Impossibile caricare la risorsa richiesta</h4>
			</header>
	 	
	 		<div class="panel-body">
	 			
	 			<p>Per segnalare un eventuale problema:&nbsp;
	 				<a href="mailto:max@tin.it">Contattare il supporto tecnico</a>
				</p>
	 			
	 			<input type="button" class="btn btn-default" value="Indietro" onclick="window.history.back()" /> 
	 			
	 		</div>
		</div>
	</div>

</body>
</html>
