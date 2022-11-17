<%

	Cookie[] cookies = request.getCookies();

	for(int i=0; cookies !=null && i<cookies.length; i++) {
		
		if(cookies[i].getName().equals("cookieNominativo")){
			
			cookies[i].setValue(null);
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			
		}
	
	}

	if(session.getAttribute("sessionNominativo") != null)
		session.invalidate();

	response.sendRedirect("index.jsp");
		
	
%>