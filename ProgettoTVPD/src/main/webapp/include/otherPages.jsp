<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String currentPage = request.getParameter("currentPage");
%>
<section>
	<a
		class="btn <%=currentPage.equals("reportCorsisti") ? "btn-primary" : "btn-warning"%> btn_redirect"
		href="reportCorsisti.jsp"
		<%=currentPage.equals("reportCorsisti") ? "style=\"pointer-events: none; cursor: default; opacity: 0.8\"" : ""%>>
		<i class="glyphicon glyphicon-stats"></i> Vai a report corsisti
	</a> <a
		class="btn <%=currentPage.equals("reportCorsi") ? "btn-primary" : "btn-warning"%> btn_redirect"
		href="reportCorsi.jsp"
		<%=currentPage.equals("reportCorsi") ? "style=\"pointer-events: none; cursor: default; opacity: 0.8\"" : ""%>>
		<i class="glyphicon glyphicon-list-alt"></i> Vai a report corsi
	</a> <a
		class="btn <%=currentPage.equals("statistiche") ? "btn-primary" : "btn-warning"%> btn_redirect"
		href="statistiche.jsp"
		<%=currentPage.equals("statistiche") ? "style=\"pointer-events: none; cursor: default; opacity: 0.8\"" : ""%>>
		<i class="glyphicon glyphicon-stats"></i> Vai a statistiche
	</a>
</section>