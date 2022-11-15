package test.com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import com.betacom.trevisopadova.architecture.dao.CorsoCorsistaDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

class CorsoCorsistaDAOTest {
	private static Connection conn;
	private static CorsoCorsista cc;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		conn = DBAccess.getConnection();
		cc = new CorsoCorsista();
		cc.setCodCorso(586);
		cc.setCodCorsista(587);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		try {
			conn.close();
		} catch (Exception exc) {
			exc.printStackTrace();
			System.out.println("Motivo : " + exc.getMessage());
		}
	}

	@Test
	void testCreate() {
		try {
			CorsoCorsistaDAO.getFactory().create(conn, cc);
		} catch (Exception exc) {
			exc.printStackTrace();
			System.out.println("Motivo : " + exc.getMessage());
		}
	}

	@Test
	void testDelete() {
		try {
			CorsoCorsistaDAO.getFactory().delete(conn, cc);
		} catch (Exception exc) {
			exc.printStackTrace();
			System.out.println("Motivo : " + exc.getMessage());
		}
	}
}
