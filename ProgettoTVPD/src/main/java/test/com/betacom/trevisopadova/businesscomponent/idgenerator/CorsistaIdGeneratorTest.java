package test.com.betacom.trevisopadova.businesscomponent.idgenerator;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.businesscomponent.idgenerator.CorsistaIdGenerator;

class CorsistaIdGeneratorTest {

	@Test
	void testCorsistaIdGenerator(){
		try {
			CorsistaIdGenerator idGen = CorsistaIdGenerator.getInstance();
			System.out.println(idGen.getNextId());
			System.out.println(idGen.getNextId());
			System.out.println(idGen.getNextId());
			
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}
}
