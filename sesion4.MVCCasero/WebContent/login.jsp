<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	
	<!-- BOOSTRAP -->
	<%@ include file="boostrap.jsp" %>
	
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

	<%@ include file="menu.jsp"%>
	
	<a id="listarViajes" href="listarViajes">Lista de viajes</a>
</body>
</html>