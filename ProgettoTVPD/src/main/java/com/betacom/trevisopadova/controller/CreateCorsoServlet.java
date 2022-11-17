package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.model.Corso;


@WebServlet("/aggiungiCorso")
public class CreateCorsoServlet extends HttpServlet {
	private static final long serialVersionUID = 4649588373326489630L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Corso corso = getCorso(request);
			AmministratoreFacade.getInstance().create(corso);
			response.sendRedirect("reportCorsi.jsp");
		} catch (ClassNotFoundException | SQLException | IOException | ParseException e) {
			e.printStackTrace();
			System.out.println("Motivo : " + e.getMessage());
			throw new ServletException(e.getMessage());
		}
		
	}
	
	private Corso getCorso(HttpServletRequest request) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Corso corso = null;
		String nomeCorso = request.getParameter("nomeCorso");
		Date dataInizioCorso = format.parse(request.getParameter("dataInizioCorso"));
		Date dataFineCorso = format.parse(request.getParameter("dataFineCorso"));
		double costoCorso = Double.parseDouble(request.getParameter("costoCorso"));
		String commentiCorso = request.getParameter("commentiCorso");
		String aulaCorso = request.getParameter("aulaCorso");
		long codDocente = Long.parseLong(request.getParameter("codDocente"));
		
		corso = new Corso();
		corso.setCodCorso(0);
		corso.setNomeCorso(nomeCorso);
		corso.setDataInizioCorso(dataInizioCorso);
		corso.setDataFineCorso(dataFineCorso);
		corso.setCostoCorso(costoCorso);
		corso.setCommentiCorso(commentiCorso);
		corso.setAulaCorso(aulaCorso);
		corso.setCodDocente(codDocente);
		return corso;
	}

}
