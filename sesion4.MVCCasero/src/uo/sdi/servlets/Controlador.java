package uo.sdi.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import alb.util.log.Log;
import uo.sdi.acciones.*;
import uo.sdi.acciones.RegistrarViajeAction;
import uo.sdi.model.User;

public class Controlador extends javax.servlet.http.HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Map<String, Accion>> mapaDeAcciones; // <rol, <opcion,
																// objeto
																// Accion>>
	private Map<String, Map<String, Map<String, String>>> mapaDeNavegacion; // <rol,
																			// <opcion,
																			// <resultado,
																			// JSP>>>

	public void init() throws ServletException {
		crearMapaAcciones();
		crearMapaDeJSP();
	}

	// prueba commit
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		String opcion, resultado, jspSiguiente;
		Accion accion;
		String rolAntes, rolDespues;

		try {
			opcion = req.getServletPath().replace("/", "");

			rolAntes = obtenerRolDeSesion(req);

			accion = buscarAccionParaOpcion(rolAntes, opcion);

			resultado = accion.execute(req, res);

			rolDespues = obtenerRolDeSesion(req);

			jspSiguiente = buscarJSPSegun(rolDespues, opcion, resultado);

			req.setAttribute("jspSiguiente", jspSiguiente);

		} catch (Exception e) {

			if (req.getSession() != null
					&& ((User) req.getSession().getAttribute("user")) != null) {
				jspSiguiente = "/perfil.jsp";
				req.getSession().setAttribute("errorPerfil",
						"Ha ocurrido un error");
			} else {
				req.getSession().invalidate();
				jspSiguiente = "/error.jsp";
			}
			Log.error("Se ha producido alguna excepción no manejada [%s]", e);

			// throw e;
		}

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher(jspSiguiente);

		dispatcher.forward(req, res);
	}

	private String obtenerRolDeSesion(HttpServletRequest req) {
		HttpSession sesion = req.getSession();
		if (sesion.getAttribute("user") == null)
			return "PUBLICO";
		else
			return "REGISTRADO";
	}

	// Obtiene un objeto accion en funci�n de la opci�n
	// enviada desde el navegador
	private Accion buscarAccionParaOpcion(String rol, String opcion) {

		Accion accion = mapaDeAcciones.get(rol).get(opcion);
		Log.debug("Elegida acción [%s] para opción [%s] y rol [%s]", accion,
				opcion, rol);
		return accion;
	}

	// Obtiene la p�gina JSP a la que habr� que entregar el
	// control el funci�n de la opci�n enviada desde el navegador
	// y el resultado de la ejecuci�n de la acci�n asociada
	private String buscarJSPSegun(String rol, String opcion, String resultado) {

		String jspSiguiente = mapaDeNavegacion.get(rol).get(opcion)
				.get(resultado);
		Log.debug(
				"Elegida página siguiente [%s] para el resultado [%s] tras realizar [%s] con rol [%s]",
				jspSiguiente, resultado, opcion, rol);
		return jspSiguiente;
	}

	private void crearMapaAcciones() {

		mapaDeAcciones = new HashMap<String, Map<String, Accion>>();

		Map<String, Accion> mapaPublico = new HashMap<String, Accion>();
		mapaPublico.put("validarse", new ValidarseAction());
		mapaPublico.put("listarViajes", new ListarViajesAction());
		mapaPublico.put("mostrarViaje", new VerViajeAction());
		mapaPublico.put("registrarUsuario", new RegistrarUsuarioAction());

		mapaDeAcciones.put("PUBLICO", mapaPublico);

		Map<String, Accion> mapaRegistrado = new HashMap<String, Accion>();
		mapaRegistrado.put("modificarDatos", new ModificarDatosAction());
		mapaRegistrado.put("modificarPassword", new ModificarPasswordAction());
		mapaRegistrado.put("listarViajes", new ListarViajesAction());
		mapaRegistrado.put("mostrarViaje", new VerViajeAction());
		mapaRegistrado.put("solicitarPlaza", new SolicitarPlazaAction());
<<<<<<< HEAD
		mapaRegistrado.put("confirmarPasajeros", new ConfirmarPasajerosAction());
=======
>>>>>>> featureTest
		mapaRegistrado.put("registrarViaje", new RegistrarViajeAction());
		mapaRegistrado.put("cerrarSession", new CerrarSessionAction());
		mapaRegistrado.put("verMisViajes", new VerMisViajesAction());
		mapaRegistrado.put("modificarViaje", new ModificarViajeAction());
		mapaRegistrado.put("eliminarViaje", new EliminarViajeAction());
		mapaRegistrado.put("confirmarSolicitud", new ConfirmarSolicitudAction());
		mapaRegistrado.put("denegarSolicitud", new DenegarSolicitudAction());
		mapaRegistrado.put("verSolicitudes", new VerSolicitudesAction());
		mapaRegistrado.put("cancelarSolicitud", new CancelarSolicitudAction());

		mapaDeAcciones.put("REGISTRADO", mapaRegistrado);
	}

	private void crearMapaDeJSP() {

		mapaDeNavegacion = new HashMap<String, Map<String, Map<String, String>>>();

		// Crear mapas auxiliares vacíos
		Map<String, Map<String, String>> opcionResJSP = new HashMap<String, Map<String, String>>();
		Map<String, String> resJSP = new HashMap<String, String>();

		// Mapa de navegación del público
		resJSP.put("FRACASO", "/menu.jsp");
		opcionResJSP.put("validarse", resJSP);
		// ListarViajes
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/listaViajes.jsp");
		opcionResJSP.put("listarViajes", resJSP);
		// Mostrar viaje publico
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/menu.jsp");
		opcionResJSP.put("mostrarViaje", resJSP);
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/perfil.jsp"); 
		resJSP.put("FRACASO", "/menu.jsp");
		opcionResJSP.put("registrarUsuario", resJSP);

		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/menu.jsp");
		opcionResJSP.put("cerrarSession", resJSP);

		mapaDeNavegacion.put("PUBLICO", opcionResJSP);

		// Crear mapas auxiliares vacíos
		opcionResJSP = new HashMap<String, Map<String, String>>();
		resJSP = new HashMap<String, String>();

		// Mapa de navegación de usuarios registrados

		resJSP.put("EXITO", "/perfil.jsp");
		opcionResJSP.put("validarse", resJSP);
		// Ver viaje registrado
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/mostrarViaje.jsp");
		opcionResJSP.put("mostrarViaje", resJSP);
		// ListarViajes
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/listaViajes.jsp");
		opcionResJSP.put("listarViajes", resJSP);
		// Modificar datos user
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/modificarDatos.jsp");
		resJSP.put("FRACASO", "/modificarDatos.jsp");
		opcionResJSP.put("modificarDatos", resJSP);
		// Modificar password user
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/modificarDatos.jsp");
		resJSP.put("FRACASO", "/modificarDatos.jsp");
		opcionResJSP.put("modificarPassword", resJSP);
		// Solicitar plaza
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/perfil.jsp");
		resJSP.put("FRACASO", "/perfil.jsp");
		opcionResJSP.put("solicitarPlaza", resJSP);

		// Ver mis viajes
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/misViajes.jsp");
		opcionResJSP.put("verMisViajes", resJSP);
		// Registrar viaje
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/perfil.jsp");
		opcionResJSP.put("registrarViaje", resJSP);
		// ModificarViaje
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/verMisViajes");
		resJSP.put("FRACASO", "/modificarViaje.jsp");
		opcionResJSP.put("modificarViaje", resJSP);
		// EliminarViaje
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/verMisViajes");
		resJSP.put("FRACASO", "/modificarViaje.jsp");
		opcionResJSP.put("eliminarViaje", resJSP);
		// Cerrar sesion
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/cerrarSesion.jsp");
		opcionResJSP.put("cerrarSesion", resJSP);
		// Confirmar solicitud
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/perfil.jsp");
		resJSP.put("FRACASO", "/perfil.jsp");
		opcionResJSP.put("confirmarSolicitud", resJSP);
		// Denegar solicitud
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/perfil.jsp");
		opcionResJSP.put("denegarSolicitud", resJSP);
		// Ver solicitudes
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/solicitudes.jsp");
		opcionResJSP.put("verSolicitudes", resJSP);
		// Cancelar solicitud propia
		resJSP = new HashMap<String, String>();
		resJSP.put("EXITO", "/perfil.jsp");
		resJSP.put("FRACASO", "/perfil.jsp");
		opcionResJSP.put("cancelarSolicitud", resJSP);

		mapaDeNavegacion.put("REGISTRADO", opcionResJSP);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		doGet(req, res);
	}

}