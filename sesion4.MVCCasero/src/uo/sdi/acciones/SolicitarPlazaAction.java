package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.acciones.Accion;

public class SolicitarPlazaAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		return null;
	}

	@Override
	public String toString() {
		return getClass().getName();
	}
	
	

}
