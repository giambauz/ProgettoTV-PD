package com.betacom.trevisopadova.businesscomponent.utilities;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.betacom.trevisopadova.architecture.dao.DAOConstants;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Amministratore;

public class Login implements DAOConstants {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Login() throws ClassNotFoundException, IOException, SQLException {
		
		conn = DBAccess.getConnection();
		
	}

	public Amministratore getAmministratorePass(String codAdmin) {
		
		Amministratore amministratore = null;
		
		try {
			
			ps = conn.prepareStatement(SELECT_AMMINISTRATORE_BYID);
			
			ps.setString(1, codAdmin);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				amministratore = new Amministratore();
				amministratore.setCodAdmin(rs.getString(1));
				amministratore.setNomeAdmin(rs.getString(2));
				amministratore.setCognomeAdmin(rs.getString(3));
				
			}
			
			rs.close();
			ps.close();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return amministratore;
		
	}
	
}
