package com.betacom.trevisopadova.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.model.Corso;


@WebServlet("/rimuoviCorso")
public class DeleteCorsoServlet extends HttpServlet {
	private static final long serialVersionUID = 3625018641779508126L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Corso corso = getCorso(request);
		if (corso != null) {
			try {
				Connection conn = DBAccess.getConnection();
				PreparedStatement ps = conn.prepareStatement("delete from corso_corsista where codCorso=?");
				ps.setLong(1, corso.getCodCorso());
				ps.execute();
				conn.commit();
				ps.close();
				conn.close();
				AmministratoreFacade.getInstance().delete(corso);
				response.sendRedirect("reportCorsi.jsp");
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
			}
		}
			
	}
	
	private Corso getCorso(HttpServletRequest request) {
		Corso corso = null;
		long codCorso = Long.parseLong(request.getParameter("codCorso"));
			
		corso = new Corso();
		corso.setCodCorso(codCorso);
		return corso;
	}

}
