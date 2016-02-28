<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<center>
	<h1>
		Share My Trip <small>Your application for travel</small>
	</h1>
</center>

<form id="log_register" action="validarse" method="post"
	class="form-horizontal">
	<fieldset>

		<!-- Formulario para la validacion de usuarios-->
		<div class="form-group">
			<div class="col-md-4">
				<input id="textinput" name="nombreUsuario" type="text"
					align="middle" placeholder="User Name"
					class="form-control input-md">
				<button id="iniciarSession" type="submit" value="Enviar"
					align="right" class="btn btn-default" data-toggle="tooltip"
					data-placement="top" title="Inicie session">Log in</button>
					
				<a href="registroUsuario.jsp" class="btn btn-primary btn-info">
				Registrarse <span class="glyphicon glyphicon-user"></span></a>
			</div>
		</div>

		<c:if test="${error!=null}">

			<div class="col-md-12">
				<div class="update-nag">
					<div class="update-close">X</div>
					<div class="update-split update-danger">
						<i class="glyphicon glyphicon-warning-sign"></i>
					</div>
					<div class="update-text">
						<strong>Warning</strong>  ${error}
					</div>
				</div>
			</div>
		</c:if>


	</fieldset>
</form>
