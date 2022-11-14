package com.betacom.trevisopadova.businesscomponent.security;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class AlgoritmoCodiceAccesso {

		private static MessageDigest md;
		private static StringBuffer buffer;
		private static String salt;

		public static String convertiMD5(String password) {

			try {

				md = MessageDigest.getInstance("MD5");
				byte[] array = md.digest(password.getBytes(Charset.forName("UTF-8")));

				buffer = new StringBuffer();
				salt = "Ha1%4LsW7u9pQ$2Z";
				
				for (int i = 0; i < array.length; i++)
					buffer.append(String.format("%x", array[i]) + salt.toCharArray()[i]);

				return buffer.toString();

			} catch (NoSuchAlgorithmException e) {

				e.printStackTrace();
				return null;

			}

		}

	
}
