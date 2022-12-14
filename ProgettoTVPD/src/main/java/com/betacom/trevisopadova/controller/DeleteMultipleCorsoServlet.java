package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.model.Corso;


@WebServlet("/rimuoviPiuCorsi")
public class DeleteMultipleCorsoServlet extends HttpServlet {
	private static final long serialVersionUID = 5973469864029878549L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Corso[] corsi = getCorsi(request);
		if (corsi != null) {
			try {
				for (Corso c : corsi) {
				Connection conn = DBAccess.getConnection();
				PreparedStatement ps = conn.prepareStatement("delete from corso_corsista where codCorso=?");
				ps.setLong(1, c.getCodCorso());
				ps.execute();
				conn.commit();
				ps.close();
				conn.close();
				AmministratoreFacade.getInstance().delete(c);
				}
				System.out.println(request.getHeader("Referer"));
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("reportCorsi.jsp");
	}
	
	private Corso[] getCorsi(HttpServletRequest request) {
		Corso[] corsi = null;
		String[] parametersCodCorso= request.getParameterValues("codCorso");
		if (parametersCodCorso != null && parametersCodCorso.length > 0) {
			corsi = new Corso[parametersCodCorso.length];
			for (int i = 0; i < corsi.length; i++) {
				Corso corso = new Corso();
				corso.setCodCorso(Long.parseLong(parametersCodCorso[i]));
				corsi[i] = corso;
			}
		}
		return corsi;
	}

}
