package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.List;

import es.upm.dit.isst.electolab.model.EscenarioAvanzado;

public interface EscenarioAvanzadoDAO {

	public void create(EscenarioAvanzado escAv);
	public EscenarioAvanzado read(Integer id);
	public void update(EscenarioAvanzado escAv);
	public void delete(EscenarioAvanzado escAv);
	public Collection<EscenarioAvanzado> readAll();
	List<EscenarioAvanzado> getSimulaciones(Integer id);
	
}
