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

import es.upm.dit.isst.electolab.dao.EscenarioAvanzadoDAOImplementation;
import es.upm.dit.isst.electolab.model.EscenarioAvanzado;
import es.upm.dit.isst.electolab.model.Simulacion;

/**
 * Servlet implementation class VisualizarSimulacionAnalistaServlet
 */
@WebServlet("/VisualizarSimulacionAnalistaServlet")
public class VisualizarSimulacionAnalistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizarSimulacionAnalistaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
        int id = Integer.parseInt(request.getParameter("idSimulacion"));

        EscenarioAvanzado resultado  =  EscenarioAvanzadoDAOImplementation.getInstance().read(id) ;
        
        
		List<Simulacion> votos = new ArrayList<Simulacion>();
		
		String json =  resultado.getDocument();
		JSONArray jsonArr = new JSONArray(json);

		for(int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonVoto = jsonArr.getJSONObject(i);
			Simulacion simulacion = new Simulacion();
			
			String circunscripcion = jsonVoto.getString("Circunscripción");
			String partido = jsonVoto.getString("Partido");
			int numVotos = jsonVoto.getInt("Votos");

			simulacion.setCircunscripcion(circunscripcion);
			simulacion.setPartido(partido);
			simulacion.setNumVotosPartido(numVotos);

			votos.add(simulacion);
			//SimulacionDAOImplementation.getInstance().create(simulacion);
		}

		request.getSession().setAttribute("votos", votos);
		
		if(resultado.getNacional() == true) {
			getServletContext().getRequestDispatcher("/ResultadoSimulacionNacionalAnalista.jsp").forward(request,response);
		}else {
			getServletContext().getRequestDispatcher("/ResultadoSimulacionAutonomicaAnalista.jsp").forward(request,response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
