package es.upm.dit.isst.electolab.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Simulacion implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Integer id;
	
	@Column
	private String circunscripcion;
	
	@Column
	private String partido;
	
	@Column
	private int numVotosPartido;

	
	public Simulacion () {
		
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getCircunscripcion() {
		return circunscripcion;
	}


	public void setCircunscripcion(String circunscripcion) {
		this.circunscripcion = circunscripcion;
	}


	

	public String getPartido() {
		return partido;
	}


	public void setPartido(String partido) {
		this.partido = partido;
	}


	public int getNumVotosPartido() {
		return numVotosPartido;
	}


	public void setNumVotosPartido(int numVotosPartido) {
		this.numVotosPartido = numVotosPartido;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
