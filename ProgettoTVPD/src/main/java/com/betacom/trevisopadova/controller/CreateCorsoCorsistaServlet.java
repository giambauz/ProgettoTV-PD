package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;


@WebServlet("/aggiungiCorsoCorsista")
public class CreateCorsoCorsistaServlet extends HttpServlet {
	private static final long serialVersionUID = -7039732590295486389L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorsoCorsista cc = getCorsoCorsista(request);
		if (cc != null) {
			try {
				AmministratoreFacade.getInstance().create(cc);
				response.sendRedirect("reportCorsisti.jsp");
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
				System.out.println("Motivo : " + e.getMessage());
				throw new ServletException(e.getMessage());
			}
		}
	}
	
	private CorsoCorsista getCorsoCorsista(HttpServletRequest request) {
		CorsoCorsista cc = null;
		Long codCorso = Long.parseLong(request.getParameter("codCorso"));
		Long codCorsista= Long.parseLong(request.getParameter("codCorsista"));			
		cc = new CorsoCorsista();
		cc.setCodCorso(codCorso);
		cc.setCodCorsista(codCorsista);
		return cc;
	}

}
