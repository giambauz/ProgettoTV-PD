package test.com.betacom.trevisopadova.architecture.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.Statement;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.architecture.dao.CorsistaDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsistaIdGenerator;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;

class CorsistaDAOTest {
	private Corsista corsista;
	private Connection conn;
	private CorsistaIdGenerator idGen;
	
	
	@BeforeEach
	void setUp() throws Exception {
		idGen = CorsistaIdGenerator.getInstance();
		corsista = new Corsista();
		corsista.setNomeCorsista("Lucas");
		corsista.setCognomeCorsista("Test");
		corsista.setCodCorsista(idGen.getNextId());
		corsista.setPrecedentiFormativi(1);
		System.out.println(corsista.toString());
	}
	
	@Test
	void testCreate() {
		try {
			CorsistaDAO.getFactory().create(DBAccess.getConnection(), corsista);
		}catch(Exception exc) {
			exc.printStackTrace();
			fail("Motivo: " + exc.getMessage());
		}
	}
	
	@AfterEach
	void tearDown() throws Exception {
		corsista = null;
		conn = DBAccess.getConnection();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Delete from corsista where nomeCorsista = 'Lucas'");
		conn.commit();
		DBAccess.closeConnection();
	}

}
