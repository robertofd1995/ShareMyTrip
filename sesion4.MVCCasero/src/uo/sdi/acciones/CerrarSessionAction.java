package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import alb.util.log.Log;
import uo.sdi.model.User;

public class CerrarSessionAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session=request.getSession();

		User usuario = ((User) session.getAttribute("user"));
		session.invalidate();
		Log.info("El usuario [%s] ha cerrado sesion",usuario.getLogin());

		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}


