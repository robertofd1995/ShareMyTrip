package uo.sdi.acciones;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import alb.util.log.Log;
import uo.sdi.acciones.Accion;
import uo.sdi.model.AddressPoint;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.TripDao;

public class RegistrarViajeAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String resultado = "EXITO";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		AddressPoint salida = new AddressPoint(request.getParameter("calle_salida"), 
				request.getParameter("ciudad_salida"), 
				request.getParameter("provincia_salida"), 
				request.getParameter("pais_salida"),
				request.getParameter("codigo_postal_salida"),
				null);
		AddressPoint llegada = new AddressPoint(request.getParameter("calle_llegada"), 
				request.getParameter("ciudad_llegada"), 
				request.getParameter("provincia_llegada"), 
				request.getParameter("pais_llegada"),
				request.getParameter("codigo_postal_llegada"),
				null);
		Date fechaSalida = null,fechaLlegada= null,fechaLimite = null;
		try{
		
			fechaSalida = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("fecha_salida"));
			fechaLlegada = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("fecha_llegada"));
			fechaLimite = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("fecha_limite"));
		} catch (ParseException e) {
			request.setAttribute("error", "Debe rellenar todos los campos obligatorios");
			Log.info("Fechas introducidas incorrectas al registrar un viaje");
			resultado = "FRACASO";
		}
		Double coste = Double.parseDouble(request.getParameter("coste"));
		String comentarios = request.getParameter("comentarios");
		Integer plazasMaximas = Integer.parseInt(request.getParameter("plazas_maximas"));
		Integer plazasDisponibles = Integer.parseInt(request.getParameter("plazas_disponibles"));
		
		if(request.getParameterMap().containsValue(""))
		{
			request.setAttribute("error", "Debe rellenar todos los campos obligatorios");
			resultado = "FRACASO";
			Log.info("Campos vacios al intentar registrar un viaje");
		}
		else{
			Trip newTrip = new Trip(salida,llegada,fechaSalida,fechaLlegada,
					fechaLimite,coste,comentarios,plazasMaximas,plazasDisponibles,user.getId());
			TripDao dao = PersistenceFactory.newTripDao();
			dao.save(newTrip);
			Log.info("Se ha registrado el viaje [%s], [%s]", salida.getCity(),llegada.getCity());
		}
		return resultado;
	}

}
