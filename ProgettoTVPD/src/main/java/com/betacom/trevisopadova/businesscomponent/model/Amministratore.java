package com.betacom.trevisopadova.businesscomponent.model;

public class Amministratore {

	private String codAdmin;
	private String nomeAdmin;
	private String cognomeAdmin;
	
	public String getCodAdmin() {
		return codAdmin;
	}
	
	public void setCodAdmin(String codAdmin) {
		this.codAdmin = codAdmin;
	}
	
	public String getNomeAdmin() {
		return nomeAdmin;
	}
	
	public void setNomeAdmin(String nomeAdmin) {
		this.nomeAdmin = nomeAdmin;
	}
	
	public String getCognomeAdmin() {
		return cognomeAdmin;
	}
	
	public void setCognomeAdmin(String cognomeAdmin) {
		this.cognomeAdmin = cognomeAdmin;
	}

	@Override
	public String toString() {
		return "Amministratore [codAdmin=" + codAdmin + ", nomeAdmin=" + nomeAdmin + ", cognomeAdmin=" + cognomeAdmin
				+ "]";
	}
	
}
