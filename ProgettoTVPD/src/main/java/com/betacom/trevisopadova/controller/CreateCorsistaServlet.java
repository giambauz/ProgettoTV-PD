package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;

@WebServlet("/aggiungiCorsista")
public class CreateCorsistaServlet extends HttpServlet {
	private static final long serialVersionUID = 7614963766060784280L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Corsista corsista = getCorsista(request);
			AmministratoreFacade.getInstance().create(corsista);
			response.sendRedirect("reportCorsisti.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Motivo : " + e.getMessage());
			throw new ServletException(e.getMessage());
		}

	}

	private Corsista getCorsista(HttpServletRequest request) throws ClassNotFoundException, IOException, SQLException {
		Corsista corsista = null;
		String nomeCorsista = request.getParameter("nomeCorsista");
		String cognomeCorsista = request.getParameter("cognomeCorsista");
		boolean precedentiFormativiChecked = "on".equals(request.getParameter("precedentiFormativi"));
		int precedentiFormativi = precedentiFormativiChecked ? 1 : 0;
		corsista = new Corsista();
		corsista.setNomeCorsista(nomeCorsista);
		corsista.setCognomeCorsista(cognomeCorsista);
		corsista.setPrecedentiFormativi(precedentiFormativi);
		return corsista;
	}
}
