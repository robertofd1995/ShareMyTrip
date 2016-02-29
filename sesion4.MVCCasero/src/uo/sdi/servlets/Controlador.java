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
import uo.sdi.acciones.publico.RegistrarseAction;
import uo.sdi.acciones.publico.ValidarseAction;
import uo.sdi.acciones.publico.VerViajePublicoAction;
import uo.sdi.acciones.registrado.CerrarSesionAction;
import uo.sdi.acciones.registrado.ConfirmarPasajerosAction;
import uo.sdi.acciones.registrado.ModificarDatosAction;
import uo.sdi.acciones.RegistrarViajeAction;
import uo.sdi.acciones.registrado.SolicitarPlazaAction;
import uo.sdi.acciones.registrado.VerViajeRegistradoAction;

public class Controlador extends javax.servlet.http.HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Map<String, Map<String, Accion>> mapaDeAcciones; // <rol, <opcion, objeto Accion>>
	private Map<String, Map<String, Map<String, String>>> mapaDeNavegacion; // <rol, <opcion, <resultado, JSP>>>

	public void init() throws ServletException {  
		crearMapaAcciones();
		crearMapaDeJSP();
    }
	
//prueba commit
	public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws IOException, ServletException {
		
		String opcion, resultado, jspSiguiente;
		Accion accion;
		String rolAntes, rolDespues;
		
		try {
			opcion=req.getServletPath().replace("/","");
				
			rolAntes=obtenerRolDeSesion(req);
			
			accion=buscarAccionParaOpcion(rolAntes, opcion);
				
			resultado=accion.execute(req,res);
				
			rolDespues=obtenerRolDeSesion(req);
			
			jspSiguiente=buscarJSPSegun(rolDespues, opcion, resultado);

			req.setAttribute("jspSiguiente", jspSiguiente);

		} catch(Exception e) {
			
			req.getSession().invalidate();
			
			Log.error("Se ha producido alguna excepción no manejada [%s]",e);
			
			jspSiguiente="/error.jsp";
		}
			
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jspSiguiente); 
			
		dispatcher.forward(req, res);			
	}			
	
	
	private String obtenerRolDeSesion(HttpServletRequest req) {
		HttpSession sesion=req.getSession();
		if (sesion.getAttribute("user")==null)
			return "PUBLICO";
		else
			return "REGISTRADO";
	}

	// Obtiene un objeto accion en funci�n de la opci�n
	// enviada desde el navegador
	private Accion buscarAccionParaOpcion(String rol, String opcion) {
		
		Accion accion=mapaDeAcciones.get(rol).get(opcion);
		Log.debug("Elegida acción [%s] para opción [%s] y rol [%s]",accion,opcion,rol);
		return accion;
	}
	
	
	// Obtiene la p�gina JSP a la que habr� que entregar el
	// control el funci�n de la opci�n enviada desde el navegador
	// y el resultado de la ejecuci�n de la acci�n asociada
	private String buscarJSPSegun(String rol, String opcion, String resultado) {
		
		String jspSiguiente=mapaDeNavegacion.get(rol).get(opcion).get(resultado);
		Log.debug("Elegida página siguiente [%s] para el resultado [%s] tras realizar [%s] con rol [%s]",jspSiguiente,resultado,opcion,rol);
		return jspSiguiente;		
	}
		
		
	private void crearMapaAcciones() {
		
		mapaDeAcciones=new HashMap<String,Map<String,Accion>>();
		
		Map<String,Accion> mapaPublico=new HashMap<String,Accion>();
		mapaPublico.put("validarse", new ValidarseAction());
		mapaPublico.put("listarViajes", new ListarViajesAction());
		mapaPublico.put("registrase", new RegistrarseAction());
		mapaPublico.put("verViajePublico", new VerViajePublicoAction());
		mapaPublico.put("registrarUsuario", new RegistrarUsuarioAction());

		mapaDeAcciones.put("PUBLICO", mapaPublico);
		
		Map<String,Accion> mapaRegistrado=new HashMap<String,Accion>();
		mapaRegistrado.put("modificarDatos", new ModificarDatosAction());
		mapaRegistrado.put("verViajeRegistrado", new VerViajeRegistradoAction());
		mapaRegistrado.put("solicitarPlaza", new SolicitarPlazaAction());
		mapaRegistrado.put("confirmarPasajeros", new ConfirmarPasajerosAction());
		mapaRegistrado.put("registrarViaje", new RegistrarViajeAction());
		mapaRegistrado.put("cerrarSesion", new CerrarSesionAction());
		mapaDeAcciones.put("REGISTRADO", mapaRegistrado);
	}
	
	
	private void crearMapaDeJSP() {
				
		mapaDeNavegacion=new HashMap<String,Map<String, Map<String, String>>>();

		// Crear mapas auxiliares vacíos
		Map<String, Map<String, String>> opcionResJSP=new HashMap<String, Map<String, String>>();
		Map<String, String> resJSP=new HashMap<String, String>();

		// Mapa de navegación del público
		resJSP.put("FRACASO","/menu.jsp");
		opcionResJSP.put("validarse", resJSP);
		//ListarViajes
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/listaViajes.jsp");
		opcionResJSP.put("listarViajes", resJSP);
		//Mostrar viaje publico
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/verViajePublico.jsp");
		opcionResJSP.put("verViajePublico", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/menu_privado.jsp"); //TODO corregir 
		opcionResJSP.put("registrarUsuario", resJSP);
		
		mapaDeNavegacion.put("PUBLICO",opcionResJSP);
		
		// Crear mapas auxiliares vacíos
		opcionResJSP=new HashMap<String, Map<String, String>>();
		resJSP=new HashMap<String, String>();
		
		// Mapa de navegación de usuarios registrados

		resJSP.put("EXITO","/perfil.jsp");
		opcionResJSP.put("validarse", resJSP);
		//Ver viaje registrado
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/verViajeRegistrado.jsp");
		opcionResJSP.put("verViajeRegistrado", resJSP);
		//Modificar datos
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/perfil.jsp");
		opcionResJSP.put("modificarDatos", resJSP);
		//Solicitar plaza
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/solicitarPlaza.jsp");
		resJSP.put("FRACASO","/viajeCompleto.jsp");
		opcionResJSP.put("solicitarPlaza", resJSP);
		//Confirmar pasajeros
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/confirmarPasajeros.jsp");
		resJSP.put("FRACASO","/errorConfirmarPasajeros.jsp");
		opcionResJSP.put("confirmarPasajeros", resJSP);
		//Registrar viaje
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/perfil.jsp");
		opcionResJSP.put("registrarViaje", resJSP);
		//Cerrar sesion
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/cerrarSesion.jsp");
		opcionResJSP.put("cerrarSesion", resJSP);
		
		mapaDeNavegacion.put("REGISTRADO",opcionResJSP);
	}
			
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		doGet(req, res);
	}

}