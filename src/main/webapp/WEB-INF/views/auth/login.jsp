<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	
	<link rel="stylesheet" href="./resources/css/reset.css">
	<link rel="stylesheet" href="./resources/css/main-login.css">
	<link rel="stylesheet" href="./resources/css/main-wrapper.css">
	<link rel="stylesheet" href="./resources/css/main-button.css">
	
	<title>Entrar</title>
</head>
<body>
	<form:form class="main-login">

		<label for="username">User</label>
		<input type="text" id="username" name="username" value="">
	
		<label for="password">Password</label>
		<input type="password" id="password" name="password">
	
	
		<input class="main-button --submit" type="submit" name="submit" value="Login">
	</form:form>
</body>
</html>