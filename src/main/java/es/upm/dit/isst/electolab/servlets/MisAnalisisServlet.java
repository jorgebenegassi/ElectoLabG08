package es.upm.dit.isst.electolab.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import es.upm.dit.isst.electolab.dao.AnalistaDAOImplementation;
import es.upm.dit.isst.electolab.dao.EscenarioAvanzadoDAOImplementation;
import es.upm.dit.isst.electolab.model.Analista;
import es.upm.dit.isst.electolab.model.EscenarioAvanzado;

/**
 * Servlet implementation class MisAnalisisServlet
 */
@WebServlet("/MisAnalisisServlet")
public class MisAnalisisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MisAnalisisServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EscenarioAvanzado> listaFinal = new ArrayList<EscenarioAvanzado>();

        int id = Integer.parseInt(request.getParameter("idAnalista"));
        
        List<EscenarioAvanzado> listadeDisponibles  = (List<EscenarioAvanzado>) EscenarioAvanzadoDAOImplementation.getInstance().getSimulaciones(id) ;
        
		for(int i = 0; i < listadeDisponibles.size(); i++) {
			EscenarioAvanzado escenario = new EscenarioAvanzado();
			
			escenario.setDescripcion(listadeDisponibles.get(i).getDescripcion());

			escenario.setId(listadeDisponibles.get(i).getId());
			
			escenario.setAnalista(listadeDisponibles.get(i).getAnalista());
			
			escenario.setFecha(listadeDisponibles.get(i).getFecha());
			
			listaFinal.add(escenario);
             
			}
		request.getSession().setAttribute("simulacionesAnalista", listaFinal);
		
		//getServletContext().getRequestDispatcher("/MisAnalisis.jsp").forward(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
