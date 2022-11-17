package test.com.betacom.trevisopadova.businesscomponent.utilities;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.betacom.trevisopadova.architecture.dbaccess.DBAccess;
import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsistaIdGenerator;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsoIdGenerator;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;
import com.betacom.trevisopadova.businesscomponent.model.Corso;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;
import com.betacom.trevisopadova.businesscomponent.model.Docente;
import com.betacom.trevisopadova.businesscomponent.utilities.Statistiche;

@TestMethodOrder(OrderAnnotation.class)
class StatisticheTest {
	private static Corso c,co,cor;
	private static Corsista c1,c2;
	private static CorsoCorsista cc1,cc2;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		c = new Corso();
		c.setCodCorso(CorsoIdGenerator.getInstance().getNextId());
		c.setNomeCorso("Informatica");
		c.setDataInizioCorso(new GregorianCalendar(2022, 10, 1).getTime());
		c.setDataFineCorso(new GregorianCalendar(2022, 10, 10).getTime());
		c.setCostoCorso(300);
		c.setCommentiCorso("corso di Informatica base");
		c.setAulaCorso("A1");
		c.setCodDocente(2);
		AmministratoreFacade.getInstance().create(c);
		System.out.println("Inserito valore: "+c.toString());
		
		co = new Corso();
		co.setCodCorso(CorsoIdGenerator.getInstance().getNextId());
		co.setNomeCorso("Informatica");
		co.setDataInizioCorso(new GregorianCalendar(2022, 9, 1).getTime());
		co.setDataFineCorso(new GregorianCalendar(2022, 9, 31).getTime());
		co.setCostoCorso(300);
		co.setCommentiCorso("corso di Informatica avanzato");
		co.setAulaCorso("A2");
		co.setCodDocente(2);
		AmministratoreFacade.getInstance().create(co);
		System.out.println("Inserito valore: "+co.toString());
		
		cor = new Corso();
		cor.setCodCorso(CorsoIdGenerator.getInstance().getNextId());
		cor.setNomeCorso("Informatica");
		cor.setDataInizioCorso(new GregorianCalendar(2022, 8, 1).getTime());
		cor.setDataFineCorso(new GregorianCalendar(2022, 8, 30).getTime());
		cor.setCostoCorso(300);
		cor.setCommentiCorso("corso iperavanzato");
		cor.setAulaCorso("A3");
		cor.setCodDocente(1);
		AmministratoreFacade.getInstance().create(cor);
		System.out.println("Inserito valore: "+cor.toString());
		
		c1 = new Corsista();
		c1.setCodCorsista(CorsistaIdGenerator.getInstance().getNextId());
		c1.setNomeCorsista("Gabriele");
		c1.setCognomeCorsista("Maniaci");
		c1.setPrecedentiFormativi(0);
		AmministratoreFacade.getInstance().create(c1);
		System.out.println("Inserito corsista: "+c1.toString());
		
		c2 = new Corsista();
		c2.setCodCorsista(CorsistaIdGenerator.getInstance().getNextId());
		c2.setNomeCorsista("Nicolo");
		c2.setCognomeCorsista("Barella");
		c2.setPrecedentiFormativi(0);
		AmministratoreFacade.getInstance().create(c2);
		System.out.println("Inserito corsista: "+c2.toString());
		
		cc1 = new CorsoCorsista();
		cc1.setCodCorso(co.getCodCorso());
		cc1.setCodCorsista(c1.getCodCorsista());
		AmministratoreFacade.getInstance().create(cc1);
		System.out.println("Creata associazione corso-corsista: "+cc1.toString());
		
		cc2 = new CorsoCorsista();
		cc2.setCodCorso(co.getCodCorso());
		cc2.setCodCorsista(c2.getCodCorsista());
		AmministratoreFacade.getInstance().create(cc2);
		System.out.println("Creata associazione corso-corsista: "+cc2.toString());
	}

	@Test
	@Order(1)
	void testDocenteConPiuCorsi() {
		try {
			Statistiche stats = new Statistiche();
			Docente[] docenti = stats.getDocenteConPiuCorsi();
			System.out.println("Docente/i con piu corsi: ");
			for(int i=0; i<docenti.length;i++) {
				System.out.println(docenti[i].getCodDocente());
			}
		}catch(SQLException sql) {
			sql.printStackTrace();
			fail("Motivo: "+sql.getMessage());
		}
	}
	
	@Test
	@Order(2)
	void testCorsoPiuFrequentato() {
		try {
			Statistiche stats = new Statistiche();
			Corso[] corsi = stats.getPiuFrequentato();
			System.out.println("Corso/i piu frequentato: ");
			for(int i=0; i<corsi.length;i++) {
				System.out.println(corsi[i].getCodCorso());
			}
		}catch(SQLException sql) {
			sql.printStackTrace();
			fail("Motivo: "+sql.getMessage());
		}
	}
	
	@Test
	@Order(3)
	void testDurataMediaCorsi() {
		try {
			Statistiche stats = new Statistiche();
			double media = stats.getDurataMediaCorsi();
			System.out.println("durata media corsi: "+media);
		}catch(SQLException sql) {
			sql.printStackTrace();
			fail("Motivo: "+sql.getMessage());
		}
	}
	
	@Test
	@Order(4)
	void testCorsoUltimaData() {
		try {
			Statistiche stats = new Statistiche();
			Date data= stats.getCorsoUltimaData();
			System.out.println("Data ultimo corso"+data);
		}catch(SQLException sql) {
			sql.printStackTrace();
			fail("Motivo: "+sql.getMessage());
		}
	}
	
	@Test
	@Order(5)
	void testCountCommenti() {
		try {
			Statistiche stats = new Statistiche();
			int comm = stats.getCountCommenti();
			System.out.println("Numero commenti: "+comm);
		}catch(SQLException sql) {
			sql.printStackTrace();
			fail("Motivo: "+sql.getMessage());
		}
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		Connection conn = DBAccess.getConnection();
		Statement stmt = conn.createStatement();
		stmt.execute("delete from corso_corsista");
		conn.commit();
		AmministratoreFacade.getInstance().delete(c);
		AmministratoreFacade.getInstance().delete(co);
		AmministratoreFacade.getInstance().delete(cor);
		stmt.execute("delete from corsista");
		conn.commit();
		conn.close();
	}
}
