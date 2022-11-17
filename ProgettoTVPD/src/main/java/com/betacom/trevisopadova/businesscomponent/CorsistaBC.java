package com.betacom.trevisopadova.businesscomponent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.betacom.trevisopadova.architecture.dao.CorsistaDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;

public class CorsistaBC {
private Connection conn;
	
	public CorsistaBC() throws ClassNotFoundException, IOException, SQLException {
		conn = DBAccess.getConnection();
	}
	
	public void create(Corsista corsista) throws ClassNotFoundException, IOException, SQLException{
		CorsistaDAO.getFactory().create(conn, corsista);
	}
	
	public Corsista[] getAll() throws SQLException{
		return CorsistaDAO.getFactory().getAll(conn);
	}
	
	public int getCount() throws SQLException{
		return CorsistaDAO.getFactory().getCount(conn);
	}
	
}
