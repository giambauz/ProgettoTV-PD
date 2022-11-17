package com.betacom.trevisopadova.businesscomponent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.betacom.trevisopadova.architecture.dao.DocenteDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Docente;

public class DocenteBC {
	private Connection conn;
	
	public DocenteBC() throws SQLException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}

	public Docente[] getAll() throws SQLException {
		return DocenteDAO.getFactory().getAll(conn);
	}
	
}
