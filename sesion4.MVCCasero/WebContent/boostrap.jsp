    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
<!-- Codigo js para habilitar los mensajes de error -->
$(function() {
	$('[data-toggle="tooltip"]').tooltip()
})
	
	$(document).ready(function() {

		$(".update-close").click(function() {
			$(this).parent().parent().hide();
		});

	});
</script>