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
			
			try {
				
				Login login = new Login();
				amministratore = login.getAmministratorePass(codAdmin);
				
				if(amministratore != null) {
					
					if(amministratore.getNomeAdmin().equals(nomeAdmin) && amministratore.getNomeAdmin().equals(cognomeAdmin)) {
						
						boolean ricordami = "on".equals(request.getParameter("ricordami"));
						
						Cookie cookieNome = null;
						Cookie cookieCognome = null;
						
						if(ricordami == true) {
							
							cookieNome = new Cookie("nomeAdmin", nomeAdmin);
							cookieNome.setMaxAge(86000);
							response.addCookie(cookieNome);
							
							cookieCognome = new Cookie("cognomeAdmin", cognomeAdmin);
							cookieCognome.setMaxAge(86000);
							response.addCookie(cookieCognome);
							
						}
						
						session.setAttribute("nomeAdmin", nomeAdmin);
						session.setAttribute("cognomeAdmin", cognomeAdmin);
						
					}  
						
				} 
				
				Integer count = (Integer)session.getAttribute("tentativi");
				session.setAttribute("tentativi", count-1);
				
				response.sendRedirect("index.jsp");
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
