<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<%@ include file="boostrap.jsp"%>
<link rel="stylesheet" href="css/alerts.css">
<link rel="stylesheet" href="css/listadoViajes.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">
	
<script type="text/javascript">
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});
</script>

<title>ShareMyTrip - Listado de mis viajes</title>
</head>
<body>

<a class="btn btn-success btn-block" href="perfil.jsp" data-toggle="tooltip" 
			data-placement="bottom" title="Perfil"><span class="fa fa-user"></span>
</a>
	
	
	<div class="row">
		<div class="col-md-11" style="margin-left: 4.5em;">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Users</h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter">
							<span class="glyphicon glyphicon-filter"></span> Filtro
						</button>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control"
								placeholder="Rol " disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Id Viaje" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Fecha" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Origen" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Solicitudes" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Modificar Viaje" disabled></th>
						</tr>
					</thead>
					
					<c:set var="promotor" scope="page" value="PROMOTOR" />
					<c:set var="aceptado" scope="page" value="ACCEPTED" />
					<c:set var="excluido" scope="page" value="EXCLUDED" />
					<c:set var="sin_plaza" scope="page" value="SIN_PLAZA" />
					<c:set var="pendiente" scope="page" value="PENDIENTE" />
					
					<tbody>
						<c:forEach items="${misViajes}" var="entry" varStatus="i"> 
							<c:choose>
				<c:when test="${entry.key==promotor}">
					<tr>
						<td>${entry.key}</td>
						<td><a href="mostrarViaje?id=${entry.value.id}">${entry.value.id}</a></td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td><a href="verSolicitudes?id=${entry.value.id}">Ver
								solicitudes</a></td>
						<td><a href="modificarViaje?id=${entry.value.id}">Modificar Viaje</a></td>
					</tr>
				</c:when>

				<c:when test="${entry.key==aceptado}">
					<tr>
						<td>ACEPTADO</td>
						<td><a href="mostrarViaje?id=${entry.value.id}">${entry.value.id}</a></td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td><a href="cancelarSolicitud?id=${entry.value.id}">Cancelar solicitud</a></td>
						<td>No es promotor de este viaje</td>
					</tr>
				</c:when>
				
				<c:when test="${entry.key==excluido}">
					<tr>
						<td>EXCLUIDO</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td></td>
						<td>No es promotor de este viaje</td>
					</tr>
				</c:when>
				<c:when test="${entry.key==sin_plaza}">
					<tr>
						<td>SIN PLAZA</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td></td>
						<td>No es promotor de este viaje</td>
					</tr>
				</c:when>
				<c:when test="${entry.key==pendiente}">
					<tr>
						<td>PENDIENTE</td>
						<td>${entry.value.id}</td>
						<td>${entry.value.departureDate}</td>
						<td>${entry.value.departure.city}</td>
						<td><a href="cancelarSolicitud?id=${entry.value.id}">Cancelar solicitud</a></td>
						<td>No es promotor de este viaje</td>
					</tr>
				</c:when>
			</c:choose>
		</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>