package com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.betacom.trevisopadova.businesscomponent.model.Docente;

public class DocenteDAO implements DAOConstants{
	public static DocenteDAO getFactory() throws SQLException {
		return new DocenteDAO();
	}

	private Statement stmt;
	private ResultSet rs;
	
	public Docente[] getAll(Connection conn) throws SQLException {
		Docente[] docenti = null;
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(SELECT_DOCENTE);
		rs.last();
		
		docenti = new Docente[rs.getRow()];
		rs.beforeFirst();
		for (int i = 0; rs.next(); i++) {
			Docente docente = new Docente();
			docente.setCodDocente(rs.getLong(1));
			docente.setNomeDocente(rs.getString(2));
			docente.setCognomeDocente(rs.getString(3));;
			docente.setCvDocente(rs.getString(4));
			docenti[i] = docente;
		}
		rs.close();
		
		return docenti;
	}
}
