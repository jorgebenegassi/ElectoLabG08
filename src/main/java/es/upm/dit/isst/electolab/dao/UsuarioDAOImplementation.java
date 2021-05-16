package es.upm.dit.isst.electolab.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.isst.electolab.model.Usuario;

public class UsuarioDAOImplementation implements UsuarioDAO {

	private static UsuarioDAOImplementation instancia = null;
	private UsuarioDAOImplementation() {
	}

	public static UsuarioDAOImplementation getInstance() {
		if( null == instancia ) 
			instancia = new UsuarioDAOImplementation();
	    return instancia;
	  }
	  
	@Override
	public void create(Usuario usuario) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		
		//Operaciones
		session.save(usuario);//Crear
		session.getTransaction().commit();
		session.close();
	}
	  
	@Override
	public Usuario read(Integer id) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		
		//Operaciones
		Usuario usuario = session.get(Usuario.class, id);//Read
		session.getTransaction().commit();
		session.close();
		return usuario;
	}
	  
	@Override
	public void update(Usuario usuario) {
		Session session = SessionFactoryService.get().openSession();
		session.saveOrUpdate(usuario);
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();

	}
	  
	@Override
	public void delete(Usuario usuario) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(usuario);
		session.getTransaction().commit();
		session.close();
	}
	  
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Usuario> readAll() {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		List<Usuario> usuarios = session.createQuery("from Usuario").list();	
		session.getTransaction().commit();
		session.close();
		return usuarios;
	}
	  
	
}
