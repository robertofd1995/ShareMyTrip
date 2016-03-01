<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Mostrar viaje</title>
</head>
<body>

	<table border="1" align="center">
		<tr>
			<th>Rol</th>
			<th>Nombre</th>
			<th>Puntuacion</th>
			<th>Comentarios</th>
		</tr>
		<tr>
			<td>Promotor</td>
			<td>${promotor.name},${promotor.surname}</td>
			<td>Puntuacion...</td>
			<td>Comentarios</td>
			<td><a href="solicitarPlaza?id=${viaje.id}">Solicitar plaza</a></td>
		</tr>
		<c:forEach var="entry" items="${viajeros}" varStatus="i">
			<tr id="item_${i.index}">
				<td>Pasajero</td>
				<td>${entry.name},${entry.surname}</td>
				<td>pasajero ${i.index }</td>
				<td>${entry.email}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>