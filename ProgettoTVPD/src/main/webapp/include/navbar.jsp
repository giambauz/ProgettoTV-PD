<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
	  
		<div class="navbar-header">
	    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	      		<span class="icon-bar"></span>
	      		<span class="icon-bar"></span>
	      		<span class="icon-bar"></span>
	    	</button>
   
    		<span class="navbar-text">
    			<i class="glyphicon glyphicon-calendar"></i>
    			&nbsp;&nbsp;&nbsp;Gestione corsi
    		</span>
	    		
	  	</div>
	  
	  	<div class="collapse navbar-collapse" id="myNavbar">
				
	    	<ul class="nav navbar-nav navbar-right">
	    		<li>
    				<p class="navbar-text" style="padding: 0px 30px !important;">
    					<span class="glyphicon glyphicon-user"></span>
    					&nbsp;&nbsp;Benvenuto&nbsp;<%= session.getAttribute("nomeAdmin") %>&nbsp;<%= session.getAttribute("cognomeAdmin") %>
    				</p>
	    		<li>
				<p class="navbar-text logout_nav" onclick="logout();" >
					<span class="glyphicon glyphicon-log-out"></span>
					&nbsp;&nbsp;Logout
				</p>
				<script type="text/javascript">
					function logout(){
						window.location = "logout.jsp";
					}
				</script>
				</li> 
	    	</ul>
	    	
	  	</div>
	</div>
</nav>