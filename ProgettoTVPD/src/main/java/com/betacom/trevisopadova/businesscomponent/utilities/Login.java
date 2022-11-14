package com.betacom.trevisopadova.businesscomponent.utilities;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.betacom.trevisopadova.architecture.dao.DAOCostants;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;

public class Login implements DAOCostants {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Login() throws ClassNotFoundException, IOException {
		
		conn = DBAccess.getConnection();
		
	}

	public String getAdmministratorePass(String nomeAdmin, String cognomeAdmin) {
		
		String passAdmin = null;
		
		try {
			
			ps = conn.prepareStatement(SELECT_AMMINISTRATORE);
			
			ps.setString(1, nomeAdmin);
			ps.setString(2, cognomeAdmin);
			
			rs = ps.executeQuery();
			
			if(rs.next()) 
				passAdmin = rs.getString(1);
			
			rs.close();
			ps.close();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return passAdmin;
		
	}
	
}
