package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		session = request.getSession();
		
		String nomeAdmin = request.getParameter("nomeAdmin");
		String cognomeAdmin = request.getParameter("cognomeAdmin");
		String codAdmin = AlgoritmoCodiceAccesso.convertiMD5(request.getParameter("codAdmin"));
		
		if(nomeAdmin != null && cognomeAdmin != null && codAdmin != null) {

			Amministratore amministratore = null;
			Cookie cookieNominativo = null;
			
			try {
				
				Login login = new Login();
				amministratore = login.getAmministratorePass(codAdmin);
				
				if(amministratore != null) {
					
					if(amministratore.getNomeAdmin().equals(nomeAdmin) && amministratore.getNomeAdmin().equals(cognomeAdmin)) {
						
						boolean ricordami = "on".equals(request.getParameter("ricordami"));
						String nominativo = nomeAdmin+":"+cognomeAdmin;
						
						if(ricordami == true) {
							
							cookieNominativo = new Cookie("cookieNominativo", nominativo);
							cookieNominativo.setMaxAge(60*5);
							response.addCookie(cookieNominativo);
							
						}
						
						session.setAttribute("sessionNominativo", nominativo);
						
					}  
						
				} 
				
				if(session.getAttribute("sessionNominativo") == null) {
					
					Integer count = (Integer)session.getAttribute("countTentativi");
					session.setAttribute("countTentativi", count-1);
					
					if((Integer)session.getAttribute("countTentativi") == 0) {
						
						session.setAttribute("isBlock", "true");
						
						Cookie bloccato = new Cookie("isBlock", "block");
						bloccato.setMaxAge(30);
						response.addCookie(bloccato);
						
					}
					
					response.sendRedirect("index.jsp");
					
				} else {
					
					response.sendRedirect("reportCorsisti.jsp");
					
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
