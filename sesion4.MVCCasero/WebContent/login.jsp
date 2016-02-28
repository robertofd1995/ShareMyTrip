<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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

	<title>ShareMyTrip - Inicio</title>
	
	<script type="text/javascript">
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
		
	$(document).ready(function(){

    $( ".update-close" ).click(function() {
        $(this).parent().parent().hide();
    });

});
	</script>
</head>
<body>

	<%@ include file="menu_publico.jsp"%>
	
	<a id="listarViajes" href="listarViajes">Lista de viajes</a>
</body>
</html>