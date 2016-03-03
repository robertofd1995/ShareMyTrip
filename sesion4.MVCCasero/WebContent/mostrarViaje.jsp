<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="boostrap.jsp"%>

<title>ShareMyTrip - Mostrar viaje</title>

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

<a class="btn btn-success btn-block" href="perfil.jsp" data-toggle="tooltip" 
			data-placement="bottom" title="Perfil"><span class="fa fa-user"></span>
		</a>

	<div>
	<table border="1" align="center" class="table table-hover">
		<tr>
			<th>Rol</th>
			<th>Nombre</th>
			<th>Plaza</th>
			<th>Comentarios</th>
		</tr>
		<tr>
			<td>Promotor</td>
			<td>${promotor.name},${promotor.surname}</td>
			<td>${viaje.availablePax }</td>
			<td>...</td>
			<td><a href="solicitarPlaza?id=${viaje.id}">Solicitar plaza</a></td>
		</tr>
		<c:forEach var="entry" items="${viajeros}" varStatus="i">
			<tr id="item_${i.index}">
				<td>Pasajero</td>
				<td>${entry.name},${entry.surname}</td>
				<td>pasajero ${i.index}</td>
				<td>${entry.email}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>