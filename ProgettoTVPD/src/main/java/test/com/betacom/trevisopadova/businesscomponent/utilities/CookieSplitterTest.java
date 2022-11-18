package test.com.betacom.trevisopadova.businesscomponent.utilities;

import static org.junit.jupiter.api.Assertions.*;

import javax.servlet.http.Cookie;

import org.junit.jupiter.api.Test;

import com.betacom.trevisopadova.businesscomponent.model.Amministratore;
import com.betacom.trevisopadova.businesscomponent.utilities.CookieSplitter;

class CookieSplitterTest {

	@Test
	void testCookie() {
		Amministratore amministratore = new Amministratore();
		amministratore.setNomeAdmin("admin1");
		amministratore.setCognomeAdmin("admin1");
		System.out.println("Amministratore: " + amministratore);
		Cookie cookie = CookieSplitter.createCookieAmministratore(amministratore);
		System.out.println("Cookie: " + cookie.getName() + " = " + cookie.getValue());
		Amministratore amministratoreConverted = CookieSplitter.parseCookieAmministratore(cookie);
		System.out.println("Amministratore da Cookie: " + amministratoreConverted);
		assertEquals(amministratore.getNomeAdmin(), amministratoreConverted.getNomeAdmin());
		assertEquals(amministratore.getCognomeAdmin(), amministratoreConverted.getCognomeAdmin());
	}

}
