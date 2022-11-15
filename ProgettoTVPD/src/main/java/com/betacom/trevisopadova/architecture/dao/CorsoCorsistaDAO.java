package com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

public class CorsoCorsistaDAO implements DAOConstants{ 
	private CachedRowSet rowSet;
	
	private CorsoCorsistaDAO() {
		super();
	}
	
	public static CorsoCorsistaDAO getFactory() {
		return new CorsoCorsistaDAO();
	}
	
	public void create(Connection conn, CorsoCorsista cc) throws SQLException {
		rowSet.setCommand(SELECT_CORSO_CORSISTA);
		rowSet.execute(conn);
		rowSet.moveToInsertRow();
		rowSet.updateLong(1, cc.getCodCorso());
		rowSet.updateLong(2, cc.getCodCorsista());
		rowSet.insertRow();
		rowSet.moveToCurrentRow();
		rowSet.acceptChanges();
	}
}
