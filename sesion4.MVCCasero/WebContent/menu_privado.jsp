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

<script type="text/javascript">$(document).ready(function(){

    $( ".update-close" ).click(function() {
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
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>

			<!-- <form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>  -->

			<ul class="nav navbar-nav navbar-right">
				<li><a class="navbar-text" href="perfil.jsp"
					style="margin: 0px;padding: 5px 15px;<!-- TODO poner en css -->
					padding-bottom: 0px;">
					<img src="img/account_blanco.png" alt=""></a></li>
				<li><p class="navbar-text">
						<a href="cerrarSession">Cerrar Session</a>
					</p></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<c:if test="${error!=null}">

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
	</c:if>

	<a id="listarViajes" href="listarViajes">Lista de viajes</a>

</body>
</html>