package com.betacom.trevisopadova.businesscomponent.facade;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import com.betacom.trevisopadova.businesscomponent.CorsoBC;
import com.betacom.trevisopadova.businesscomponent.CorsoCorsistaBC;
import com.betacom.trevisopadova.businesscomponent.model.Corsista;
import com.betacom.trevisopadova.businesscomponent.model.Corso;
import com.betacom.trevisopadova.businesscomponent.model.CorsoCorsista;

public class AmministratoreFacade {
	private static AmministratoreFacade af;
	private CorsoBC corsoBC;
	//private CorsistaBC corsistaBC;
	private CorsoCorsistaBC ccBC;
	
	private AmministratoreFacade() {
	}
	
	public static AmministratoreFacade getInstance() {
		if (af == null)
			af = new AmministratoreFacade();
		return af;
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
	
	public void getAllDopoDataOdiernaCorso(Date data)
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		corsoBC.getAllDopoDataOdierna(data);
	}
	
	public void getAllCorso()
			throws ClassNotFoundException, SQLException, IOException {
		corsoBC = new CorsoBC();
		corsoBC.getAll();
	}
	
	public void create(CorsoCorsista cc)
			throws ClassNotFoundException, SQLException, IOException {
		ccBC = new CorsoCorsistaBC();
		ccBC.create(cc);
	}
	
	public void create(Corsista corsista)
			throws ClassNotFoundException, SQLException, IOException {
		//corsistaBC = new CorsistaBC();
		//corsistaBC.create(corsista);
	}
	
	public void getAllCorsista()
			throws ClassNotFoundException, SQLException, IOException {
		//corsistaBC = new CorsistaBC();
		//corsistaBC.getAll();
	}
	
	public void getCountCorsista()
			throws ClassNotFoundException, SQLException, IOException {
		//corsistaBC = new CorsistaBC();
		//corsistaBC.getCount();
	}
}