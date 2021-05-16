package es.upm.dit.isst.electolab.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.electolab.dao.EscenarioAvanzadoDAOImplementation;
import es.upm.dit.isst.electolab.model.EscenarioAvanzado;

/**
 * Servlet implementation class AnalisisRealizadosServlet
 */
@WebServlet("/AnalisisRealizadosServlet")
public class AnalisisRealizadosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnalisisRealizadosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<EscenarioAvanzado> listaFinal = new ArrayList<EscenarioAvanzado>();

        List<EscenarioAvanzado> listadeDisponibles  = (List<EscenarioAvanzado>) EscenarioAvanzadoDAOImplementation.getInstance().readAll();
        
		for(int i = 0; i < listadeDisponibles.size(); i++) {
			EscenarioAvanzado escenario = new EscenarioAvanzado();
			
			escenario.setDescripcion(listadeDisponibles.get(i).getDescripcion());

			escenario.setId(listadeDisponibles.get(i).getId());
			
			escenario.setAnalista(listadeDisponibles.get(i).getAnalista());
			
			escenario.setFecha(listadeDisponibles.get(i).getFecha());
			
			listaFinal.add(escenario);
             
			}
		request.getSession().setAttribute("simulaciones", listaFinal);
		getServletContext().getRequestDispatcher("/AnalisisRealizados.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
