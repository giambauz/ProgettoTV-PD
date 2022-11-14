package com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.betacom.trevisopadova.businesscomponent.model.Corso;

public class CorsoDAO implements DAOConstants{
	public static CorsoDAO getFactory() throws SQLException {
		return new CorsoDAO();
	}

	private CachedRowSet rowSet;
	private PreparedStatement ps;
	private Statement stmt;
	private ResultSet rs;
	
	private CorsoDAO() throws SQLException {
		rowSet = RowSetProvider.newFactory().createCachedRowSet();
	}
	
	public void create(Connection conn, Corso corso) throws SQLException {
		rowSet.setCommand(SELECT_CORSO);
		rowSet.execute(conn);
		rowSet.moveToInsertRow();
		rowSet.updateLong(1, corso.getCodCorso());
		rowSet.updateString(2, corso.getNomeCorso());
		rowSet.updateDate(3, new java.sql.Date(corso.getDataInizioCorso().getTime()));
		rowSet.updateDate(4, new java.sql.Date(corso.getDataFineCorso().getTime()));
		rowSet.updateDouble(5, corso.getCostoCorso());
		rowSet.updateString(6, corso.getCommentiCorso());
		rowSet.updateString(7, corso.getAulaCorso());
		rowSet.updateLong(8, corso.getCodDocente());
		rowSet.insertRow();
		rowSet.moveToCurrentRow();
		rowSet.acceptChanges();
}
	
	public void delete(Connection conn, long id) throws SQLException {
		ps = conn.prepareStatement(DELETE_CORSO);
		ps.setLong(1, id);
		ps.execute();
		conn.commit();
	}
	
	public Corso[] getAll(Connection conn) throws SQLException {
		Corso[] corsi = null;
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_CORSO);
		rs.last();
		
		corsi = new Corso[rs.getRow()];
		rs.beforeFirst();
		for (int i = 0; rs.next(); i++) {
			Corso corso = new Corso();
			corso.setCodCorso(rs.getLong(1));
			corso.setNomeCorso(rs.getString(2));
			corso.setDataInizioCorso(new Date(rs.getDate(3).getTime()));
			corso.setDataFineCorso(new  Date(rs.getDate(4).getTime()));
			corso.setCostoCorso(rs.getDouble(5));
			corso.setCommentiCorso(rs.getString(6));
			corso.setAulaCorso(rs.getString(7));
			corso.setCodDocente(rs.getLong(8));
			corsi[i] = corso;
		}
		rs.close();
		
		return corsi;
	}
	
	public Corso[] getAllDopoDataOdierna(Connection conn, Date data) throws SQLException {
		Corso[] corsi = null;
		ps = conn.prepareStatement(SELECT_CORSO_DOPO_DATAODIERNA);
		ps.setDate(1, new java.sql.Date(data.getTime()));
		rs = ps.executeQuery();
		rs.last();				
				
		corsi = new Corso[rs.getRow()];
		rs.beforeFirst();
		for (int i = 0; rs.next(); i++) {
			Corso corso = new Corso();
			corso.setCodCorso(rs.getLong(1));
			corso.setNomeCorso(rs.getString(2));
			corso.setDataInizioCorso(new Date(rs.getDate(3).getTime()));
			corso.setDataFineCorso(new  Date(rs.getDate(4).getTime()));
			corso.setCostoCorso(rs.getDouble(5));
			corso.setCommentiCorso(rs.getString(6));
			corso.setAulaCorso(rs.getString(7));
			corso.setCodDocente(rs.getLong(8));
			corsi[i] = corso;
		}
		rs.close();
		
		return corsi;
	}
	
}
