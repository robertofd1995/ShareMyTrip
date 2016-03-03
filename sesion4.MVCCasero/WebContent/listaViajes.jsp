<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<%@ include file="boostrap.jsp"%>

<title>ShareMyTrip - Listado de viajes</title>

<link rel="stylesheet" href="css/alerts.css">
<link rel="stylesheet" href="css/listadoViajes.css">

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
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

</head>
<body>

<c:if test="${user!=null}">
		<a class="btn btn-success btn-block" href="perfil.jsp" data-toggle="tooltip" 
			data-placement="bottom" title="Perfil"><span class="fa fa-user"></span>
		</a>
		</c:if>

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
				<table class="table" name="viajes">
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control"
								placeholder="Id viaje" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Origen" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Destino" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Plazas Libres" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Coste" disabled></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="entry" items="${listaViajes}" varStatus="i">
							<tr id="item_${i.index}">
								<td><a id="mostrarViaje" href="mostrarViaje?id=${entry.id}">${entry.id}</a></td>
								<td id="origen">${entry.departure.city}</td>
								<td id="destino">${entry.destination.city}</td>
								<td>${entry.availablePax}</td>
								<td>${entry.estimatedCost}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>