package com.betacom.trevisopadova.businesscomponent.idgenerator;

import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.betacom.trevisopadova.architecture.dao.DAOConstants;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;

public class CorsistaIdGenerator implements IdGeneratorInterface, DAOConstants{
	private static CorsistaIdGenerator idGen;
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public static CorsistaIdGenerator getInstance() throws ClassNotFoundException, IOException, SQLException {
		if(idGen == null) {
			idGen = new CorsistaIdGenerator();
		}
		return idGen;
	}
	
	private CorsistaIdGenerator() throws ClassNotFoundException, IOException, SQLException {
		conn = DBAccess.getConnection();
	}

	@Override
	public long getNextId() throws IOException, ClassNotFoundException, SQLException {
		long id = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_CORSISTASEQ);
			rs.next();
			id = rs.getLong(1);
		}catch(SQLException sql) {
			sql.printStackTrace();
			System.out.println("Motivo: "+sql.getMessage());
			throw sql;
		}
		return id;
	}

}
