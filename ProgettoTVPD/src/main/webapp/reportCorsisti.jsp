<%
	
	Cookie[] cookies = request.getCookies();
	boolean flag = false;

	for(int i=0; cookies !=null && i<cookies.length; i++) {
		
		if(cookies[i].getName().equals("nomeAdmin") && cookies[i+1].getName().equals("cognomeAdmin"))
			flag = true;
		
	}
	
	if(session.getAttribute("nomeAdmin") != null && session.getAttribute("cognomeAdmin") != null)
		flag = true;

	if(flag) {
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="include/CDN.html" %>
	<link rel="stylesheet" href="css/style.css">
	<title>Report Corsisti</title>
</head>
<body>

	<jsp:include page="include/navbar.jsp"></jsp:include>
	
	<a href="include/logout.jsp">logout</a>
	
</body>
</html>

<%
	
	} else {
		
		response.sendRedirect("index.jsp");
		
	}

%>