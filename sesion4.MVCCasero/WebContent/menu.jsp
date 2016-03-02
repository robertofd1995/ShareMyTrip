<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- CSS -->

<%@ include file="boostrap.jsp"%>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/menu2.css">
<link rel="stylesheet" href="css/log_register.css">
<link rel="stylesheet" href="css/alerts.css">

<script type="text/javascript">
	$(document).ready(function() {

		$(".update-close").click(function() {
			$(this).parent().parent().hide();
		});

	});
</script>

<!-- Se han de añadir estas dos lineas si aparece el menu -->
<title>Share My Trip</title>
</head>
<body>

	<nav class="navbar navbar-default navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Share My Trip</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="listarViajes">Listar Viajes</a></li>
				<!-- <li><a href="#">Link</a></li>  -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> Github <i class="fa fa-github"></i>  <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- <li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>  -->
						<li><a href="https://github.com/robertofd1995/ShareMyTrip">Codigok</a></li>
						<li><a href="https://github.com/robertofd1995/ShareMyTrip/wiki"
						  target="_blank"></i>Documentacion en GitHub</a></li>
						<li class="divider"></li>
						<li><a href="http://robertofd1995.github.io/ShareMyTrip">Resumen de proyecto</a></li>
					</ul></li>
			</ul>

			<!-- <form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>  -->

			<ul class="nav navbar-nav navbar-right">
				<li><p class="navbar-text">Ya tienes una cuenta?</p></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
							<div class="row">
								<div class="col-md-12">
									Login
									<form class="form" role="form" method="post" action="validarse"
										accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											<label class="sr-only" for="exampleInputEmail2">Email
												address</label> <input type="textinput" class="form-control"
												name="nombreUsuario" id="exampleInputEmail2"
												placeholder="Email address" required> <label
												class="sr-only" for="exampleInputPassword2">Password</label>
											<input type="password" class="form-control" name="pass"
												id="exampleInputPassword2" placeholder="Password" required>
											<div class="help-block text-right">
												<a href="#">¿Has olvidado la contraseña?</a>
											</div>

											<button type="submit" class="btn btn-primary btn-block">Sign
												in</button>
										</div>
										<div class="checkbox">
											<label> <input type="checkbox"> keep me
												logged-in
											</label>
										</div>
									</form>
								</div>
								<div class="bottom text-center">
									Nuevo aqui ? <a href="registroUsuario.jsp"><b>Registrate</b></a>
								</div>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	
		<c:if test="${error!=null}">
			<center>
			<div class="col-md-12">
				<div class="update-nag">
					<div class="update-close">X</div>
					<div class="update-split update-danger">
						<i class="glyphicon glyphicon-warning-sign"></i>
					</div>
					<div class="update-text">
						<strong>Warning</strong> ${error}
					</div>
				</div>
			</div>
			</center>
		</c:if>
	
	<!-- <a id="listarViajes" href="listarViajes">Lista de viajes</a>  -->
	
	<center style="
    margin-top: 15em;
	"><a id="btn" href="listarViajes" >Ver Viajes</a></center>

</body>
</html>