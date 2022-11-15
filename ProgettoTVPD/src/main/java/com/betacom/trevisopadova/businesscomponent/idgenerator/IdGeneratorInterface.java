package com.betacom.trevisopadova.businesscomponent.idgenerator;

import java.io.IOException;
import java.sql.SQLException;

public interface IdGeneratorInterface {
	long getNextId() throws IOException, ClassNotFoundException, SQLException;
}
