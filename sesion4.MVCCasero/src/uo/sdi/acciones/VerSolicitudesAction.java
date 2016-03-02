package uo.sdi.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import uo.sdi.model.Application;
import uo.sdi.persistence.PersistenceFactory;

import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;

public class VerSolicitudesAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Long idViaje;
		List<Application> aps;
		try{
			idViaje = Long.parseLong(request.getParameter("id"));
			aps = PersistenceFactory.newApplicationDao().findByTripId(idViaje);
			request.setAttribute("solicitudes", aps);
		}catch(Exception e){
			request.setAttribute("error", "No se pueden obtener las solicitudes");
			Log.info("No se pueden obtener solicitudes para un viaje");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}
