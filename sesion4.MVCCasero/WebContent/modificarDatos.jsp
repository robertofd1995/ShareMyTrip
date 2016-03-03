<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">
	
<%@ include file="boostrap.jsp"%>

<link rel="stylesheet" href="css/alerts.css">


<title>Modificar Datos</title>
</head>
<body>

<a class="btn btn-warning btn-block" href="perfil.jsp" data-toggle="tooltip" 
data-placement="bottom" title="Perfil"><span class="fa fa-user"></span>
</a>


	<jsp:useBean id="user" class="uo.sdi.model.User" scope="session" />


	<form class="form-horizontal" action="modificarDatos" method="POST">
		<fieldset>

			<!-- Form Name -->
			<center>
				<h2>Modificar Datos de Usuario</h2>
			</center>


			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nombre">Nombre</label>
				<div class="col-md-4">
					<input id="nombre" name="nombre" type="text"
						placeholder="<jsp:getProperty property="name" name="user" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="apellidos">Apellidos</label>
				<div class="col-md-4">
					<input id="apellidos" name="apellidos" type="text"
						placeholder="<jsp:getProperty property="surname" name="user" />"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Email</label>
				<div class="col-md-4">
					<input id="textinput" name="email" type="email"
						placeholder="<jsp:getProperty property="email" name="user"/>"
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Button -->
			<center>
				<div class="form-group">
					<label class="col-md-4 control-label" for="confirmar"></label>
					<div class="col-md-4">
						<button id="confirmar" name="confirmar" type="submit"
							class="btn btn-primary">Confirmar</button>
					</div>
				</div>
			</center>

		</fieldset>
	</form>

	<!-- Modificar Password -->
	<form class="form-horizontal" action="modificarPassword" method="POST">
		<fieldset>

			<center>
				<h2>Modificar Contraseña</h2>
			</center>


			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="passAntigua">Contraseña
					Antigua</label>
				<div class="col-md-4">
					<input id="passAntigua" name="passAntigua" type="password"
						placeholder="contraseñaAntigua" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nuevaPass">Nueva
					Contraseña</label>
				<div class="col-md-4">
					<input id="nuevaPass" name="nuevaPassword" type="password"
						placeholder="nueva contraseña" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nuevaPass2">Nueva contraseña</label>
				<div class="col-md-4">
					<input id="nuevaPass2" name="nuevaPassword2" type="password"
						placeholder="repita de nuevo la nueva contraseña"
						class="form-control input-md">

				</div>
			</div>

			<!-- Button -->
			<center>
				<div class="form-group">
					<label class="col-md-4 control-label" for="confirmar"></label>
					<div class="col-md-4">
						<button id="confirmar" name="confirmar" type="submit"
							class="btn btn-primary">Confirmar</button>
					</div>
				</div>
			</center>

		</fieldset>
	</form>

	<c:if test="${errorModificarUser!=null}">
		<!-- Mensajes de error -->
		<center>
			<div class="col-md-12">
				<div class="update-nag">
					<div class="update-close">X</div>
					<div class="update-split update-danger">
						<i class="glyphicon glyphicon-warning-sign"></i>
					</div>
					<div class="update-text">
						<strong>Warning</strong> ${errorModificarUser}
					</div>
				</div>
			</div>
		</center>
	</c:if>
	
	<c:if test="${okModificarUser!=null}">
		<!-- Mensajes de error -->
		<center>
			<div class="col-md-12">
				<div class="update-nag">
					<div class="update-close">X</div>
					<div class="update-split update-success">
						<i class="glyphicon glyphicon-ok"></i>
					</div>
					<div class="update-text">
						<strong>Warning</strong> ${okModificarUser}
					</div>
				</div>
			</div>
		</center>
	</c:if>
	

	


</body>
</html>
