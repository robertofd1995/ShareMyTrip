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
			<th>Fecha</th>
			<th>Origen</th>
			<th>Solicitudes</th>
			<th>Modificar Viaje</th>
		</tr>
		<c:forEach items="${misViajes}" var="entry" >
			<tr>
				<td>${entry.key}</td>
				<td>${entry.value.departureDate}</td>
				<td>${entry.value.departure.city}</td>
				<td><a href="verSolicitudes?id=${entry.value.id}">Ver solicitudes</a></td>
				<td><a href="modificarViaje?id=${entry.value.id}">Modificar/Cancelar Viaje</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>