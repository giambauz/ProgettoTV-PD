package com.betacom.trevisopadova.architecture.dao;

public interface DAOConstants {
	String SELECT_DOCENTE="select * from docente";
	String SELECT_CORSISTA="select * from corsista";
	String SELECT_CORSO="select * from corso";
	String SELECT_CORSO_CORSISTA="select * from corso_corsista";
	String SELECT_CORSOSEQ="select corso_seq.nextval from dual";
	String SELECT_CORSISTASEQ="select corsista_seq.nextval from dual";
	String SELECT_AMMINISTRATORE_BYID="select * from amministratore where codAdmin=?";
	String DELETE_CORSO="delete from corso where codCorso=?";
	String DELETE_CORSO_CORSISTA="delete from corso_corsista where codCorsista=?";
	String SELECT_COUNT_CORSISTA="select count(*) from corsista";
	String SELECT_CORSO_BY_CORSISTA="select * from corso where codCorso=(select codCorso from corso_corsista where codCorsista=?)";
	String SELECT_CORSO_DOPO_DATAODIERNA="select * from corso where dataInizioCorso>?";
	String SELECT_CORSO_PIU_FREQUENTATO="select * from corso where codCorso in (select corso from frequenze where totFrequenze >= all (select totFrequenze from frequenze))";
	String SELECT_CORSO_ULTIMA_DATA="select dataInizioCorso from corso where dataInizioCorso >= all (select dataInizioCorso from corso)";
	String SELECT_DOCENTE_CONPIU_CORSI="select * from docente where codDocente in (select docente from corsiPerDocente where totCorsi >= all (select totCorsi from corsiPerDocente))";
	String SELECT_DURATA_MEDIA_CORSI = "select avg(durata) from durataCorsi";
	String SELECT_CORSO_DISPONIBILE="select * from corso where codCorso not in (select corso from frequenze where totFrequenze>=12) and dataInizioCorso>sysdate";
	String SELECT_COUNT_COMMENTI="select count(commentiCorso) from corso";
	String SELECT_CORSISTI_ISCRITTI="select * from corsista where codCorsista in (select distinct codCorsista from corso_corsista)";
	String SELECT_POSTI_DISPONIBILI="select 12-totFrequenze from frequenze where corso=?";
}
