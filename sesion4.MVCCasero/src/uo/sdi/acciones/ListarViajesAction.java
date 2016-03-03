package uo.sdi.acciones;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.Trip;
import uo.sdi.persistence.PersistenceFactory;
import alb.util.log.Log;

public class ListarViajesAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		List<Trip> viajes;
		List<Trip> viajesValidos=new ArrayList<Trip>();
		
		try {
			viajes=PersistenceFactory.newTripDao().findAll();
			
			for (Trip trip : viajes) {
				if (trip.getClosingDate().after(Calendar.getInstance().getTime())) {
					if (trip.getAvailablePax()>0) {
						viajesValidos.add(trip);
					}
				}
			}
			
			request.setAttribute("listaViajes", viajesValidos);
			Log.debug("Obtenida lista de viajes conteniendo [%d] viajes", viajes.size());
		}
		catch (Exception e) {
			Log.error("Algo ha ocurrido obteniendo lista de viajes");
		}
		return "EXITO";
	}
	
	@Override
	public String toString() {
		return getClass().getName();
	}
	
}
