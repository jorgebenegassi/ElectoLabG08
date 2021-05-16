package es.upm.dit.isst.electolab.dao;

import java.util.Collection;

import es.upm.dit.isst.electolab.model.EscenarioBasico;

public interface EscenarioBasicoDAO {

	public EscenarioBasico create(EscenarioBasico escBa);
	public EscenarioBasico read(Integer id);
	public void update(EscenarioBasico escBa);
	public void delete(EscenarioBasico escBa);
	public Collection<EscenarioBasico> readAll();
	
}
