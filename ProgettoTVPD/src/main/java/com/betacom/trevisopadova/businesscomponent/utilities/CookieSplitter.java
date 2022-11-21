package com.betacom.trevisopadova.businesscomponent.utilities;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.servlet.http.Cookie;

import com.betacom.trevisopadova.architecture.dao.DAOConstants;
import com.betacom.trevisopadova.businesscomponent.model.Amministratore;

public class CookieSplitter implements DAOConstants {
	private static String separator = ":";
	private static Base64.Encoder encoder = Base64.getEncoder();
	private static Base64.Decoder decoder = Base64.getDecoder();
	private static Charset choosenCharset = StandardCharsets.UTF_8;

	private CookieSplitter() {
	}

	public static Amministratore parseCookieAmministratore(Cookie nominativo) {
		Amministratore amministratore = null;
		String[] parts;
		if (nominativo != null) {
			amministratore = new Amministratore();
			parts = nominativo.getValue().split(separator);
			amministratore.setNomeAdmin(new String(decoder.decode(parts[0].getBytes(choosenCharset)), choosenCharset));
			amministratore.setCognomeAdmin(new String(decoder.decode(parts[1].getBytes(choosenCharset)), choosenCharset));
		}
		return amministratore;

	}

	public static Cookie createCookieAmministratore(Amministratore nominativo) {
		Cookie cookie = null;
		if (nominativo != null) {
			String name = "cookieNominativo";
			String value = String.format("%s%s%s",
					new String(encoder.encode(nominativo.getNomeAdmin().getBytes(choosenCharset)), choosenCharset), separator,
					new String(encoder.encode(nominativo.getCognomeAdmin().getBytes(choosenCharset)), choosenCharset));
			cookie = new Cookie(name, value);
			cookie.setMaxAge(60*60*8);
		}
		return cookie;
	}

}
