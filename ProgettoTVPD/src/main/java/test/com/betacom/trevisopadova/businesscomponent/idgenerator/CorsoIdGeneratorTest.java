package test.com.betacom.trevisopadova.businesscomponent.idgenerator;

import static org.junit.jupiter.api.Assertions.fail;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsoIdGenerator;

class CorsoIdGeneratorTest {

	@Test
	void test() {
		try {
			long id = CorsoIdGenerator.getInstance().getNextId();
			System.out.println("NextId: " + id);
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
			fail("Motivo: " + e.getMessage());
		}
		
	}

}
