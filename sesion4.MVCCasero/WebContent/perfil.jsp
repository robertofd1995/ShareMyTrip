<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/perfil.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
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
                    	<jsp:getProperty property="surname" name="user"/>
                    </h2>
                    
                    <p><strong>Nombre de usuario: </strong> <jsp:getProperty property="login" name="user" /> </p>
                    <p><strong>Hobbies: </strong> Play, out with friends, listen to music, draw and learn new things. </p>
                    <p><strong>Email: </strong> <jsp:getProperty property="email" name="user"/> </p>
                    <!-- <span class="tags">html5</span>  -->  
                    </p>
                </div>             
                <div class="col-xs-12 col-sm-4 text-center">
                    <figure>
                        <img src="img/account.png" alt="" class="img-circle img-responsive" 
                        style=" padding-left: 3em;">
                        <figcaption class="ratings">
                            <p>Ratings
                            <a href="#">
                                <span class="fa fa-star"></span>
                            </a>
                            <a href="#">
                                <span class="fa fa-star"></span>
                            </a>
                            <a href="#">
                                <span class="fa fa-star"></span>
                            </a>
                            <a href="#">
                                <span class="fa fa-star"></span>
                            </a>
                            <a href="#">
                                 <span class="fa fa-star-o"></span>
                            </a> 
                            </p>
                        </figcaption>
                    </figure>
                </div>
            </div>            
            <div class="col-xs-12 divider text-center">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong> TODO? </strong></h2>                    
                    <p><small>Ultimo viaje</small></p>
                    <button class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> (Ver Viaje *) </button>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">                   
                    <a class="btn btn-info btn-block" href="menu.jsp" style="margin-top: 6em;">
                    <span class="fa fa-user"></span> Volver al Menu </a>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>${contador}</strong></h2>                    
                    <p><small>Usuario nº</small></p>
                    <div class="btn-group dropup btn-block">
                      <button type="button" class="btn btn-primary"><span class="fa fa-gear"></span> Opciones </button>
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                      style="border-bottom-width: 1.25em;">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu text-left" role="menu">
                        <li><a href="modificarDatos.jsp"><span class="fa fa-envelope pull-right"></span> Modificar datos personales </a></li>
                        <li><a href="registroViaje.jsp"><span class="fa fa-list pull-right"></span> Registrar Viaje  </a></li>
                        <li class="divider"></li>
                        <li><a href="#"><span class="fa fa-warning pull-right"></span>Report this user for spam *</a></li>
                        <!-- <li class="divider"></li>
                        <li><a href="#" class="btn disabled" role="button"> Unfollow </a></li>  -->
                      </ul>
                    </div>
                </div>
            </div>
    	 </div>                 
		</div>
	</div>
</div>

</body>
</html>