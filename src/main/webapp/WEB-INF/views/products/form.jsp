<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de produtos</title>
</head>

<body>
	<form method="post" action="/casadocodigo/produtos">
		<div>
			<label for="title">T�tulo</label>
			<input type="text" name="title" id="title">
		</div>
		
		<div>
			<label for="descripton">Descri��o</label>
			<textarea rows="10" cols="20" id="description"></textarea>
		</div>
		
		<div>
			<label for="pages">N�mero de p�ginas</label>
			<input type="text" name="pages" id="pages">
		</div>
		
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form>
	
</body>
</html>