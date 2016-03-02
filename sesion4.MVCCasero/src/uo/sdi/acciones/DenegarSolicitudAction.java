package uo.sdi.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.Application;
import uo.sdi.model.Seat;
import uo.sdi.model.SeatStatus;
import uo.sdi.model.Trip;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.SeatDao;
import uo.sdi.persistence.TripDao;
import alb.util.log.Log;

public class DenegarSolicitudAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		List<Application> aps;
		Trip viaje;
		Long usuario;
		try{
			usuario = Long.parseLong(request.getParameter("userId"));
			viaje = PersistenceFactory.newTripDao()
					.findById(Long.parseLong(request.getParameter("tripId")));
			aps = PersistenceFactory.newApplicationDao()
					.findByTripId(viaje.getId());
			if(!aps.isEmpty()){
				for(Application a:aps)
					if(a.getUserId().equals(usuario)){
						viaje.setAvailablePax(viaje.getAvailablePax()+1);
						TripDao tripDao = PersistenceFactory.newTripDao();
						tripDao.update(viaje);
						Seat seat = new Seat(usuario,viaje.getId(),"",SeatStatus.EXCLUDED);
						SeatDao seatDao = PersistenceFactory.newSeatDao();
						seatDao.update(seat);
					}
						
			}else{
				request.setAttribute("error", "No hay solicitudes para este viaje");
				Log.info("El usuario intenta cancelar una solicitud inexistente");
			}
		}catch(Exception e){
			request.setAttribute("error", "No se ha podido cancelar la solicitud");
			Log.info("Error al cancelar la solicitud de plaza en un viaje");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}
