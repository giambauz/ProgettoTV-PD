package test.com.betacom.trevisopadova.architecture.dao;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.betacom.trevisopadova.architecture.dao.CorsoDAO;
import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.model.Corso;

@TestMethodOrder(OrderAnnotation.class)
class CorsoDAOTest {
	private static Corso corso;
	private static Corso corso2;
	private static Connection conn;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		conn = DBAccess.getConnection();
		GregorianCalendar oggi = new GregorianCalendar();
		GregorianCalendar fraUnMese = new GregorianCalendar(oggi.get(Calendar.YEAR),
				oggi.get(Calendar.MONTH) + 1,
				oggi.get(Calendar.DAY_OF_MONTH));
		GregorianCalendar domani = new GregorianCalendar(oggi.get(Calendar.YEAR),
				oggi.get(Calendar.MONTH),
				oggi.get(Calendar.DAY_OF_MONTH) + 1);
		corso = new Corso();
		corso.setCodCorso(999);
		corso.setNomeCorso("CorsoProva");
		corso.setDataInizioCorso(oggi.getTime());
		corso.setDataFineCorso(fraUnMese.getTime());
		corso.setCostoCorso(1000);
		corso.setCommentiCorso("Questo \u00E8 un commento");
		corso.setAulaCorso("Aula Prova");
		corso.setCodDocente(5);
		
		corso2 = new Corso();
		corso2.setCodCorso(1999);
		corso2.setNomeCorso("CorsoProva");
		corso2.setDataInizioCorso(domani.getTime());
		corso2.setDataFineCorso(fraUnMese.getTime());
		corso2.setCostoCorso(1000);
		corso2.setCommentiCorso("Questo \u00E8 un commento");
		corso2.setAulaCorso("Aula Prova");
		corso2.setCodDocente(5);
	}

	@Test
	@Order(1)
	void testCreate() {
		try {
			System.out.println("Test Create");
			CorsoDAO.getFactory().create(conn, corso);
			CorsoDAO.getFactory().create(conn, corso2);
		} catch (SQLException e) {
			fail("Motivo: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Test
	@Order(2)
	void testGetAll() {
		try {
			System.out.println("Test GetAll");
			Corso[] corsi = CorsoDAO.getFactory().getAll(conn);
			for (Corso c : corsi)
				System.out.println(c);
		} catch (SQLException e) {
			fail("Motivo: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Test
	@Order(3)
	void testGetAllAfterDate() {
		try {
			System.out.println("Test GetAllAfterDate");
			Corso[] corsi = CorsoDAO.getFactory().getAllDopoDataOdierna(conn, new Date());
			for (Corso c : corsi)
				System.out.println(c);
		} catch (SQLException e) {
			fail("Motivo: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Test
	@Order(4)
	void testDelete() {
		try {
			System.out.println("Test Delete");
			CorsoDAO.getFactory().delete(conn, corso.getCodCorso());
			CorsoDAO.getFactory().delete(conn, corso2.getCodCorso());
		} catch (SQLException e) {
			fail("Motivo: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
		corso = null;
		corso2 = null;
		DBAccess.closeConnection();
		conn = null;
	}

}
