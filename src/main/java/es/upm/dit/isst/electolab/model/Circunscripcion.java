package es.upm.dit.isst.electolab.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;

public class Circunscripcion implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column
	private String nombre;
	@Column
	private Integer numEscaños;
	
	public Circunscripcion () {
		
	}
}
