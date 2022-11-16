package test.com.betacom.trevisopadova.businesscomponent.utilities;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.SQLException;
import java.util.Date;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.betacom.trevisopadova.businesscomponent.facade.AmministratoreFacade;
import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsoIdGenerator;
import com.betacom.trevisopadova.businesscomponent.model.Corso;
import com.betacom.trevisopadova.businesscomponent.model.Docente;
import com.betacom.trevisopadova.businesscomponent.utilities.Statistiche;

@TestMethodOrder(OrderAnnotation.class)
class StatisticheTest {
	private static Corso c,co,cor;

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
	}

	@Test
	@Order(1)
	void testDocenteConPiuCorsi() {
		try {
			Statistiche stats = new Statistiche();
			Docente[] docenti = stats.getDocenteConPiuCorsi();
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
	@Order(3)
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
	@Order(4)
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
		AmministratoreFacade.getInstance().delete(c);
		AmministratoreFacade.getInstance().delete(co);
		AmministratoreFacade.getInstance().delete(cor);
	}
}
