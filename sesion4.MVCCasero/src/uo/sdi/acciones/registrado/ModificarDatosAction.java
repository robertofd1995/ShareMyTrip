package uo.sdi.acciones.registrado;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uo.sdi.acciones.Accion;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.UserDao;
import alb.util.log.Log;

public class ModificarDatosAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
	{

		String result = "FRACASO";

		String nuevoEmail = request.getParameter("email");
		String nuevoNombre = request.getParameter("nombre");
		String nuevoApellidos = request.getParameter("apellidos");

		HttpSession session = request.getSession();
		User usuario = ((User) session.getAttribute("user"));
		List<String> logMessages = new ArrayList<String>();


		//borra el mensaje si se ha lanzado antes
		session.removeAttribute("error");
		session.removeAttribute("errorModificarUser");
		session.removeAttribute("okModificarUser");
		
		if (nuevoEmail==null  
			||nuevoNombre==null 
			||nuevoApellidos==null )
		{
			session.setAttribute("errorModificarUser",
					"Debe rellenar los 3 campos");
			Log.debug(
					"El usuario [%s] no ha rellando los 3 campos al actualizar datos",
					usuario.getLogin());
		} else
		{
			if (!usuario.getEmail().equals(nuevoEmail))
			{
				usuario.setEmail(nuevoEmail);
				logMessages.add("Modificado email de" + usuario.getLogin()
						+ "con el valor" + nuevoEmail);
			}
			if (!usuario.getName().equals(nuevoNombre))
			{
				usuario.setName(nuevoNombre);
				logMessages.add("Modificado nombre de" + usuario.getLogin()
						+ "con el valor" + nuevoNombre);
			}
			if (!usuario.getSurname().equals(nuevoApellidos))
			{
				usuario.setSurname(nuevoApellidos);
				logMessages.add("Modificado apellidos de" + usuario.getLogin()
						+ "con el valor" + nuevoApellidos);
			}
			try
			{
				UserDao dao = PersistenceFactory.newUserDao();
				dao.update(usuario);
				for (String message : logMessages)
					Log.debug(message);
				session.setAttribute("okModificarUser",
						"Se ha realizado con exito");
				
				result = "EXITO";
			} catch (Exception e)
			{
				Log.error(
						"Algo ha ocurrido actualizando la información de [%s]",
						usuario.getLogin());
				session.setAttribute("errorModificarUser",
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
