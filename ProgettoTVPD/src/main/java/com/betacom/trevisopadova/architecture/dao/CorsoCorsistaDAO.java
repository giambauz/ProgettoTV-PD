package com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

public class CorsoCorsistaDAO implements DAOConstants{ 
	private CachedRowSet rowSet;
	private PreparedStatement ps;
	
	private CorsoCorsistaDAO() {
		try {
			rowSet = RowSetProvider.newFactory().createCachedRowSet();
		} catch (Exception exc) {
			exc.printStackTrace();
			System.out.println("Motivo : " + exc.getMessage());
		}
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
	
	public void delete(Connection conn, CorsoCorsista cc) throws SQLException {
		ps = conn.prepareStatement(DELETE_CORSO_CORSISTA);
		ps.setLong(1, cc.getCodCorsista());
		ps.execute();
		conn.commit();
	}
}
