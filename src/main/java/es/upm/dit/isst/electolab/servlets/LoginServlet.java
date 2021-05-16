package es.upm.dit.isst.electolab.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import es.upm.dit.isst.electolab.dao.AnalistaDAOImplementation;
import es.upm.dit.isst.electolab.dao.UsuarioDAOImplementation;
import es.upm.dit.isst.electolab.model.Analista;
import es.upm.dit.isst.electolab.model.Usuario;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        private final String ADMIN_EMAIL = "root@root.com";
        private final String ADMIN_PASSWORD = "root";        
        
        public LoginServlet () {
        	super();
        }
        
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            List<Analista> analistas  = (List<Analista>) AnalistaDAOImplementation.getInstance().readAll();
            
            Analista analista = AnalistaDAOImplementation.getInstance().login(email, password);
    		req.getSession().setAttribute("analistas", analistas);
            // autenticacion1 - admin
            if( ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password) ) {       
            	req.getSession().setAttribute("admin", true);
    			req.getSession().setAttribute("analista", AnalistaDAOImplementation.getInstance().read(1));
    			getServletContext().getRequestDispatcher("/Admin.jsp").forward(req,resp);
            
    		return;
            }
            // autenticacion2 - existe el analista
            
            else if ( null != analista ) {
    			req.getSession().setAttribute("analista", AnalistaDAOImplementation.getInstance().read(analista.getId()));
    			getServletContext().getRequestDispatcher("/Admin.jsp").forward(req,resp);

    			try {
    			} catch(Exception e) {
    			getServletContext().getRequestDispatcher("/Login.jsp").forward(req,resp);
    			return;
    			}
    		}
            // autenticacion3 - credenciales incorrectas
    			
			else {
				req.getSession().setAttribute("mensaje", "El correo electrónico o la contraseña son incorrectas.");
				getServletContext().getRequestDispatcher("/Login.jsp").forward(req,resp);
			}
    			
         
         
}}
