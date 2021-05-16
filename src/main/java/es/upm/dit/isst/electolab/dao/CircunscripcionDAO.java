package es.upm.dit.isst.electolab.dao;

import java.util.Collection;

import es.upm.dit.isst.electolab.model.Circunscripcion;

public interface CircunscripcionDAO {
	
	public void create(Circunscripcion circ);
	public Circunscripcion read(String nombre);
	public void update(Circunscripcion circ);
	public void delete(Circunscripcion circ);
	public Collection<Circunscripcion> readAll();

}
