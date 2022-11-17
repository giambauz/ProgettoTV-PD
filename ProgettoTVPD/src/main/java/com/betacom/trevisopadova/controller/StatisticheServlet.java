package com.betacom.trevisopadova.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/statistiche")
public class StatisticheServlet extends HttpServlet {
	private static final long serialVersionUID = -3414050275627459010L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stat = request.getParameter("stats");
		HttpSession session = request.getSession();
		session.setAttribute("statistica", stat);
		response.sendRedirect("statistiche.jsp");
	}

}
