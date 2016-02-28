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
<title>Registrate</title>
</head>
<body>

	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>Formulario de registro</legend>

			<!-- Nombre de usuario-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nombreUser">Nombre
					de usuario</label>
				<div class="col-md-4">
					<input id="nombreUser" name="nombreUser" type="text"
						placeholder="nombre de usuario" class="form-control input-md"
						required="">

				</div>
			</div>

			<!-- Nombre-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nombre">Nombre</label>
				<div class="col-md-4">
					<input id="nombre" name="nombre" type="text" placeholder="nombre"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Apellidos-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="apellidos ">Apellidos</label>
				<div class="col-md-4">
					<input id="apellidos " name="apellidos " type="text"
						placeholder="apellidos" class="form-control input-md">

				</div>
			</div>

			<!-- Password -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="pass1">Constraseña</label>
				<div class="col-md-4">
					<input id="pass1" name="pass1" type="password"
						placeholder="contraseña" class="form-control input-md" required="">

				</div>
			</div>

			<!-- Password Check-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="pass2">Repita la
					contraseña</label>
				<div class="col-md-4">
					<input id="pass2" name="pass2" type="password"
						placeholder="contraseña" class="form-control input-md" required="">

				</div>
			</div>

			<!-- Correo electronico-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="correo">Correo
					electronico</label>
				<div class="col-md-4">
					<input id="correo" name="correo" type="text" placeholder="correo"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Finalizar registro -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="button1id"></label>
				<div class="col-md-8">
					<button id="button1id" name="button1id" class="btn btn-success">Registrarse</button>
					<button id="cancel" name="cancel" class="btn btn-danger">Cancelar</button>
				</div>
			</div>

		</fieldset>
	</form>


</body>
</html>