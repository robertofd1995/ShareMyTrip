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

public class ConfirmarSolicitudAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		List<Application> aps;
		Application application = null;
		Trip viaje;
		Long usuario;
		String resultado = "EXITO";
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
				if (viaje.getAvailablePax() > 0) {
					if (viaje.getClosingDate().after(new Date())) {
						if (PersistenceFactory.newSeatDao().findByUserAndTrip(
								usuario, viaje.getId()) == null) {
							viaje.setAvailablePax(viaje.getAvailablePax() - 1);
							TripDao tripDao = PersistenceFactory.newTripDao();
							tripDao.update(viaje);
							Seat seat = new Seat(usuario, viaje.getId(), "",
									SeatStatus.ACCEPTED);
							SeatDao seatDao = PersistenceFactory.newSeatDao();
							seatDao.save(seat);
							ApplicationDao appDao = PersistenceFactory
									.newApplicationDao();
							appDao.delete(new Long[] { application.getUserId(),
									application.getTripId() });
						} else {
							resultado = "FRACASO";
							request.setAttribute("error",
									"El usuario ya tiene plaza en éste viaje");
							Log.info("El usuario intenta confirmar una solicitud ya confirmada");
						}
					} else { // fuera de plazo
						resultado = "FRACASO";
						request.setAttribute("error",
								"El plazo para este viaje se ha cerrado");
						Log.info("El usuario intenta confirmar solicitudes fuera de plazo");
					}
				} else { // no hay plazas
					resultado = "FRACASO";
					request.setAttribute("error",
							"No quedan plazas disponibles");
					Log.info("El usuario intenta confirmar solicitudes fuera de plazo");
				}
			} else {
				resultado = "FRACASO";
				request.setAttribute("error", "La solicitud ya ha sido tratada");
				Log.info("El usuario intenta confirmar una solicitud tratada anteriormente");
			}
		} catch (Exception e) {
			request.setAttribute("error", "No se ha podido confirmar la plaza");
			resultado = "FRACASO";
			Log.info("No se ha podido confirmar la solicitud");
		}
		return resultado;
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}
