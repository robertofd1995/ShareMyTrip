package uo.sdi.tests;

import net.sourceforge.jwebunit.api.IElement;

import org.junit.*;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class Sesion4Tests {

    @Before
    public void prepare() {
        setBaseUrl("http://localhost:8280/sesion4.MVCCasero");
    }

    @Test
    public void testListarViajes() {
        beginAt("/");  // Navegar a la URL
        assertLinkPresent("btn");  // Comprobar que existe el hipervínculo
        clickLink("btn"); // Seguir el hipervínculo

        assertTitleEquals("ShareMyTrip - Listado de viajes");  // Comprobar título de la página

        // La base de datos contiene 2 viajes tal y como se entrega
        assertElementPresent("item_0"); // Comprobar elemento presente en la página
        assertElementPresent("item_1"); // Comprobar elemento presente en la página
    }

    @Test
    public void testIniciarSesionConExito() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        setTextField("nombreUsuario", "user1"); // Rellenar primer campo de formulario
        setTextField("pass", "user1"); // Rellenar primer campo de formulario
        assertButtonPresent("signIn");
        clickButton("signIn");
        assertTitleEquals("Perfil");  // Comprobar título de la página
        assertTextPresent("Fernando");
        assertTextPresent("Usuario nº"); // Comprobar cierto texto está presente
    }

    @Test
    public void testIniciarSesionConExitoConQueryString() {
    	// Rellenando el formulario HTML
        beginAt("/validarse?nombreUsuario=user2&pass=user2");  // Navegar a la URL
        assertTitleEquals("Perfil");  // Comprobar título de la página
        assertButtonPresent("verMisViajes");
        assertTextPresent("Usuario nº"); // Comprobar cierto texto está presente
    }
    
    @Test
    public void testIniciarSesionSinExito() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        setTextField("nombreUsuario", "yoNoExisto"); // Rellenar primer campo de formulario
        clickButton("signIn"); // Seguir el hipervínculo
        assertTitleEquals("Share My Trip");  // Comprobar título de la página
        assertTextPresent("usuario no esta registrado");
    }

    /*
     * 1. Iniciar sesion sin exito debido a introducir contraseña incorrecta
     */
    @Test
    public void testIniciarSesionContraseñaIncorrecta() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        setTextField("nombreUsuario", "user1"); // Rellenar primer campo de formulario
        setTextField("pass", "incorrecta"); // Rellenar primer campo de formulario
        clickButton("signIn"); // Seguir el hipervínculo
        assertTitleEquals("Share My Trip");  // Comprobar título de la página
        assertTextPresent("La contraseña no es valida");
    }
    
    
     /* 2. Usuario promotor, registrar un nuevo viaje*/
        @Test
    public void testRegistrarViaje() {
    	// Rellenando el formulario HTML
        beginAt("/validarse?nombreUsuario=user2&pass=user2");  // Navegar a la URL
        gotoPage("http://localhost:8280/sesion4.MVCCasero/registroViaje.jsp");
        setTextField("calle_salida", "calle"); // Rellenar primer campo de formulario
        setTextField("ciudad_salida", "ciudad"); // Rellenar primer campo de formulario
        setTextField("provincia_salida", "provincia"); // Rellenar primer campo de formulario
        setTextField("pais_salida", "pais"); // Rellenar primer campo de formulario
        setTextField("codigo_postal_salida", "00000"); // Rellenar primer campo de formulario
        setTextField("latitud_salida", "0.000"); // Rellenar primer campo de formulario
        setTextField("longitud_salida", "1.000"); // Rellenar primer campo de formulario
        setTextField("fecha_salida", "01/01/2017 15:00"); // Rellenar primer campo de formulario
        
        setTextField("calle_llegada", "calle2"); // Rellenar primer campo de formulario
        setTextField("ciudad_llegada", "ciudad2"); // Rellenar primer campo de formulario
        setTextField("provincia_llegada", "provincia2"); // Rellenar primer campo de formulario
        setTextField("pais_llegada", "pais"); // Rellenar primer campo de formulario
        setTextField("codigo_postal_llegada", "11111"); // Rellenar primer campo de formulario
        setTextField("latitud_llegada", "3.000"); // Rellenar primer campo de formulario
        setTextField("longitud_llegada", "4.000"); // Rellenar primer campo de formulario
        setTextField("fecha_llegada", "02/01/2017 15:00"); // Rellenar primer campo de formulario
        
        setTextField("fecha_limite", "31/12/2016 23:00"); // Rellenar primer campo de formulario
        setTextField("coste", "100"); // Rellenar primer campo de formulario
        setTextField("comentarios", "..."); // Rellenar primer campo de formulario
        setTextField("plazas_disponibles", "5"); // Rellenar primer campo de formulario
      
        clickButton("button1id"); // Seguir el hipervínculo
        
        assertTextPresent("Luisa Perez");
    }
     /* 3. Usuario nopromotor, solicitar plaza en un viaje */
}