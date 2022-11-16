package com.betacom.trevisopadova.businesscomponent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.betacom.trevisopadova.architecture.dao.CorsoDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Corso;

public class CorsoBC {
	private Connection conn;
	
	public CorsoBC() throws SQLException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public void create(Corso corso) throws SQLException, ClassNotFoundException, IOException {
		CorsoDAO.getFactory().create(conn, corso);
	}
	
	public void delete(Corso corso) throws SQLException {
		CorsoDAO.getFactory().delete(conn, corso.getCodCorso());
	}

	public Corso[] getAll() throws SQLException {
		return CorsoDAO.getFactory().getAll(conn);
		
	}
	
	public Corso[] getAllDopoDataOdierna(Date data) throws SQLException {
		return CorsoDAO.getFactory().getAllDopoDataOdierna(conn, data);
	}
	
}
