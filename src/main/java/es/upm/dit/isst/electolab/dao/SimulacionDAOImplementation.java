package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.isst.electolab.model.Simulacion;

public class SimulacionDAOImplementation implements SimulacionDAO {
	
	private static  SimulacionDAOImplementation instancia = null;
	private SimulacionDAOImplementation() {
	}

	public static SimulacionDAOImplementation getInstance() {
		if( null == instancia ) 
			instancia = new SimulacionDAOImplementation();
		return instancia;
	}

	public Simulacion create(Simulacion simulacion){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.save(simulacion);
		session.getTransaction().commit();
		session.close();
		return simulacion;
	}

	public Simulacion read(Integer id){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		Simulacion simulacion = session.get(Simulacion.class, id);//Read
		session.getTransaction().commit();
		session.close();
		return simulacion;
	}

	public Simulacion update(Simulacion simulacion){
		Session session = SessionFactoryService.get().openSession();
		session.saveOrUpdate(simulacion);
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();
		return simulacion;

	}

	public Simulacion delete(Simulacion simulacion){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(simulacion);
		session.getTransaction().commit();
		session.close();
		return null;
	}

	@SuppressWarnings("unchecked")
	public Collection<Simulacion> readAll(){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		List<Simulacion> simulaciones = session.createQuery("from Simulacion").list();
		Collections.reverse(simulaciones);
		session.getTransaction().commit();
		session.close();
		return simulaciones;
	}
	
}
