package es.upm.dit.isst.electolab.dao;

import java.util.Collection;

import es.upm.dit.isst.electolab.model.Simulacion;

public interface SimulacionDAO {
	public Simulacion create(Simulacion simulacion);
	public Simulacion read(Integer id);
	public Simulacion update(Simulacion simulacion);
	public Simulacion delete(Simulacion simulacion);
	public Collection<Simulacion> readAll();
}
