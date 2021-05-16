package es.upm.dit.isst.electolab.model;

import java.io.ByteArrayOutputStream;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.json.JSONObject;

@Entity
public class EscenarioBasico implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Integer id;
		
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * NO TIENE MÁS PARÁMETROS PORQUE LAS SIMULACIONES DE LOS 
	 * USUARIOS BÁSICOS NO SE VAN A GUARDAR !!
	 */
	
	public EscenarioBasico () {
		
	}
	
}
