package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.UserDao;
import alb.util.log.Log;

public class ModificarPasswordAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
	{
		String result = "FRACASO";

		String passAntigua = request.getParameter("passAntigua");
		String nuevaPassword = request.getParameter("nuevaPassword");
		String nuevaPassword2 = request.getParameter("nuevaPassword2");

		HttpSession session = request.getSession();
		User usuario = ((User) session.getAttribute("user"));
		
		//borra el mensaje si se ha lanzado antes
		session.removeAttribute("errorModificarUser");
		session.removeAttribute("okModificarUser");

		if (passAntigua==null || nuevaPassword==null
				|| nuevaPassword2==null)
		{
			session.setAttribute("errorModificarUser",
					"Debe rellenar los 3 campos");
			Log.debug(
					"El usuario [%s] no ha rellando los 3 campos al actualizar contraseña",
					usuario.getLogin());
		} else
		{
			if (nuevaPassword.equals(nuevaPassword2))
			{
				if (usuario.getPassword().equals(passAntigua))
				{
					usuario.setPassword(nuevaPassword);
					try
					{
						UserDao dao = PersistenceFactory.newUserDao();
						dao.update(usuario);
						Log.debug("Modificada contraseña de [%s]",
								usuario.getLogin());
						Log.info("El usuario [%s] ha actualizado con exito su contraseña",usuario);
						
						session.setAttribute("okModificarUser",
								"Se ha realizado con exito");
						
						result = "EXITO";
					} catch (Exception e) 
					{
						Log.error(
								"Algo ha ocurrido actualizando la contraseña de [%s]",
								usuario.getLogin());
						session.setAttribute("errorModificarUser",
								"Error actualizando la contraseña");
					}
				} else
					session.setAttribute("errorModificarUser",
							"Contraseña antigua incorrecta");
				Log.debug(
						"El usuario [%s] ha insertado mal la contraseña al intentar actualizar",
						usuario.getLogin());
			} else
				session.setAttribute("errorModificarUser",
						"Las nuevas contraseñas deben ser iguales");
			Log.debug(
					"El usuario [%s] no ha escrito dos contraseñas iguales para actualizar contraseña",
					usuario.getLogin());
		}

		return result;
	}

	@Override
	public String toString()
	{
		return getClass().getName();
	}

}
