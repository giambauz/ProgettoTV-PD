package com.betacom.trevisopadova.controller;

import java.io.IOException;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Corsista corsista = getCorsista(request); 
		if(corsista != null) {
			try {
				AmministratoreFacade.getInstance().create(corsista);
				response.sendRedirect("test.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Motivo : " + e.getMessage());
			}
		}
	}

	private Corsista getCorsista(HttpServletRequest request) {
		Corsista corsista = null;
		long codCorsista = Long.parseLong(request.getParameter("codCorsista"));
		String nomeCorsista = request.getParameter("nomeCorsista");
		String cognomeCorsista = request.getParameter("cognomeCorsista");
		int precedentiFormativi = Integer.parseInt(request.getParameter("precedentiFormativi"));
		corsista = new Corsista();
		corsista.setCodCorsista(codCorsista);
		corsista.setNomeCorsista(nomeCorsista);
		corsista.setCognomeCorsista(cognomeCorsista);
		corsista.setPrecedentiFormativi(precedentiFormativi);
		return corsista;
	}
}
