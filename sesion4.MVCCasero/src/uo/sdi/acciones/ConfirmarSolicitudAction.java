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

public class ConfirmarSolicitudAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		List<Application> aps;
		Trip viaje;
		Long usuario;
		String resultado = "EXITO";
		try{
			usuario = Long.parseLong(request.getParameter("userId"));
			viaje = PersistenceFactory.newTripDao()
					.findById(Long.parseLong(request.getParameter("tripId")));
			aps = PersistenceFactory.newApplicationDao()
					.findByTripId(viaje.getId());
			if(!aps.isEmpty()){
				for(Application a:aps)
					if(a.getUserId().equals(usuario) && viaje.getAvailablePax()>0){
						viaje.setAvailablePax(viaje.getAvailablePax()-1);
						TripDao tripDao = PersistenceFactory.newTripDao();
						tripDao.update(viaje);
						Seat seat = new Seat(usuario,viaje.getId(),"",SeatStatus.ACCEPTED);
						SeatDao seatDao = PersistenceFactory.newSeatDao();
						seatDao.save(seat);
					}
						
			}else{
				resultado = "FRACASO";
				request.setAttribute("error", "El viaje está completo");
				Log.info("El usuario intenta confirmar una solicitud en un viaje completo");
			}
		}catch(Exception e){
			request.setAttribute("error", "No se ha podido confirmar la plaza");
			resultado = "FRACASO";
			Log.info("Usuario quiere validar plaza con ocupación completa");
		}
		return resultado;
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}