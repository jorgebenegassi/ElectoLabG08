package es.upm.dit.isst.electolab.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Partido implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column
	private String nombre;
	@Column
	private String acronimo;
	@Column
	private String color;
	@Column
	private Integer numVotosPartido;
	@Column
	private Integer numEscañosPartido;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAcronimo() {
		return acronimo;
	}

	public void setAcronimo(String acronimo) {
		this.acronimo = acronimo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getNumVotosPartido() {
		return numVotosPartido;
	}

	public void setNumVotosPartido(Integer numVotosPartido) {
		this.numVotosPartido = numVotosPartido;
	}

	public Integer getNumEscañosPartido() {
		return numEscañosPartido;
	}

	public void setNumEscañosPartido(Integer numEscañosPartido) {
		this.numEscañosPartido = numEscañosPartido;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Partido () {
		
	}
	
}
