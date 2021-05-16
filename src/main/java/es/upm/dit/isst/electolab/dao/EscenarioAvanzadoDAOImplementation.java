package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.persistence.Query;
import es.upm.dit.isst.electolab.model.EscenarioAvanzado;

import org.hibernate.Session;

import es.upm.dit.isst.electolab.model.Analista;
import es.upm.dit.isst.electolab.model.EscenarioAvanzado;

public class EscenarioAvanzadoDAOImplementation implements EscenarioAvanzadoDAO{

	private static  EscenarioAvanzadoDAOImplementation instancia = null;
	private EscenarioAvanzadoDAOImplementation() {
	}

	public static EscenarioAvanzadoDAOImplementation getInstance() {
		if( null == instancia ) 
			instancia = new EscenarioAvanzadoDAOImplementation();
		return instancia;
	}

	@Override
	public void create(EscenarioAvanzado escAv){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.save(escAv);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public EscenarioAvanzado read(Integer id){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		EscenarioAvanzado escAv = session.get(EscenarioAvanzado.class, id);//Read
		session.getTransaction().commit();
		session.close();
		return escAv;
	}

	@Override
	public void update(EscenarioAvanzado escAv){
		Session session = SessionFactoryService.get().openSession();
		session.saveOrUpdate(escAv);
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void delete(EscenarioAvanzado escAv){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(escAv);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<EscenarioAvanzado> readAll(){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		List<EscenarioAvanzado> escAvs = session.createQuery("from EscenarioAvanzado").list();
		Collections.reverse(escAvs);
		session.getTransaction().commit();
		session.close();
		return escAvs;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<EscenarioAvanzado> getSimulaciones(Integer id) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		Query q = session.createQuery("from EscenarioAvanzado where analista.id = :id");
		q.setParameter("id", id);
		
		List<EscenarioAvanzado> simulaciones = q.getResultList();
		
		session.getTransaction().commit();
		session.close();
		return simulaciones;
	}
	
	
}
