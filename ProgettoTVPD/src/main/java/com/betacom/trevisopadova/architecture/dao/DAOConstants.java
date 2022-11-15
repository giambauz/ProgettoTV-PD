package com.betacom.trevisopadova.architecture.dao;

public interface DAOConstants {
	String SELECT_CORSISTA="select * from corsista";
	String SELECT_CORSO="select * from coso";
	String SELECT_CORSO_CORSISTA="select * from corso_corsista";
	String SELECT_CORSOSEQ="select corso_seq.nextval from dual";
	String SELECT_CORSISTASEQ="select corsista_seq from dual";
	String SELECT_AMMINISTRATORE_BYID="select * from amministratore where codAdmin=?";
	String DELETE_CORSO="delete from corso where codCorso=?";
}
