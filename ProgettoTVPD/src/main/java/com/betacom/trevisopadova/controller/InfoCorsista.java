package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;
import com.betacom.trevisopadova.businesscomponent.model.Corso;

@WebServlet("/infoCorsista")
public class InfoCorsista extends HttpServlet {
	private static final long serialVersionUID = -7329108425764543434L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Corso[] corsiFrequentati = null;
		try {
			corsiFrequentati = AmministratoreFacade.getInstance().getByCorsistaCorso(Long.parseLong(request.getParameter("codCorsista")));
		} catch (NumberFormatException | ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
		for(int i = 0; i < corsiFrequentati.length; i++)
			request.setAttribute("corsoFrequentato" + i, corsiFrequentati[i]);
		request.setAttribute("totale", corsiFrequentati.length);
		try {
			Corsista corsista = AmministratoreFacade.getInstance().getCorsistaById(Long.parseLong(request.getParameter("codCorsista")));
			request.setAttribute("corsista", corsista);
		} catch (NumberFormatException | ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/infoCorsista.jsp");
		rd.forward(request, response);
	}

}