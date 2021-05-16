package es.upm.dit.isst.electolab.servlets;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
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
import es.upm.dit.isst.electolab.model.Simulacion;

/**
 * Servlet implementation class SimulacionNacionalAnalistaServlet
 */
@WebServlet("/SimulacionNacionalAnalistaServlet")
public class SimulacionNacionalAnalistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EscenarioAvanzado escAv = new EscenarioAvanzado();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimulacionNacionalAnalistaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		getServletContext().getRequestDispatcher("/ResultadoSimulacionNacionalAnalista.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Lista con todos los votos de una simulacion
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
				

				int id = Integer.parseInt(request.getParameter("idAnalista"));
				String descripcion = request.getParameter("descripcion");
				System.out.println(request.getParameter("nacional"));
				Boolean nacional = Boolean.parseBoolean(request.getParameter("nacional"));
				Analista analista  = AnalistaDAOImplementation.getInstance().read(id);
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String date = java.time.LocalDateTime.now().format(formatter).toString();

				escAv.setDocument(json);
				escAv.setAnalista(analista);
				escAv.setDescripcion(descripcion);
				escAv.setNacional(nacional);
				escAv.setFecha(date);
				EscenarioAvanzadoDAOImplementation.getInstance().create(escAv);

				request.getSession().setAttribute("votos", votos);
				//doGet(request, response);			
				}catch(Exception e) {
					
				}
	}

}
