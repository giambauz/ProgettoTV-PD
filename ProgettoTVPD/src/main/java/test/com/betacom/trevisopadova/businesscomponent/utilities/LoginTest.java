package test.com.betacom.trevisopadova.businesscomponent.utilities;

import static org.junit.Assert.fail;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.businesscomponent.model.Amministratore;
import com.betacom.trevisopadova.businesscomponent.security.AlgoritmoCodiceAccesso;
import com.betacom.trevisopadova.businesscomponent.utilities.Login;

class LoginTest {
	
	private static Login login;

	@Test
	void test() throws SQLException {
		
		String nomeAdmin = "admin1";
		String cognomeAdmin = "admin1";
		String codAdmin = AlgoritmoCodiceAccesso.convertiMD5("A001");
		
		Amministratore amministratore = null;
		
		if(nomeAdmin != null && cognomeAdmin != null && codAdmin != null) {
			
			try {
			
				login = new Login();
				amministratore = login.getAmministratorePass(codAdmin);
				
				if(amministratore != null) {
					
					if(amministratore.getNomeAdmin().equals(nomeAdmin) && amministratore.getNomeAdmin().equals(cognomeAdmin)) 
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
