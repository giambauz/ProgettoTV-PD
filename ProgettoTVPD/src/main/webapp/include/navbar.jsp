<nav class="navbar navbar-default navbar-fixed-top">
 	<div class="container-fluid">
    	<div class="navbar-header">
    		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	      		<span class="icon-bar"></span>
	      		<span class="icon-bar"></span>
	      		<span class="icon-bar"></span>
	    	</button>
      		<a class="navbar-brand" href="reportCorsisti.jsp" style="color: #F3F3F3 !important;">
        		<i class="glyphicon glyphicon-calendar"></i>
  				&nbsp;&nbsp;&nbsp;Gestione corsi
      		</a>
    	</div>
    	
    	<div class="collapse navbar-collapse" id="myNavbar">
    		<ul class="nav navbar-nav navbar-right">
    			<li role="presentation">
    				<a class="benvenuto_nav" href="#">
    					<span class="glyphicon glyphicon-user"></span>
    					<%
    						if(session.getAttribute("sessionNominativo") != null) {
    					%>
    					&nbsp;&nbsp;Benvenuto&nbsp;<%= session.getAttribute("sessionNominativo") %>
    					<%
    						} else {
    							
    							Cookie[] cookies = request.getCookies();
    							boolean flagCookieNominativo = false;
    							String[] splitted = null;
    							
    							for(int i=0; cookies !=null && i < cookies.length; i++) 
    								if(cookies[i].getName().equals("cookieNominativo")){
    									
    									flagCookieNominativo = true;
    									splitted = cookies[i].getValue().split(":");
    									
    								}
    							
    							if(flagCookieNominativo){		
    					%>
    					&nbsp;&nbsp;Benvenuto&nbsp;<%= splitted[0] %>&nbsp;<%= splitted[1] %>
    					<%
    							}
    						}
    					%>
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