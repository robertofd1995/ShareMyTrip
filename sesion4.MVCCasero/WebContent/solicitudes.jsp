<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="boostrap.jsp"%>

<title>ShareMyTrip - Solicitudes</title>

<link rel="stylesheet" href="css/alerts.css">
<link rel="stylesheet" href="css/listadoViajes.css">

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>

<div class="col-md-12">
	<table border="1" align="center" class="table table-hover">
			<tr>
				<th>ID pasajero</th>
				<th>ID viaje</th>
				<th>Confirmar Solicitud</th>
				<th>Cancelar Solicitud</th>

			</tr>
		<c:forEach var="entry" items="${solicitudes}" varStatus="i">
			<tr id="item_${i.index}">
				<td>${entry.userId}</td>
				<td>${entry.tripId}</td>
				<td><a href="confirmarSolicitud?userId=${entry.userId}&tripId=${entry.tripId}">
				<span class="glyphicon glyphicon-ok"></span></a></td>
				<td><a href="denegarSolicitud?userId=${entry.userId}&tripId=${entry.tripId}">
				<span class="glyphicon glyphicon-remove"></span></a></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>