package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsistaIdGenerator;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;


@WebServlet("/aggiungiCorsista")
public class CreateCorsistaServlet extends HttpServlet {
	private static final long serialVersionUID = 7614963766060784280L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Corsista corsista = null;
		try {
			corsista = getCorsista(request);
		} catch (ClassNotFoundException | IOException | SQLException e1) {
			e1.printStackTrace();
		} 
		if(corsista != null) {
			try {
				System.out.println(corsista.toString());
				AmministratoreFacade.getInstance().create(corsista);
				response.sendRedirect("reportCorsisti.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Motivo : " + e.getMessage());
			}
		}
	}

	private Corsista getCorsista(HttpServletRequest request) throws ClassNotFoundException, IOException, SQLException {
		Corsista corsista = null;
		long codCorsista = CorsistaIdGenerator.getInstance().getNextId();
		String nomeCorsista = request.getParameter("nomeCorsista");
		String cognomeCorsista = request.getParameter("cognomeCorsista");
		boolean flagcheck = "on".equals(request.getParameter("precedentiFormativi"));
		int precedentiFormativi;
		if(flagcheck)
			precedentiFormativi = 1;
		else
			precedentiFormativi = 0;
		corsista = new Corsista();
		corsista.setCodCorsista(codCorsista);
		corsista.setNomeCorsista(nomeCorsista);
		corsista.setCognomeCorsista(cognomeCorsista);
		corsista.setPrecedentiFormativi(precedentiFormativi);
		System.out.println(corsista.toString());
		return corsista;
	}
}
