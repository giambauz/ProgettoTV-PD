package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betacom.trevisopadova.businesscomponent.model.Amministratore;
import com.betacom.trevisopadova.businesscomponent.security.AlgoritmoCodiceAccesso;
import com.betacom.trevisopadova.businesscomponent.utilities.Login;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = -7036145150065811639L;
	
	private HttpSession session;
	private Login login;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomeAdmin = request.getParameter("nomeAdmin");
		String cognomeAdmin = request.getParameter("cognomeAdmin");
		String codAdmin = AlgoritmoCodiceAccesso.convertiMD5(request.getParameter("codAdmin"));
		
		session = request.getSession();
		Amministratore amministratore = null;
		
		if(nomeAdmin != null && cognomeAdmin != null && codAdmin != null) {

			try {
				
				login = new Login();
				amministratore = login.getAmministratorePass(codAdmin);
				
				if(amministratore != null) {
					
					if(amministratore.getNomeAdmin().equals(nomeAdmin) && amministratore.getNomeAdmin().equals(cognomeAdmin)) {
						
						session.setAttribute("nomeAdmin", nomeAdmin);
						session.setAttribute("cognomeAdmin", cognomeAdmin);
						response.sendRedirect("test.jsp");
						
					} else { 
						response.sendRedirect("index.jsp");
					}
				} else {
					response.sendRedirect("index.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
