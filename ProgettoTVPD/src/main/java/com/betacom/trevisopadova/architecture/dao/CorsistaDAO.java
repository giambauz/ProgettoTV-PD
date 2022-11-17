package com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.betacom.trevisopadova.businesscomponent.model.Corsista;

public class CorsistaDAO implements DAOConstants,Validator{
	private CachedRowSet rowSet;
	private Statement stmt;
	private ResultSet rs;
	
	
	private CorsistaDAO(){
		try {
			rowSet = RowSetProvider.newFactory().createCachedRowSet();
		}catch(SQLException sql) {
			sql.printStackTrace();
			System.out.println("Motivo: " + sql.getMessage());
		}
	}
	
	public static CorsistaDAO getFactory() throws SQLException {
		return new CorsistaDAO();
	}

	public void create(Connection conn, Corsista corsista) {
		try {
			rowSet.setCommand(SELECT_CORSISTA);
			rowSet.execute(conn);
			rowSet.moveToInsertRow();
			rowSet.updateLong(1, corsista.getCodCorsista());
			rowSet.updateString(2, corsista.getNomeCorsista());
			rowSet.updateString(3, corsista.getCognomeCorsista());
			rowSet.updateInt(4, corsista.getPrecedentiFormativi());
			rowSet.insertRow();
			rowSet.moveToCurrentRow();
			rowSet.acceptChanges();
		}catch(SQLException sql) {
			sql.printStackTrace();
			System.out.println("Motivo: " + sql.getMessage());
		}
	}
	
	public Corsista[] getAll(Connection conn) throws SQLException {
		Corsista[] corsisti = null;
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_CORSISTA);
		rs.last();
		
		corsisti = new Corsista[rs.getRow()];
		rs.beforeFirst();
		for (int i = 0; rs.next(); i++) {
			Corsista corsista = new Corsista();
			corsista.setCodCorsista(rs.getLong(1));
			corsista.setNomeCorsista(rs.getString(2));
			corsista.setCognomeCorsista(rs.getString(3));
			corsista.setPrecedentiFormativi(rs.getInt(4));
			corsisti[i] = corsista;
		}
		rs.close();
		
		return corsisti;
	}
	
	public int getCount(Connection conn) throws SQLException {
		int count = 0;
		
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_CORSISTA);
		rs.last();
		count = rs.getRow();
		rs.close();
		
		return count;
	}
	
	public Corsista[] getIscritti(Connection conn) throws SQLException {
		Corsista[] corsisti = null;
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_CORSISTI_ISCRITTI);
		rs.last();
		corsisti = new Corsista[rs.getRow()];
		rs.beforeFirst();
		for (int i = 0; rs.next(); i++) {
			Corsista corsista = new Corsista();
			corsista.setCodCorsista(rs.getLong(1));
			corsista.setNomeCorsista(rs.getString(2));
			corsista.setCognomeCorsista(rs.getString(3));
			corsista.setPrecedentiFormativi(rs.getInt(4));
			corsisti[i] = corsista;
		}
		rs.close();
		return corsisti;
	}

	@Override
	public void validate(Corsista entity) {
		
		
	}
	
}
