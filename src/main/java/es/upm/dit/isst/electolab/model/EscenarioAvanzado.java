package es.upm.dit.isst.electolab.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.json.JSONArray;

@Entity
public class EscenarioAvanzado implements Serializable {

	public String getDocument() {
		return document;
	}

	public void setDocument(String json) {
		this.document = json;
	}

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Integer id;
	
	@Column
	private String fecha;
	
	@ManyToOne
	private Analista analista;
	@Lob
	private String document;

	@Column
	private String descripcion;

	@Column
	private Boolean Nacional;
	
	private String Autonomia;
	
	//private String grupoParlamentario;
	//private String parametrosEstadisticos;
	
	public EscenarioAvanzado () {
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	public String getGrupoParlamentario() {
//		return grupoParlamentario;
//	}

//	public void setGrupoParlamentario(String grupoParlamentario) {
//		this.grupoParlamentario = grupoParlamentario;
//	}

//	public String getParametrosEstadisticos() {
//		return parametrosEstadisticos;
//	}

//	public void setParametrosEstadisticos(String parametrosEstadisticos) {
//		this.parametrosEstadisticos = parametrosEstadisticos;
//	}
	public String getFecha() {
		return fecha;
	}

	
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Analista getAnalista() {
		return analista;
	}

	public void setAnalista(Analista analista) {
		this.analista = analista;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Boolean getNacional() {
		return Nacional;
	}

	public void setNacional(Boolean nacional) {
		Nacional = nacional;
	}

	public String getAutonomia() {
		return Autonomia;
	}

	public void setAutonomia(String autonomia) {
		Autonomia = autonomia;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((analista == null) ? 0 : analista.hashCode());
		result = prime * result + ((fecha == null) ? 0 : fecha.hashCode());
//		result = prime * result + ((grupoParlamentario == null) ? 0 : grupoParlamentario.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
//		result = prime * result + ((parametrosEstadisticos == null) ? 0 : parametrosEstadisticos.hashCode());
		return result;
	}





		
}
