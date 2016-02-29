package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.UserDao;
import alb.util.log.Log;

public class RegistrarUsuarioAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		String resultado="EXITO";
		String nombreUsuario=request.getParameter("nombreUsuario");
		String nombre=request.getParameter("nombre");
		String apellidos=request.getParameter("apellidos");
		String password=request.getParameter("pass1");
		String password2=request.getParameter("pass2");
		String correo=request.getParameter("correo");

		HttpSession session = request.getSession(); // se crea session

		if (nombreUsuario.isEmpty() || nombre.isEmpty()
				|| correo.isEmpty()
				|| password.isEmpty() || password2.isEmpty())
		{
			request.setAttribute("error", "Debe rellenar todos los campos obligatorios");
			resultado = "FRACASO";
			Log.info("Campos vacios al intentar registrar usuario ");
		} 
		else
		{
			if (session.getAttribute("user") == null)
			{

				UserDao dao = PersistenceFactory.newUserDao();
				User usuarioConMismoNombre = dao.findByLogin(nombreUsuario);

				// comprobar que el usuario no exista
				if (usuarioConMismoNombre == null)
				{
					//comprobacion de las contraseñas
					if (password.equals(password2))
					{
						User newUser = new User(nombreUsuario, password, nombre,
								apellidos, correo);
						dao.save(newUser);
						Log.info("Se ha registrado el usuario [%s]", nombreUsuario);
						// session.setAttribute("user", newUser); quitado
					} else
					{
						session.invalidate();
						Log.info(
								"Las contraseñas del registro del usuario [%s] no son iguales",
								nombreUsuario);
						request.setAttribute("error",
								"Error: Las contraseñas deben ser iguales");
						resultado = "FRACASO";
					}
				} else
				{
					session.invalidate();
					Log.info("Ya existe un usuario con login [%s]", nombreUsuario);
					request.setAttribute("error",
							"Error: Ya se existe un usuario con ese login");
					resultado = "FRACASO";
				}

			} else
			{
				Log.info(
						"Se ha intentado registrar un nuevo usuario teniendo sesion iniciada como [%s]",
						((User) session.getAttribute("user")).getLogin());
				resultado = "FRACASO";
			}
		}
		return resultado;
	}
	
	@Override
	public String toString() {
		return getClass().getName();
	}
}


