<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<%@ include file="boostrap.jsp"%>

<title>Modificar Datos</title>
</head>
<body>
	<jsp:useBean id="user" class="uo.sdi.model.User" scope="session" />


	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>Form Name</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Nombre
					de Usuario</label>
				<div class="col-md-4">
					<input id="textinput" name="textinput" type="text"
						placeholder="placeholder" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nombre">Nombre</label>
				<div class="col-md-4">
					<input id="nombre" name="nombre" type="text"
						placeholder="placeholder" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="apellidos">Apellidos</label>
				<div class="col-md-4">
					<input id="apellidos" name="apellidos" type="text"
						placeholder="placeholder" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Email</label>
				<div class="col-md-4">
					<input id="textinput" name="textinput" type="text"
						placeholder="placeholder" class="form-control input-md">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="confirmar"></label>
				<div class="col-md-4">
					<button id="confirmar" name="confirmar" class="btn btn-primary">Confirmar</button>
				</div>
			</div>

		</fieldset>
	</form>





	<table>
		<tr>
			<td>Login:</td>
			<td id="login"><jsp:getProperty property="login" name="user" /></td>
		</tr>
		<tr>
			<td>Nombre:</td>
			<td id="name"><jsp:getProperty property="name" name="user" /></td>
		</tr>
		<tr>
			<td>Apellidos:</td>
			<td id="surname"><jsp:getProperty property="surname" name="user" /></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td id="email"><form action="modificarDatos" method="POST">
					<input type="text" name="email" size="15"
						value="<jsp:getProperty property="email" name="user"/>"> <input
						type="submit" value="Modificar">
				</form></td>
		</tr>
	</table>
	<br /> Es Vd el usuario número: ${contador}
</body>
</html>
