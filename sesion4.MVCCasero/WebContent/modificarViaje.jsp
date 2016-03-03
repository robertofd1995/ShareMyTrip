<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ include file="boostrap.jsp"%>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/alerts.css">

<title>Modificar Viaje</title>
</head>
<body>

	<jsp:useBean id="viaje" class="uo.sdi.model.Trip" scope="session" />
	<jsp:useBean id="salida" class="uo.sdi.model.AddressPoint"
		scope="session" />
	<jsp:useBean id="destino" class="uo.sdi.model.AddressPoint"
		scope="session" />

	<a class="btn btn-success btn-block" href="perfil.jsp"
		data-toggle="tooltip" data-placement="bottom" title="Mis Viajes"
		style="position: fixed; z-index: 2;"><span
		class="glyphicon glyphicon-plane"></span> </a>

	<c:if test="${errorViaje!=null}">
		<!-- Mensajes de error -->
		<center>
			<div class="col-md-12">
				<div class="update-nag">
					<div class="update-close">X</div>
					<div class="update-split update-danger">
						<i class="glyphicon glyphicon-warning-sign"></i>
					</div>
					<div class="update-text">
						<strong>Warning</strong> ${errorViaje}
					</div>
				</div>
			</div>
		</center>
	</c:if>

	<form id="registrarViaje"
		action="modificarViaje?id=<jsp:getProperty property="id" name="viaje" />"
		method="post" class="form-horizontal" style="padding-top: 2em;">
		<fieldset>
			<h2>Dirección de salida</h2>

			<!-- Calle salida-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="calle_salida">Calle</label>
				<div class="col-md-4">
					<input id="calle_salida" name="calle_salida" type="text"
						value="<jsp:getProperty property="address" name="salida" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Ciudad salida-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ciudad_salida">Ciudad</label>
				<div class="col-md-4">
					<input id="ciudad_salida" name="ciudad_salida" type="text"
						value="<jsp:getProperty property="city" name="salida" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Provincia salida-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="provincia_salida">Provincia</label>
				<div class="col-md-4">
					<input id="provincia_salida" name="provincia_salida" type="text"
						value="<jsp:getProperty property="state" name="salida" />"
						class="form-control input-md">

				</div>
			</div>

			<!-- País salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="pais_salida">País</label>
				<div class="col-md-4">
					<input id="pais_salida" name="pais_salida" type="text"
						value="<jsp:getProperty property="country" name="salida" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Código postal salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="codigo_postal_salida">Código
					postal</label>
				<div class="col-md-4">
					<input id="codigo_postal_salida" name="codigo_postal_salida"
						type="text"
						value="<jsp:getProperty property="zipCode" name="salida" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Coordenadas salida -->
			<h3>Coordenadas salida</h3>
			<div class="form-group">
				<label class="col-md-4 control-label" for="latitud_salida">Latitud</label>
				<div class="col-md-4">
					<input id="latitud_salida" name="latitud_salida" type="text"
						value="${salida.waypoint.lat}" class="form-control input-md"
						required="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="longitud_salida">Longitud</label>
				<div class="col-md-4">
					<input id="longitud_salida" name="longitud_salida" type="text"
						value="${salida.waypoint.lon}" class="form-control input-md"
						required="">
				</div>
			</div>

			<!-- Fecha y hora salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fecha_salida">Fecha
					y hora de llegada (dd-mm-aaaa hh:mm)</label>
				<div class="col-md-4">
					<input id="fecha_salida" name="fecha_salida" type="text"
						value="<fmt:formatDate value="${viaje.departureDate}" pattern="dd-MM-yyyy hh:mm"/>"
						class="form-control input-md" required="">

				</div>
			</div>

			<h2>Dirección de llegada</h2>

			<!-- Calle llegada-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="calle_llegada">Calle</label>
				<div class="col-md-4">
					<input id="calle_llegada" name="calle_llegada" type="text"
						value="<jsp:getProperty property="address" name="destino" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Ciudad llegada-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ciudad_llegada">Ciudad</label>
				<div class="col-md-4">
					<input id="ciudad_llegada" name="ciudad_llegada" type="text"
						value="<jsp:getProperty property="city" name="destino" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Provincia llegada-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="provincia_llegada">Provincia</label>
				<div class="col-md-4">
					<input id="provincia_llegada" name="provincia_llegada" type="text"
						value="<jsp:getProperty property="state" name="destino" />"
						class="form-control input-md">

				</div>
			</div>

			<!-- País llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="pais_llegada">País</label>
				<div class="col-md-4">
					<input id="pais_llegada" name="pais_llegada" type="text"
						value="<jsp:getProperty property="country" name="destino" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Código postal llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="codigo_postal_llegada">Código
					postal</label>
				<div class="col-md-4">
					<input id="codigo_postal_llegada" name="codigo_postal_llegada"
						type="text"
						value="<jsp:getProperty property="zipCode" name="destino" />"
						class="form-control input-md" required="">

				</div>
			</div>
			<!-- Coordenadas llegada -->
			<h2>Coordenadas llegada</h2>
			<div class="form-group">
				<label class="col-md-4 control-label" for="latitud_llegada">Latitud</label>
				<div class="col-md-4">
					<input id="latitud_llegada" name="latitud_llegada" type="text"
						value="${destino.waypoint.lat}" class="form-control input-md"
						required="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="longitud_llegada">Longitud</label>
				<div class="col-md-4">
					<input id="longitud_llegada" name="longitud_llegada" type="text"
						value="${destino.waypoint.lon}" class="form-control input-md"
						required="">
				</div>
			</div>

			<!-- Fecha y hora llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fecha_llegada">Fecha
					y hora de llegada (dd/mm/aaaa hh:mm)</label>
				<div class="col-md-4">
					<input id="fecha_llegada" name="fecha_llegada" type="text"
						value="<fmt:formatDate value="${viaje.arrivalDate}" pattern="dd-MM-yyyy hh:mm"/>"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Fecha límite -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fecha_limite">Fecha
					límite solicitud(dd/mm/aaaa)</label>
				<div class="col-md-4">
					<input id="fecha_limite" name="fecha_limite" type="text"
						value="<fmt:formatDate value="${viaje.closingDate}" pattern="dd-MM-yyyy hh:mm"/>"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Coste -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="coste">Coste (a
					repartir)</label>
				<div class="col-md-4">
					<input id="coste" name="coste" type="text"
						value="<jsp:getProperty property="estimatedCost" name="viaje" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Comentarios -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="comentarios">Comentarios</label>
				<div class="col-md-4">
					<input id="comentarios" name="comentarios" type="text"
						value="<jsp:getProperty property="comments" name="viaje" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Plazas maximas -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="plazas_maximas">Plazas
					máximas</label>
				<div class="col-md-4">
					<input id="plazas_maximas" name="plazas_maximas" type="text"
						value="<jsp:getProperty property="maxPax" name="viaje" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Plazas disponibles -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="plazas_disponibles">Plazas
					disponibles</label>
				<div class="col-md-4">
					<input id="plazas_disponibles" name="plazas_disponibles"
						type="text"
						value="<jsp:getProperty property="availablePax" name="viaje" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<c:if test="${errorModificarViaje!=null}">
				<!-- Mensajes de error -->
				<center>
					<div class="col-md-12">
						<div class="update-nag">
							<div class="update-close">X</div>
							<div class="update-split update-danger">
								<i class="glyphicon glyphicon-warning-sign"></i>
							</div>
							<div class="update-text">
								<strong>Warning</strong> ${errorModificarViaje}
							</div>
						</div>
					</div>
				</center>
			</c:if>


			<!-- Finalizar registro -->
			<center>
				<div class="form-group">
					<label class="col-md-4 control-label" for="confirmar"></label>
					<div class="col-md-4">
						<button id="confirmar" name="confirmar" type="submit"
							class="btn btn-success">Confirmar Cambios</button>
					</div>
				</div>
			</center>


		</fieldset>
	</form>

	<center>
		<form id="eliminarViaje"
			action="eliminarViaje?id=<jsp:getProperty property="id" name="viaje" />"
			method="post" class="form-horizontal">
			<button id="cancel" name="confirmar" class="btn btn-danger"
				type="submit">Borrar Viaje</button>
		</form>
	</center>

</body>
</html>