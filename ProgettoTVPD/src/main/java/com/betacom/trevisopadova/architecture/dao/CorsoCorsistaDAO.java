package com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;

import javax.sql.rowset.CachedRowSet;

import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

public class CorsoCorsistaDAO { //TODO implements DAOConstats
	private CachedRowSet rowSet;
	
	private CorsoCorsistaDAO() {
		super();
	}
	
	public static CorsoCorsistaDAO getFactory() {
		return new CorsoCorsistaDAO();
	}
	
	public void create(Connection conn, CorsoCorsista cc) {
		
	}
}
