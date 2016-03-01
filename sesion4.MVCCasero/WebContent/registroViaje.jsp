<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- BOOSTRAP -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="css/log_register.css">
	<link rel="stylesheet" href="css/alerts.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar viaje</title>
</head>
<body>

	<form id="registrarViaje" action="registrarViaje" method="post" class="form-horizontal">
		<fieldset>
		<h1>Dirección de salida</h1>
			<!-- Form Name -->
			<legend>Formulario de creación de nuevo viaje</legend>

			<!-- Calle salida-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="calle_salida">Calle</label>
				<div class="col-md-4">
					<input id="calle_salida" name="calle_salida" type="text"
						placeholder="Nombre de la calle" class="form-control input-md"
						required="">

				</div>
			</div>

			<!-- Ciudad salida-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ciudad_salida">Ciudad</label>
				<div class="col-md-4">
					<input id="ciudad_salida" name="ciudad_salida" type="text" placeholder="ciudad_salida"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Provincia salida-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="provincia_salida">Provincia</label>
				<div class="col-md-4">
					<input id="provincia_salida" name="provincia_salida" type="text"
						placeholder="provincia_salida" class="form-control input-md">

				</div>
			</div>

			<!-- País salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="pais_salida">País</label>
				<div class="col-md-4">
					<input id="pais_salida" name="pais_salida" type="text"
						placeholder="pais_salida" class="form-control input-md" required="">

				</div>
			</div>

			<!-- Código postal salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="codigo_postal_salida">Código postal</label>
				<div class="col-md-4">
					<input id="codigo_postal_salida" name="codigo_postal_salida" type="text"
						placeholder="codigo_postal_salida" class="form-control input-md" required="">

				</div>
			</div>
			<!-- Coordenadas salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="coordenadas_salida">Coordenadas salida (latidud:longitud)</label>
				<div class="col-md-4">
					<input id="coordenadas_salida" name="coordenadas_salida" type="text"
						placeholder="coordenadas_salida" class="form-control input-md" required="">

				</div>
			</div>
			<!-- Fecha y hora salida -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fecha_salida">Fecha y hora 
				de llegada (dd/mm/aaaa hh:mm)</label>
				<div class="col-md-4">
					<input id="fecha_salida" name="fecha_salida" type="text"
						placeholder="fecha_hora_salida" class="form-control input-md" required="">

				</div>
			</div>
			
			<h2>Dirección de llegada</h2>

			<!-- Calle llegada-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="calle_llegada">Calle</label>
				<div class="col-md-4">
					<input id="calle_llegada" name="calle_llegada" type="text"
						placeholder="calle_llegada" class="form-control input-md"
						required="">

				</div>
			</div>

			<!-- Ciudad llegada-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ciudad_llegada">Ciudad</label>
				<div class="col-md-4">
					<input id="ciudad_llegada" name="ciudad_llegada" type="text" placeholder="ciudad"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Provincia llegada-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="provincia_llegada">Provincia</label>
				<div class="col-md-4">
					<input id="provincia_llegada" name="provincia_llegada" type="text"
						placeholder="provincia_llegada" class="form-control input-md">

				</div>
			</div>

			<!-- País llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="pais_llegada">País</label>
				<div class="col-md-4">
					<input id="pais_llegada" name="pais_llegada" type="text"
						placeholder="pais_llegada" class="form-control input-md" required="">

				</div>
			</div>

			<!-- Código postal llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="codigo_postal_llegada">Código postal</label>
				<div class="col-md-4">
					<input id="codigo_postal_llegada" name="codigo_postal_llegada" type="text"
						placeholder="codigo_postal_llegada" class="form-control input-md" required="">

				</div>
			</div>
			<!-- Coordenadas llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="coordenadas_llegada">Coordenadas llegada(latitud:longitud)</label>
				<div class="col-md-4">
					<input id="coordenadas_llegada" name="coordenadas_llegada" type="text"
						placeholder="coordenadas_llegada" class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Fecha y hora llegada -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fecha_llegada">Fecha y hora 
				de llegada (dd/mm/aaaa hh:mm)</label>
				<div class="col-md-4">
					<input id="fecha_llegada" name="fecha_llegada" type="text"
						placeholder="fecha_hora_llegada" class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Fecha límite -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fecha_limite">Fecha límite solicitud(dd/mm/aaaa)</label>
				<div class="col-md-4">
					<input id="fecha_limite" name="fecha_limite" type="text"
						placeholder="fecha_limite" class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Coste -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="coste">Coste (a repartir)</label>
				<div class="col-md-4">
					<input id="coste" name="coste" type="text"
						placeholder="coste" class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Comentarios -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="comentarios">Comentarios</label>
				<div class="col-md-4">
					<input id="comentarios" name="comentarios" type="text"
						placeholder="comentarios" class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Plazas maximas -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="plazas_maximas">Plazas máximas</label>
				<div class="col-md-4">
					<input id="plazas_maximas" name="plazas_maximas" type="text"
						placeholder="plazas_maximas" class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Plazas disponibles -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="plazas_disponibles">Plazas disponibles</label>
				<div class="col-md-4">
					<input id="plazas_disponibles" name="plazas_disponibles" type="text"
						placeholder="plazas_disponibles" class="form-control input-md" required="">

				</div>
			</div>
			
			



			<!-- Finalizar registro -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="button1id"></label>
				<div class="col-md-8">
					<button id="button1id" name="button1id" class="btn btn-success"
					type="submit">Registrar viaje</button>
					<button id="cancel" name="cancel" class="btn btn-danger">Cancelar</button>
				</div>
			</div>

		</fieldset>
	</form>


</body>
</html>