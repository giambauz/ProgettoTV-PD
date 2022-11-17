package com.betacom.trevisopadova.businesscomponent.utilities;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.betacom.trevisopadova.architecture.dao.DAOConstants;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Corso;
import com.betacom.trevisopadova.businesscomponent.model.Docente;

public class Statistiche implements DAOConstants{
	private Statement stmt;
	private ResultSet rs;
	private Connection conn;
	
	public Statistiche() {
		try {
			conn = DBAccess.getConnection();
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Docente[] getDocenteConPiuCorsi() throws SQLException {
		Docente[] d;
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_DOCENTE_CONPIU_CORSI);
		rs.last();
		d = new Docente[rs.getRow()];
		rs.beforeFirst();
		for(int i=0;rs.next();i++) {
			Docente docente = new Docente();
			docente.setCodDocente(rs.getLong(1));
			docente.setNomeDocente(rs.getString(2));
			docente.setCognomeDocente(rs.getString(3));
			docente.setCvDocente(rs.getString(4));
			d[i] = docente;
		}
		rs.close();
		return d;
	}
	
	public Corso[] getPiuFrequentato() throws SQLException {
		Corso[] c;
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_CORSO_PIU_FREQUENTATO);
		rs.last();
		c = new Corso[rs.getRow()];
		rs.beforeFirst();
		for(int i=0;rs.next();i++) {
			Corso corso = new Corso();
			corso.setCodCorso(rs.getLong(1));
			corso.setNomeCorso(rs.getString(2));
			corso.setDataInizioCorso(new java.util.Date((rs.getDate(3).getTime())));
			corso.setDataFineCorso(new java.util.Date(rs.getDate(4).getTime()));
			corso.setCostoCorso(rs.getDouble(5));
			corso.setCommentiCorso(rs.getString(6));
			corso.setAulaCorso(rs.getString(7));
			corso.setCodDocente(rs.getLong(8));
			c[i] = corso;
		}
		rs.close();
		return c;
	}
	
	public double getDurataMediaCorsi() throws SQLException {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(SELECT_DURATA_MEDIA_CORSI);
		rs.next();
		double media = rs.getDouble(1);
		rs.close();
		return media;
	}
	
	public Date getCorsoUltimaData() throws SQLException {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(SELECT_CORSO_ULTIMA_DATA);
		rs.next();
		Date data = new java.util.Date(rs.getDate(1).getTime());
		rs.close();
		return data;
	}
	
	public int getCountCommenti() throws SQLException {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(SELECT_COUNT_COMMENTI);
		rs.next();
		int n_comm = rs.getInt(1);
		rs.close();
		return n_comm;
	}
	
	public int getPostiDisponibiliCorsi(long id) throws SQLException {
		PreparedStatement ps = conn.prepareStatement(SELECT_POSTI_DISPONIBILI);
		ps.setLong(1, id);
		rs = ps.executeQuery();
		rs.next();
		int disp = rs.getInt(1);
		rs.close();
		ps.close();
		return disp;
	}
}
