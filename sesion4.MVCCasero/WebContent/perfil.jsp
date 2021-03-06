<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<%@ include file="boostrap.jsp"%>

<link rel="stylesheet" href="css/perfil.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="css/alerts.css">




<title>Perfil</title>
</head>
<body>

	<jsp:useBean id="user" class="uo.sdi.model.User" scope="session" />

	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
				<div class="well profile">
					<div class="col-sm-12">
						<div class="col-xs-12 col-sm-8">
							<h2>
								<jsp:getProperty property="name" name="user" />
								<jsp:getProperty property="surname" name="user" />
							</h2>

							<p>
								<strong>Nombre de usuario: </strong>
								<jsp:getProperty property="login" name="user" />
							</p>
							<p>
								<strong>Hobbies: </strong> Play, out with friends, listen to
								music, draw and learn new things.
							</p>
							<p>
								<strong>Email: </strong>
								<jsp:getProperty property="email" name="user" />
							</p>
							<!-- <span class="tags">html5</span>  -->
							</p>
						</div>
						<div class="col-xs-12 col-sm-4 text-center">
							<figure> <img src="img/account.png" alt=""
								class="img-circle img-responsive" style="padding-left: 3em;">
							<figcaption class="ratings">
							<p>
								Ratings <a href="#"> <span class="fa fa-star"></span>
								</a> <a href="#"> <span class="fa fa-star"></span>
								</a> <a href="#"> <span class="fa fa-star"></span>
								</a> <a href="#"> <span class="fa fa-star"></span>
								</a> <a href="#"> <span class="fa fa-star-o"></span>
								</a>
							</p>
							</figcaption> </figure>
						</div>
					</div>
					<div class="col-xs-12 divider text-center">
						<div class="col-xs-12 col-sm-4 emphasis">
							<h2>
								<strong> TODO? </strong>
							</h2>
							<p>
								<small>Ultimo viaje</small>
							</p>
							<a href="verMisViajes"><button
									class="btn btn-success btn-block" id="verMisViajes">
									<span class="fa fa-plus-circle"></span> Ver Mis Viajes
								</button></a>
						</div>
						<div class="col-xs-12 col-sm-4 emphasis">
							<a class="btn btn-default btn-block" href="listarViajes"
								style="margin-top: 5.8em;"> <span class="glyphicon glyphicon-plane"></span>
								Ver Viajes
							</a>
						</div>
						
						<div class="col-xs-12 col-sm-4 emphasis">
							<h2>
								<strong>${contador}</strong>
							</h2>
							<p>
								<small>Usuario n�</small>
							</p>
							<div class="btn-group dropup btn-block">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown" >
									<span class="fa fa-gear"></span> Opciones
								</button>
								<ul class="dropdown-menu text-left" role="menu">
									<li><a href="modificarDatos"><span
											class="fa fa-envelope pull-right"></span> Modificar datos
											personales </a></li>
									<li><a href="registroViaje.jsp"><span
											class="fa fa-list pull-right"></span> Registrar Viaje </a></li>
									<li class="divider"></li>
									<li><a href="#"><span class="fa fa-warning pull-right"></span>Reportar
											a este usuario *</a></li>
									<!-- <li class="divider"></li>
                        <li><a href="#" class="btn disabled" role="button"> Unfollow </a></li>  -->
								</ul>
							</div>
						</div>
						
						
					</div>
					
					<div class="col-xs-12 col-sm-4 emphasis">
							<a class="btn btn-warning btn-block" href="cerrarSession"
								style="margin-top: 5em;margin-left: 12.25em;">
								<span class="fa fa-user"></span>
								Cerrar Session
							</a>
					</div>
						
				</div>
			</div>
		</div>
	</div>

	<c:if test="${errorPerfil!=null}">
		<!-- Mensajes de error -->
		<center>
			<div class="col-md-12">
				<div class="update-nag">
					<div class="update-close">X</div>
					<div class="update-split update-danger">
						<i class="glyphicon glyphicon-warning-sign"></i>
					</div>
					<div class="update-text">
						<strong>Warning</strong> ${errorPerfil}
					</div>
				</div>
			</div>
		</center>
	</c:if>

</body>
</html>