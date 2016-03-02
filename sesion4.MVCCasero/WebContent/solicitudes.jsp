<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Listado de viajes</title>
</head>
<body>
	<table border="1" align="center">
			<tr>
				<th>ID pasajero</th>
				<th>ID viaje</th>

			</tr>
		<c:forEach var="entry" items="${solicitudes}" varStatus="i">
			<tr id="item_${i.index}">
				<td>${entry.userId}</td>
				<td>${entry.tripId}</td>
				<td><a href="confirmarSolicitud?userId=${entry.userId}&tripId=${entry.tripId}">Confirmar</a></td>
				<td><a href="denegarSolicitud?userId=${entry.userId}&tripId=${entry.tripId}">Cancelar</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>