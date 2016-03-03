package uo.sdi.acciones;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import alb.util.log.Log;
import uo.sdi.model.AddressPoint;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.model.Waypoint;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.TripDao;

public class ModificarViajeAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		String result="FRACASO";

		//Obtencion de datos necesarios a mostrar
		Long idViaje = Long.parseLong(request.getParameter("id"));
		Trip viaje = ((Trip) PersistenceFactory.newTripDao().findById(idViaje));
		User usuario = ((User) request.getSession().getAttribute("user"));
		AddressPoint salida=viaje.getDeparture();
		AddressPoint destino=viaje.getDestination();
		HttpSession session = request.getSession();
		request.setAttribute("viaje", viaje);
		request.setAttribute("salida", salida);
		request.setAttribute("destino", destino);

		String nuevaCalleSalida = request.getParameter("calle_salida");
		String nuevaCiudadSalida = request.getParameter("ciudad_salida");
		String nuevoEstadoSalida = request.getParameter("provincia_salida");
		String nuevoPaisSalida = request.getParameter("pais_salida");
		String nuevaPostalOrigen = request.getParameter("codigo_postal_salida");
		String nuevaLatSalida = request.getParameter("latitud_salida");
		String nuevaLongSalida = request.getParameter("longitud_salida");
		//String nuevaFechaSalida = request.getParameter("fecha_salida");
		//String nuevaHoraOrigen = request.getParameter("horaOrigen");

		String nuevaCalleDestino = request.getParameter("calle_llegada");
		String nuevaCiudadDestino = request.getParameter("ciudad_llegada");
		String nuevoEstadoDestino = request.getParameter("provincia_llegada");
		String nuevoPaisDestino = request.getParameter("pais_llegada");
		String nuevaPostalDestino = request.getParameter("codigo_postal_llegada");
		String nuevaLatDestino = request.getParameter("latitud_llegada");
		String nuevaLongDestino = request.getParameter("longitud_llegada");
		//String nuevaFechaDestino = request.getParameter("fecha_llegada");
		//String nuevaHoraDestino = request.getParameter("horaDestino");

		//String nuevaFechaLimite = request.getParameter("fechaLimite");
		String nuevoPlazasMaximo = request.getParameter("plazas_maximas");
		String nuevoPlazasLibres = request.getParameter("plazas_disponibles");
		String nuevoCoste = request.getParameter("coste");
		String nuevaDescripcion = request.getParameter("comentarios");
		
		Date fechaSalida=null,fechaLlegada=null,fechaLimite=null;
		
		if (request.getParameter("fecha_salida")!=null && request.getParameter("fecha_llegada")!=null && request.getParameter("fecha_limite")!=null) {
			
			try {
				fechaSalida = new SimpleDateFormat("dd-MM-yyyy hh:mm").parse(request.getParameter("fecha_salida"));
				fechaLlegada = new SimpleDateFormat("dd-MM-yyyy hh:mm").parse(request.getParameter("fecha_llegada"));
				fechaLimite = new SimpleDateFormat("dd-MM-yyyy hh:mm").parse(request.getParameter("fecha_limite"));
				
				if (fechaLlegada.before(fechaSalida) || fechaSalida.equals(fechaLlegada)) {
					
					Log.info("Intento de modificar: Fechas no validas en el viaje[%s] por el"
							+ " usuario [%s]",viaje.getId(), usuario.getLogin());
					request.setAttribute("errorModificarViaje", "Las fechas no son validas"
							+ " , ha de haber un dia al menos de diferencia");
					result = "FRACASO";
				}
			} catch (ParseException e1) {
				request.setAttribute("error", "Las fechas introducidas no cumplen el formato");
				Log.info("Fechas introducidas incorrectas al registrar un viaje");
				return  "FRACASO";
			}
			
		}
		
		

		//borra el mensaje si se ha lanzado antes
		session.removeAttribute("errorViaje");
		
		
		
		if (nuevaCalleSalida==null || nuevaCiudadSalida==null
				|| nuevoEstadoSalida==null || nuevoPaisSalida==null
				|| nuevaPostalOrigen==null 
				|| nuevaCalleDestino==null
				|| nuevaCiudadDestino==null || nuevoEstadoDestino==null
				|| nuevoPaisDestino==null || nuevaPostalDestino==null
				|| nuevoPlazasMaximo==null || nuevoPlazasLibres==null 
				|| nuevoCoste==null || nuevaDescripcion==null)
		{
			Log.info("Campo/s vacio/s al intentar modificar el viaje[%s] por el"
					+ " usuario [%s]",viaje.getId(), usuario.getLogin());
			request.setAttribute("errorModificarViaje", "Debe rellenar todos "
					+ "los campos (excepto latitud y longitud");
			result = "FRACASO";
		} else
		{
			try
			{
				AddressPoint nuevaSalida=new AddressPoint(nuevaCalleSalida, nuevaCiudadSalida,
				nuevoEstadoSalida, nuevoPaisSalida, nuevaPostalOrigen, 
				new Waypoint(Double.valueOf(nuevaLatSalida), Double.valueOf(nuevaLongSalida)));
				
				AddressPoint nuevaLlegada=new AddressPoint(nuevaCalleDestino, nuevaCiudadDestino,
						nuevoEstadoDestino, nuevoPaisDestino, nuevaPostalDestino, 
						new Waypoint(Double.valueOf(nuevaLatDestino), Double.valueOf(nuevaLongDestino)));
				
				/*Trip viajeNuevo=new Trip(nuevaSalida, nuevaLlegada, fechaSalida,
						fechaLlegada, fechaLimite, Double.valueOf(nuevoCoste),
						nuevaDescripcion, Integer.valueOf(nuevoPlazasMaximo),
						Integer.valueOf(nuevoPlazasLibres), usuario.getId());*/
				
				viaje.setDeparture(nuevaSalida);
				viaje.setDestination(nuevaLlegada);
				viaje.setDepartureDate(fechaSalida);
				viaje.setArrivalDate(fechaLlegada);
				viaje.setClosingDate(fechaLimite);
				viaje.setEstimatedCost(Double.valueOf(nuevoCoste));
				viaje.setComments(nuevaDescripcion);
				viaje.setMaxPax(Integer.valueOf(nuevoPlazasMaximo));
				viaje.setAvailablePax(Integer.valueOf(nuevoPlazasLibres));
				
				
				TripDao dao = PersistenceFactory.newTripDao();
				dao.update(viaje);				
				result = "EXITO";
				
			} catch (Exception e)
			{
				Log.error(
						"Algo ha ocurrido actualizando la información de [%s]",
						usuario.getLogin());
				session.setAttribute("errorModificarViaje",
						"Error actualizando los datos");
			}
		}
		return result;
	}

	@Override
	public String toString()
	{
		return getClass().getName();
	}

}
