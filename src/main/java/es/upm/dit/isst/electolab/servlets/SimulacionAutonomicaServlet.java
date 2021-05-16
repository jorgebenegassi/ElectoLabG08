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

import es.upm.dit.isst.electolab.model.Simulacion;

/**
 * Servlet implementation class SimulacionAutonomicaServlet
 */
@WebServlet("/SimulacionAutonomicaServlet")
public class SimulacionAutonomicaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimulacionAutonomicaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			getServletContext().getRequestDispatcher("/ResultadoSimulacionAutonomica.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		List<Simulacion> votos = new ArrayList<Simulacion>();
		
		String json = request.getParameter("json");
		JSONArray jsonArr = new JSONArray(json);

		for(int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonVoto = jsonArr.getJSONObject(i);
			Simulacion simulacion = new Simulacion();
			String circunscripcion = jsonVoto.getString("Circunscripción");
			String partido = jsonVoto.getString("Partido");
			int numVotos = jsonVoto.getInt("Votos");
			// falta el Id ??
			simulacion.setCircunscripcion(circunscripcion);
			simulacion.setPartido(partido);
			simulacion.setNumVotosPartido(numVotos);

			votos.add(simulacion);
			//SimulacionDAOImplementation.getInstance().create(simulacion);

		}
				
		request.getSession().setAttribute("votos", votos);
		doGet(request, response);
		
		}catch(Exception e) {
			
		}
	}

}
