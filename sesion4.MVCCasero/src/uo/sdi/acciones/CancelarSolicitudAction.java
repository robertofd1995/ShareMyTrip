package uo.sdi.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.model.Application;
import uo.sdi.model.Seat;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.ApplicationDao;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.SeatDao;
import uo.sdi.persistence.TripDao;

public class CancelarSolicitudAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Trip viaje;
		User usuario;
		Application application = null;
		Seat seat = null;
		String resultado = "EXITO";
		try{
			usuario = (User) request.getSession().getAttribute("user");
			viaje = PersistenceFactory.newTripDao().findById(Long.parseLong(request.getParameter("id")));
			seat = PersistenceFactory.newSeatDao().findByUserAndTrip(usuario.getId(),viaje.getId());
			if(viaje.getClosingDate().after(new Date())){
				application = PersistenceFactory.newApplicationDao()
						.findById(new Long[]{usuario.getId(),viaje.getId()});
				if(application!=null){
					ApplicationDao dao = PersistenceFactory.newApplicationDao();
					dao.delete(new Long[]{usuario.getId(),viaje.getId()});
				}else if(seat!=null){
						SeatDao seatDao = PersistenceFactory.newSeatDao();
						seatDao.delete(new Long[]{usuario.getId(),viaje.getId()});
						TripDao tripDao = PersistenceFactory.newTripDao();
						viaje.setAvailablePax(viaje.getAvailablePax()+1);
						tripDao.update(viaje);
					}
					else{
						resultado = "FRACASO";
						request.setAttribute("error",
							"El usuario no tenía plaza en este viaje");
						Log.info("El usuario intenta cancelar una solicitud para la que no tiene plaza");
					}
				
			}else{
				resultado = "FRACASO";
				request.setAttribute("error",
						"El plazo para cancelar solicitudes del viaje esta cerrado");
				Log.info("El usuario intenta cancelar una solicitud fuera de plazo");
			}
		}catch(Exception e){
			request.setAttribute("error",
					"No se ha podido cancelar la solicitud");
			Log.info("Error al cancelar la solicitud de plaza en un viaje");
		}
		return resultado;
	}

}
