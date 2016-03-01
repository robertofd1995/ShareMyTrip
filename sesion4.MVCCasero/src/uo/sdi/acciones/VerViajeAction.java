package uo.sdi.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.acciones.Accion;
import uo.sdi.model.Rating;
import uo.sdi.model.Seat;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;

public class VerViajeAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Trip viaje;
		List<Rating> rating;
		List<Seat> seats;
		User promotor;
		try{
			viaje = PersistenceFactory.newTripDao().findById(Long.parseLong(request.getParameter("id")));
			request.setAttribute("viaje", viaje);
			promotor = PersistenceFactory.newUserDao().findById(viaje.getPromoterId());
			request.setAttribute("promotor", promotor);
			seats = PersistenceFactory.newSeatDao().findAll();
			if(seats!=null){
				for(Seat s:seats)
					if(s.getTripId()!=viaje.getId())
						seats.remove(s);
				request.setAttribute("seats", seats);
			}
			Log.debug("Obtenido viaje con id [%d]", viaje.getId());		
		}catch(Exception e){
			Log.error("No se ha podido obtener el viaje");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}
	
	

}
