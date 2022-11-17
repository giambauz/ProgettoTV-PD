package com.betacom.trevisopadova.businesscomponent.facade;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import com.betacom.trevisopadova.businesscomponent.CorsistaBC;
import com.betacom.trevisopadova.businesscomponent.CorsoBC;
import com.betacom.trevisopadova.businesscomponent.CorsoCorsistaBC;
import com.betacom.trevisopadova.businesscomponent.DocenteBC;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;
import com.betacom.trevisopadova.businesscomponent.model.Corso;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;
import com.betacom.trevisopadova.businesscomponent.model.Docente;

public class AmministratoreFacade {
	private static AmministratoreFacade af;
	private DocenteBC docenteBC;
	private CorsoBC corsoBC;
	private CorsistaBC corsistaBC;
	private CorsoCorsistaBC ccBC;
	
	private AmministratoreFacade() {
	}
	
	public static AmministratoreFacade getInstance() {
		if (af == null)
			af = new AmministratoreFacade();
		return af;
	}
	
	public Docente[] getAllDocente()
			throws ClassNotFoundException, SQLException, IOException {
		docenteBC = new DocenteBC();
		return docenteBC.getAll();
	}

	
	public void create(Corso corso)
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		corsoBC.create(corso);
	}
	
	public void delete(Corso corso)
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		corsoBC.delete(corso);
	}
	
	public Corso[] getAllDopoDataOdiernaCorso(Date data)
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		return corsoBC.getAllDopoDataOdierna(data);
	}
	
	public Corso[] getDisponibiliCorso()
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		return corsoBC.getDisponibili();
	}

	
	public Corso[] getAllCorso()
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		return corsoBC.getAll();
	}
	
	public void create(CorsoCorsista cc)
			throws ClassNotFoundException, SQLException, IOException {
		ccBC = new CorsoCorsistaBC();
		ccBC.create(cc);
	}
	
	public void create(Corsista corsista)
			throws ClassNotFoundException, SQLException, IOException {
		corsistaBC = new CorsistaBC();
		corsistaBC.create(corsista);
	}
	
	public Corsista[] getAllCorsista()
			throws ClassNotFoundException, SQLException, IOException {
		corsistaBC = new CorsistaBC();
		return corsistaBC.getAll();
	}
	
	public int getCountCorsista()
			throws ClassNotFoundException, SQLException, IOException {
		corsistaBC = new CorsistaBC();
		return corsistaBC.getCount();
	}
	
	public Corsista[] getiscritti() throws ClassNotFoundException, IOException, SQLException {
		corsistaBC = new CorsistaBC();
		return corsistaBC.getIscritti();
	}
}
