package com.betacom.trevisopadova.businesscomponent;

import java.io.IOException;
import java.sql.Connection;

import com.betacom.trevisopadova.architecture.dao.CorsoCorsistaDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

public class CorsoCorsistaBC {
	Connection conn;
	
	public CorsoCorsistaBC() throws ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public void create(CorsoCorsista cc) {
		CorsoCorsistaDAO.getFactory().create(conn, cc);
	}
}
