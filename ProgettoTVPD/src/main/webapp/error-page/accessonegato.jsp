<%

	if(session.getAttribute("tentativi") == null)
		session.setAttribute("tentativi", (Integer)5);
	
	if((Integer)session.getAttribute("tentativi") != 0) {
		
		Cookie bloccato = new Cookie("bloccato", "true");
		bloccato.setValue("23:59:59"); //86400
		response.addCookie(bloccato);
		
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/CDN.html" %>
	<link rel="stylesheet" href="../css/style.css">
	<title>Accesso bloccato</title>
</head>
<body style="background: radial-gradient(50% 50% at 50% 50%, #41908F 0%, #0C6677 100%) !important;">

	<img class="wallpaper_gen img-responsive" alt="wallpaper-login" src="../img/wallpaper_index.png">
	
	<div class="container container_accessonegato">
	
		<header class="page-header">
			<h3>Accesso bloccato</h3>	
		</header>
	
		<div class="panel panel-danger">
			
			<div class="panel-heading">
				<h3>Mi dispiace, hai terminato i tuoi tentativi di accesso per oggi</h3>
			</div>
			
			<div class="panel-body">
				<p>Script --> Torna tra:&nbsp;<span id="contoAllaRovescia1">0 : 0 : 5</span></p>
				<p>Cookie --> Torna tra:&nbsp;<span id="contoAllaRovescia2"></span></p>
			</div>
			
		</div>
	
	</div>

	<script type="text/javascript">
	
		var contoAllaRovescia = setInterval(function() {
			
			<%
			
				String ore = bloccato.getValue();
				int i = Integer.parseInt(ore);
				i = i/60;
				i = i/60;
		
			%>
			
			var hh = <%= i %>;
			document.getElementById("contoAllaRovescia2").innerHTML = hh;
			
		}, 1000);
	
		<!--var hhrimanenti = 0;
		var mmrimanenti = 0;
		var ssrimanenti = 5;
		
	     var contoAllaRovescia = setInterval(function() {
	    	 
	    	 if(ssrimanenti != 0){
	    		 
	    		 ssrimanenti--;
	    		 document.getElementById("contoAllaRovescia1").innerHTML = hhrimanenti+" : "+mmrimanenti+" : "+ssrimanenti;
	    		 
	    	 } else {
	    		 
	    		 if(mmrimanenti != 0){
	    			 
	    			 mmrimanenti--;
		    		 ssrimanenti = 60;
	    			 
	    		 } else {
	    			 
	    			 if(hhrimanenti != 0){
	    				 
	    				 hhrimanenti--;
	    				 mmrimanenti = 0;
	    				 document.getElementById("contoAllaRovescia1").innerHTML = hhrimanenti+" : "+mmrimanenti+" : "+ssrimanenti;
	    				 
	    			 }
	    			 
	    		 }
	    		 
	    	 }
	    	 
	    	 if(ssrimanenti == 0 && mmrimanenti == 0 && hhrimanenti == 0){
	    		 window.location = "accessonegato.jsp";
	    	 }
	    	 	
	     }, 1000);-->
	
	</script>

</body>
</html>
<%
	} else {
		response.sendRedirect("../index.jsp");
	}
%>