package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.acciones.Accion;
import uo.sdi.model.Application;
import uo.sdi.model.Seat;
import uo.sdi.model.SeatStatus;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.ApplicationDao;
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
		try{
			TripDao dao = PersistenceFactory.newTripDao();
			viaje = dao.findById(Long.parseLong(request.getParameter("id")));
			if(viaje.getAvailablePax()>0){
				viaje.setAvailablePax(viaje.getAvailablePax()-1);
				Seat plaza = PersistenceFactory.newSeatDao().findByUserAndTrip(usuario.getId(), viaje.getId());
				if(plaza==null){
					solicitud = new Application(usuario.getId(),viaje.getId());
					PersistenceFactory.newApplicationDao().save(solicitud);
				}
				else{
					request.setAttribute("error", "El usuario ya tiene plaza para este viaje");
					resultado = "FRACASO";
					Log.info("Usuario solicita una plaza que ya tiene");
				}
			}
			else{
				request.setAttribute("error", "El viaje está completo");
				resultado = "FRACASO";
				Log.info("Usuario solicita plaza en un viaje completo");
			}
		}catch(Exception e){
			
		}
		return resultado;
	}

	@Override
	public String toString() {
		return getClass().getName();
	}
	
	

}
