package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import es.upm.dit.isst.electolab.model.Analista;

public class AnalistaDAOImplementation implements AnalistaDAO {
	

	private static AnalistaDAOImplementation instancia = null;
	private AnalistaDAOImplementation() {
	}

	public static AnalistaDAOImplementation getInstance() {
		if( null == instancia ) 
			instancia = new AnalistaDAOImplementation();
	    return instancia;
	  }
	  
	@Override
	public void create(Analista analista) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		
		//Operaciones
		session.save(analista);//Crear
		session.getTransaction().commit();
		session.close();
	}
	  
	@Override
	public Analista read(Integer id) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		
		//Operaciones
		Analista analista = session.get(Analista.class, id);//Read
		session.getTransaction().commit();
		session.close();
		return analista;
	}
	  
	@Override
	public void update(Analista analista) {
		Session session = SessionFactoryService.get().openSession();
		session.saveOrUpdate(analista);
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();

	}
	  
	@Override
	public void delete(Analista analista) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(analista);
		session.getTransaction().commit();
		session.close();
	}
	  
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Analista> readAll() {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		List<Analista> analistas = session.createQuery("from Analista").list();	
		session.getTransaction().commit();
		session.close();
		return analistas;
	}
	  
	@SuppressWarnings("unchecked")
	@Override
	public Analista login(String email, String psd) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		Analista a = null;
		Query q = session.createQuery("select a from Analista a where a.email = :email and a.password = :password");
		q.setParameter("email", email);
		q.setParameter("password", psd);
		List<Analista> analistas = q.getResultList();
		if (analistas.size() > 0)
			a = (Analista) (q.getResultList().get(0));
		session.getTransaction().commit();
		session.close();
		return a;
	}
	
}
