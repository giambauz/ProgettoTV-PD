package com.betacom.trevisopadova.businesscomponent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.betacom.trevisopadova.architecture.dao.CorsoCorsistaDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

public class CorsoCorsistaBC {
	Connection conn;
	
	public CorsoCorsistaBC() throws ClassNotFoundException, IOException, SQLException {
		conn = DBAccess.getConnection();
	}
	
	public void create(CorsoCorsista cc) throws SQLException {
		CorsoCorsistaDAO.getFactory().create(conn, cc);
	}
	
	public void delete(CorsoCorsista cc) throws SQLException {
		CorsoCorsistaDAO.getFactory().delete(conn, cc);
	}
	
}
