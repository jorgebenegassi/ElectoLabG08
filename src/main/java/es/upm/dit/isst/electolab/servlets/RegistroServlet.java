package es.upm.dit.isst.electolab.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.electolab.dao.AnalistaDAOImplementation;
import es.upm.dit.isst.electolab.dao.UsuarioDAOImplementation;
import es.upm.dit.isst.electolab.model.Analista;

/**
 * Servlet implementation class RegistroServlet
 */
@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String password1 = req.getParameter("password1");
		String password2 = req.getParameter("password2");
		String username = req.getParameter("username");
		boolean passwordsSame = (password1.compareTo(password2)==0);
		if (passwordsSame) {
			Analista analista = new Analista();
			analista.setEmail(email);
			analista.setPassword(password1);
			analista.setName(username);
			AnalistaDAOImplementation.getInstance().create(analista);
			req.getSession().setAttribute("analista", analista);
			req.getSession().removeAttribute("mensaje");
			getServletContext().getRequestDispatcher("/Admin.jsp").forward(req, res);
			
		} else {
			getServletContext().getRequestDispatcher("/Registro.jsp").forward(req, res);
					
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
