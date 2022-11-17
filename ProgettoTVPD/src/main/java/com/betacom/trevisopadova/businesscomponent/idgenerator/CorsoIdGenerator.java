package com.betacom.trevisopadova.businesscomponent.idgenerator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.betacom.trevisopadova.architecture.dao.DAOConstants;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;

public class CorsoIdGenerator implements IdGeneratorInterface, DAOConstants {
	private static CorsoIdGenerator idGen;
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private CorsoIdGenerator()
			throws SQLException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public static CorsoIdGenerator getInstance()
			throws SQLException, ClassNotFoundException, IOException {
		if (idGen == null)
			idGen = new CorsoIdGenerator();
		return idGen;
	}
	
	@Override
	public long getNextId()
			throws IOException, ClassNotFoundException, SQLException {
		long id = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_CORSOSEQ);
			rs.next();
			id = rs.getLong(1);
		}catch (SQLException sql) {
			throw sql;
		}
		return id;
	}

}
