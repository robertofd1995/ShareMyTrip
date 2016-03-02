package uo.sdi.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.acciones.Accion;
import uo.sdi.model.Application;
import uo.sdi.model.Seat;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.TripDao;

public class SolicitarPlazaAction implements Accion {

	private Application solicitud;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Trip viaje;
		String resultado = "EXITO";
		User usuario = (User) request.getSession().getAttribute("user");
		try {
			TripDao dao = PersistenceFactory.newTripDao();
			viaje = dao.findById(Long.parseLong(request.getParameter("id")));
			if (viaje.getAvailablePax() > 0) { 			
				Seat plaza = PersistenceFactory.newSeatDao().findByUserAndTrip(usuario.getId(), viaje.getId());
				if (plaza == null) {
					if (!usuario.getId().equals(viaje.getPromoterId())) {
						if (viaje.getClosingDate().after(new Date())) {
							viaje.setAvailablePax(viaje.getAvailablePax() - 1);
							solicitud = new Application(usuario.getId(),viaje.getId());
							PersistenceFactory.newApplicationDao().save(solicitud);
						} else {
							request.setAttribute("error","El plazo para la solicitud ha expirado");
							resultado = "FRACASO";
							Log.info("Usuario solicita plaza en un viaje fuera de plazo");
						}
					} else {
						request.setAttribute("error","El usuario es promotor de este viaje");
						resultado = "FRACASO";
						Log.info("Usuario solicita plaza en un viaje suyo");
					}
				} else { // el usuario ya había solicitado plaza en este viaje
					request.setAttribute("error","El usuario ya tiene plaza para este viaje");
					resultado = "FRACASO";
					Log.info("Usuario solicita una plaza que ya tiene");
				}
			} else {
				request.setAttribute("error", "El viaje está completo");
				resultado = "FRACASO";
				Log.info("Usuario solicita plaza en un viaje completo");
			}
		} catch (Exception e) {
			request.setAttribute("error", "No se ha podido solicitar plaza");
			Log.info("No se ha solicitado la plaza");
		}
		return resultado;
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}
