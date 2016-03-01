<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>ShareMyTrip - Página principal del usuario</title>
</head>
<body>
	<jsp:useBean id="user" class="uo.sdi.model.User" scope="session" />
	<table>
		<tr>
			<td>Login:</td><td id="login"><jsp:getProperty property="login" name="user" /></td>
		</tr>
		<tr>
			<td>Nombre:</td><td id="name"><jsp:getProperty property="name" name="user" /></td>
		</tr>
		<tr>
			<td>Apellidos:</td><td id="surname"><jsp:getProperty property="surname" name="user" /></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td id="email"><form action="modificarDatos" method="POST">
					<input type="text" name="email" size="15"
						value="<jsp:getProperty property="email" name="user"/>"> 
					<input type="submit" value="Modificar">
				</form>
			</td>
		</tr>
	</table>
	<br/>	
	Es Vd el usuario número: ${contador}
</body>
</html>