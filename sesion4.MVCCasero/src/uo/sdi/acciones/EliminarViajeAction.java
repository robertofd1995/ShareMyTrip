package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alb.util.log.Log;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.TripDao;

public class EliminarViajeAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		String result="FRACASO";
		
		Long idViaje = Long.parseLong(request.getParameter("id"));
		
		try
		{
			TripDao dao = PersistenceFactory.newTripDao();
			dao.delete(idViaje);				
			result = "EXITO";
			
		} catch (Exception e)
		{
			Log.error(
					"Algo ha ocurrido eliminando el viaje [%s]",
					idViaje);
			request.getSession().setAttribute("errorViaje",
					"Error eliminando el viaje");
		}
		
		return result;
	}

}
