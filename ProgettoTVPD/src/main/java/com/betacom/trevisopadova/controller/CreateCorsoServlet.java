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
		Corso corso = getCorso(request);
		if (corso != null) {
			try {
				AmministratoreFacade.getInstance().create(corso);
				response.sendRedirect("test.jsp");
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
				System.out.println("Motivo : " + e.getMessage());
			}
		}
			
	}
	
	private Corso getCorso(HttpServletRequest request) {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		Corso corso = null;
		try {
			long codCorso = Long.parseLong(request.getParameter("codCorso"));
			String nomeCorso = request.getParameter("nomeCorso");
			Date dataInizioCorso = format.parse(request.getParameter("dataInizioCorso"));
			Date dataFineCorso = format.parse(request.getParameter("dataFineCorso"));
			double costoCorso = Double.parseDouble(request.getParameter("costoCorso"));
			String commentiCorso = request.getParameter("commentiCorso");
			String aulaCorso = request.getParameter("aulaCorso");
			long codDocente = Long.parseLong(request.getParameter("codDocente"));
			
			corso = new Corso();
			corso.setCodCorso(codCorso);
			corso.setNomeCorso(nomeCorso);
			corso.setDataInizioCorso(dataInizioCorso);
			corso.setDataFineCorso(dataFineCorso);
			corso.setCostoCorso(costoCorso);
			corso.setCommentiCorso(commentiCorso);
			corso.setAulaCorso(aulaCorso);
			corso.setCodDocente(codDocente);
		} catch(ParseException e) {
			e.printStackTrace();
		}
		return corso;
	}

}
