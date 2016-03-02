package uo.sdi.acciones;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.Application;
import uo.sdi.model.Seat;
import uo.sdi.model.SeatStatus;
import uo.sdi.model.Trip;
import uo.sdi.persistence.ApplicationDao;
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
		Application application = null;
		try {
			usuario = Long.parseLong(request.getParameter("userId"));
			viaje = PersistenceFactory.newTripDao().findById(
					Long.parseLong(request.getParameter("tripId")));
			aps = PersistenceFactory.newApplicationDao().findByTripId(
					viaje.getId());
			for (Application a : aps)
				if (a.getUserId().equals(usuario))
					application = a;
			if (application != null) {
				if (viaje.getClosingDate().after(new Date())) {
					viaje.setAvailablePax(viaje.getAvailablePax() + 1);
					TripDao tripDao = PersistenceFactory.newTripDao();
					tripDao.update(viaje);
					Seat seat = new Seat(usuario, viaje.getId(), "",
							SeatStatus.EXCLUDED);
					SeatDao seatDao = PersistenceFactory.newSeatDao();
					seatDao.update(seat);
					ApplicationDao appDao = PersistenceFactory
							.newApplicationDao();
					appDao.delete(new Long[] { application.getUserId(),
							application.getTripId() });
				} else {
					request.setAttribute("error",
							"El plazo para las solicitudes del viaje esta cerrado");
					Log.info("El usuario intenta cancelar una solicitud fuera de plazo");
				}
			} else {
				request.setAttribute("error", "La solicitud ya ha sido tratada");
				Log.info("El usuario intenta cancelar una solicitud tratada anteriormente");
			}
		} catch (Exception e) {
			request.setAttribute("error",
					"No se ha podido denegar la solicitud");
			Log.info("Error al denegar la solicitud de plaza en un viaje");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}
