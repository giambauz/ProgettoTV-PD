package test.com.betacom.trevisopadova.architecture.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.betacom.trevisopadova.architecture.dao.CorsistaDAO;
import com.betacom.trevisopadova.architecture.dao.CorsoCorsistaDAO;
import com.betacom.trevisopadova.architecture.dao.CorsoDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsistaIdGenerator;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsoIdGenerator;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;
import com.betacom.trevisopadova.businesscomponent.model.Corso;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

@TestMethodOrder(OrderAnnotation.class)
class CorsoCorsistaDAOTest {
	private static Connection conn;
	private static CorsoCorsista cc;
	private static Corso corso;
	private static Corsista corsista;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		conn = DBAccess.getConnection();
		corso = new Corso();
		corso.setCodCorso(CorsoIdGenerator.getInstance().getNextId());
		corso.setAulaCorso("Aula Be");
		corso.setCodDocente(3);
		corso.setCommentiCorso("Commento a caso");
		corso.setCostoCorso(280);
		corso.setNomeCorso("Fisica Generale 1");
		corso.setDataInizioCorso(new GregorianCalendar(2021, 4, 21).getTime());
		corso.setDataFineCorso(new GregorianCalendar(2021, 8, 21).getTime());

		corsista = new Corsista();
		corsista.setCodCorsista(CorsistaIdGenerator.getInstance().getNextId());
		corsista.setNomeCorsista("Tizio");
		corsista.setCognomeCorsista("Caio");
		corsista.setPrecedentiFormativi(0);

		cc = new CorsoCorsista();
		cc.setCodCorso(corso.getCodCorso());
		cc.setCodCorsista(corsista.getCodCorsista());
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Motivo : " + e.getMessage());
		}
	}

	@Test
	@Order(1)
	void testCreate() {
		try {
			CorsoDAO.getFactory().create(conn, corso);
			CorsistaDAO.getFactory().create(conn, corsista);
			CorsoCorsistaDAO.getFactory().create(conn, cc);
		} catch (Exception exc) {
			exc.printStackTrace();
			System.out.println("Motivo : " + exc.getMessage());
		}
	}

	@Test
	@Order(2)
	void testDelete() {
		try {
			CorsoCorsistaDAO.getFactory().delete(conn, cc);
			CorsoDAO.getFactory().delete(conn, corso.getCodCorso());
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("Delete from Corsista where codCorsista = " + corsista.getCodCorsista());
		} catch (Exception exc) {
			exc.printStackTrace();
			System.out.println("Motivo : " + exc.getMessage());
		}
	}
}
