package test.com.betacom.trevisopadova.businesscomponent.security;

import static org.junit.Assert.assertNotNull;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.businesscomponent.security.AlgoritmoCodiceAccesso;

class AlgoritmoCodiceAccessoTest {

	@Test
	void testConversione() {
		
		String pass = AlgoritmoCodiceAccesso.convertiMD5("A002");
		assertNotNull(pass);
		System.out.println(pass);

	}

}
