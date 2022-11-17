package test.com.betacom.trevisopadova.architecture.dao;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.architecture.dao.DocenteDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Docente;

class DocenteDAOTest {

	private static Connection conn;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		conn = DBAccess.getConnection();
	}

	@Test
	void testGetAll() {
		try {
			System.out.println("Test GetAll");
			Docente[] docenti = DocenteDAO.getFactory().getAll(conn);
			for (Docente d : docenti)
				System.out.println(d);
		} catch (SQLException e) {
			fail("Motivo: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
		DBAccess.closeConnection();
		conn = null;
	}

}
