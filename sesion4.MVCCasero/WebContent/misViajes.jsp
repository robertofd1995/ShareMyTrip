<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Listado de mis viajes</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<th>Rol</th>
			<th>ID viaje</th>
			<th>Fecha</th>
			<th>Origen</th>
			<th>Solicitudes</th>
		</tr>
		<c:set var="promotor" scope="page" value="PROMOTOR" />
		<c:set var="aceptado" scope="page" value="ACCEPTED" />
		<c:set var="excluido" scope="page" value="EXCLUDED" />
		<c:set var="sin_plaza" scope="page" value="SIN_PLAZA" />
		<c:set var="pendiente" scope="page" value="PENDIENTE" />
		<c:forEach items="${misViajes}" var="entry">

			<c:choose>
				<c:when test="${entry.key==promotor}">
					<tr>
						<td>${entry.key}</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td><a href="verSolicitudes?id=${entry.value.id}">Ver
								solicitudes</a></td>
					</tr>
				</c:when>

				<c:when test="${entry.key==aceptado}">
					<tr>
						<td>ACEPTADO</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td><a href="cancelarSolicitud?id=${entry.value.id}">Cancelar solicitud</a></td>
					</tr>
				</c:when>
				
				<c:when test="${entry.key==excluido}">
					<tr>
						<td>EXCLUIDO</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td></td>
					</tr>
				</c:when>
				<c:when test="${entry.key==sin_plaza}">
					<tr>
						<td>SIN PLAZA</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td></td>
					</tr>
				</c:when>
				<c:when test="${entry.key==pendiente}">
					<tr>
						<td>PENDIENTE</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td></td>
					</tr>
				</c:when>
			</c:choose>

		</c:forEach>
	</table>
</body>
</html>