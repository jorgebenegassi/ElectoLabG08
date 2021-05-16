package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.isst.electolab.model.EscenarioBasico;

public class EscenarioBasicoDAOImplementation implements EscenarioBasicoDAO{

	private static  EscenarioBasicoDAOImplementation instancia = null;
	private EscenarioBasicoDAOImplementation() {
	}

	public static EscenarioBasicoDAOImplementation getInstance() {
		if( null == instancia ) 
			instancia = new EscenarioBasicoDAOImplementation();
		return instancia;
	}

	@Override
	public EscenarioBasico create(EscenarioBasico escBa){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.save(escBa);
		session.getTransaction().commit();
		session.close();
		return escBa;
	}

	@Override
	public EscenarioBasico read(Integer id){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		EscenarioBasico escBa = session.get(EscenarioBasico.class, id);//Read
		session.getTransaction().commit();
		session.close();
		return escBa;
	}

	@Override
	public void update(EscenarioBasico escBa){
		Session session = SessionFactoryService.get().openSession();
		session.saveOrUpdate(escBa);
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void delete(EscenarioBasico escBa){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(escBa);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<EscenarioBasico> readAll(){
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		List<EscenarioBasico> escBas = session.createQuery("from EscenarioBasico").list();
		Collections.reverse(escBas);
		session.getTransaction().commit();
		session.close();
		return escBas;
	}
	
}
