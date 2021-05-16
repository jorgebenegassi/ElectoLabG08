package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.List;
import org.hibernate.Session;
import es.upm.dit.isst.electolab.model.Circunscripcion;

public class CircunscripcionDAOImplementation implements CircunscripcionDAO {

	private static CircunscripcionDAOImplementation instancia = null;
	private CircunscripcionDAOImplementation() {
	}

	public static CircunscripcionDAOImplementation getInstance() {
		if( null == instancia ) 
			instancia = new CircunscripcionDAOImplementation();
	    return instancia;
	  }
	  
	@Override
	public void create(Circunscripcion circ) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		
		//Operaciones
		session.save(circ);//Crear
		session.getTransaction().commit();
		session.close();
	}
	  
	@Override
	public Circunscripcion read(String nombre) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		
		//Operaciones
		Circunscripcion circ = session.get(Circunscripcion.class, nombre);//Read
		session.getTransaction().commit();
		session.close();
		return circ;
	}
	  
	@Override
	public void update(Circunscripcion circ) {
		Session session = SessionFactoryService.get().openSession();
		session.saveOrUpdate(circ);
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();

	}
	  
	@Override
	public void delete(Circunscripcion circ) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(circ);
		session.getTransaction().commit();
		session.close();
	}
	  
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Circunscripcion> readAll() {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		List<Circunscripcion> circs = session.createQuery("from Circunscripcion").list();	
		session.getTransaction().commit();
		session.close();
		return circs;
	}
}
