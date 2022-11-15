package test.com.betacom.trevisopadova.architecture.dbaccess;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;

class DBAccessTest {

	@Test
	void testConnection(){
		Connection conn = null;
		try {
			try {
				conn = DBAccess.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			assertNotNull(conn);
			if(conn != null) {
				System.out.println("Connessione creata");
			}
			DBAccess.closeConnection();
			System.out.println("Connessione chiusa");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
