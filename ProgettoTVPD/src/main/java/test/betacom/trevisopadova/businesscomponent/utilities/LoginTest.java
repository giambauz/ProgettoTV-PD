package test.betacom.trevisopadova.businesscomponent.utilities;

import static org.junit.Assert.fail;

import java.io.IOException;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.businesscomponent.security.AlgoritmoCodiceAccesso;
import com.betacom.trevisopadova.businesscomponent.utilities.Login;

class LoginTest {
	
	private static Login login;

	@Test
	void test() {
		
		String nomeAdmin = "admin2";
		String cognomeAdmin = "admin2";
		String codiceAdmin = AlgoritmoCodiceAccesso.convertiMD5("A002");
		
		String amministratorepass = null;
		
		if(nomeAdmin != null && cognomeAdmin != null && codiceAdmin != null) {
			
			try {
			
				login = new Login();
				amministratorepass = login.getAdmministratorePass(nomeAdmin, cognomeAdmin);
				
				if(amministratorepass != null) {
					
					if(amministratorepass.equals(codiceAdmin)) 
						System.out.println("Accesso esegito con successo");
					else 
						fail("Accesso negato");
						
				} else 
					fail("Accesso negato");
			
			} catch (ClassNotFoundException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
}
