package uo.sdi.acciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.model.Seat;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;

public class VerMisViajesAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		User usuario;
		List<Trip> todos;
		Map<String,Trip> misViajes;
		List<Seat> todosPasajeros;
		try{
			usuario = (User) request.getSession().getAttribute("user");
			todos = PersistenceFactory.newTripDao().findAll();
			misViajes = new HashMap<String,Trip>();
			for(Trip t:todos)
				if(t.getPromoterId().equals(usuario.getId()))
					misViajes.put("PROMOTOR",t);

			todosPasajeros = PersistenceFactory.newSeatDao().findAll();
			for(Seat s:todosPasajeros)
				if(s.getUserId()==usuario.getId())
					for(Trip t:todos)
						if(s.getTripId()==t.getId())
							misViajes.put(s.getStatus().name(),t);
			request.setAttribute("misViajes", misViajes);	
		}catch(Exception e){
			request.setAttribute("error", "No hay viajes asociados al usuario");
			Log.info("El usuario no tiene viajes asociados");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}
