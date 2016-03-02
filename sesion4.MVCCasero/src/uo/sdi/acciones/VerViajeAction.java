package uo.sdi.acciones;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.acciones.Accion;
import uo.sdi.model.Rating;
import uo.sdi.model.Seat;
import uo.sdi.model.SeatStatus;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;

public class VerViajeAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Trip viaje;
		List<Seat> seats;
		List<User> viajeros;
		User promotor;
		try{
			request.setAttribute("error", "Si desea acceder a mas informacion , debe registrarse");
			viaje = PersistenceFactory.newTripDao().findById(Long.parseLong(request.getParameter("id")));
			request.setAttribute("viaje", viaje);
			promotor = PersistenceFactory.newUserDao().findById(viaje.getPromoterId());
			request.setAttribute("promotor", promotor);
			seats = PersistenceFactory.newSeatDao().findAll();
			if(!seats.isEmpty()){
				viajeros = new ArrayList<User>();
				for(Seat s:seats)
					if(s.getTripId()==viaje.getId() && s.getStatus().equals(SeatStatus.ACCEPTED))
						viajeros.add(PersistenceFactory.newUserDao().findById(s.getUserId()));
				request.setAttribute("viajeros", viajeros);
			}
			Log.debug("Obtenido viaje con id [%d]", viaje.getId());		
		}catch(Exception e){
			Log.error("No se ha podido obtener el viaje");
			request.setAttribute("error", "No se puede obtener el viaje");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}
	
	

}
