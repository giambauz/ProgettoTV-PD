<%

	Cookie[] cookies = request.getCookies();

	for(int i=0; cookies !=null && i<cookies.length; i++) {
		
		if(cookies[i].getName().equals("nomeAdmin") || cookies[i].getName().equals("cognomeAdmin")){
			
			cookies[i].setValue(null);
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			
		}
	
	}

	if(session.getAttribute("nomeAdmin") != null && session.getAttribute("cognomeAdmin") != null)
		session.invalidate();

	response.sendRedirect("index.jsp");
		
	
%>