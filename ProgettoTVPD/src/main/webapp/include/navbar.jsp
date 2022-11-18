<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corsista"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Corso"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Docente"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.utilities.CookieSplitter"%>
<%@page import="com.betacom.trevisopadova.businesscomponent.model.Amministratore"%>
<nav class="navbar navbar-default navbar-fixed-top">
 	<div class="container-fluid">
    	<div class="navbar-header">
    		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	      		<span class="icon-bar"></span>
	      		<span class="icon-bar"></span>
	      		<span class="icon-bar"></span>
	    	</button>
      		<a class="navbar-brand" href="reportCorsisti.jsp">
        		<i class="glyphicon glyphicon-calendar"></i>
  				&nbsp;&nbsp;&nbsp;Gestione corsi
      		</a>
    	</div>
    
    	<div class="collapse navbar-collapse" id="myNavbar">
    		
    		<ul class="nav navbar-nav">
       			<li class="nav_left" data-toggle="modal" data-target="#createCorsoModal"><a href="#">Nuovo corso</a></li>
       			<li class="nav_left" data-toggle="modal" data-target="#createCorsistaModal"><a href="#">Nuovo corsista</a></li>
       			<li class="nav_left"><a href="#"data-toggle="modal" data-target="#createCorsoCorsistaModal">Assegna Corsista a corso</a></li>
    		</ul>
    	
    		<ul class="nav navbar-nav navbar-right">
    			<li role="presentation">
    				<a class="benvenuto_nav" href="#">
    					<span class="glyphicon glyphicon-user"></span>
    					<%
    						String nome = null;
    						String cognome = null;
    						
    						if(session.getAttribute("sessionNominativo") != null) {
    							
    							String[] split = null;
    							split = ((String)session.getAttribute("sessionNominativo")).split(":");
    							nome = split[0];
    							cognome = split[1];
    							
    						}else{	
    							
       							Cookie[] cookies = request.getCookies();
       							String[] splitted = null;
       							
       							for(int i=0; cookies !=null && i < cookies.length; i++) 
       								if(cookies[i].getName().equals("cookieNominativo")){
       									
       									Amministratore a = CookieSplitter.parseCookieAmministratore(cookies[i]);
       									nome = a.getNomeAdmin();
       									cognome = a.getCognomeAdmin();
       									
       								}
    						}
    					%>
    					&nbsp;&nbsp;Benvenuto&nbsp;<%= nome %>&nbsp; <%= cognome %>
    				</a>
    			</li>
				<li role="presentation">
					<a class="logout_nav" href="logout.jsp">
						Logout&nbsp;&nbsp;
						<span class="glyphicon glyphicon-log-out"></span>
					</a>
				</li>
			</ul>
    	</div>
  	</div>
</nav>
<jsp:include page="createCorsoModal.jsp"></jsp:include>
<jsp:include page="createCorsistaModal.jsp"></jsp:include>
<jsp:include page="createCorsoCorsistaModal.jsp"></jsp:include>
<script type="text/javascript" src="js/validazione.js"></script>