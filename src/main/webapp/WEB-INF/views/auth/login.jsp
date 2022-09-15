<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./resources/css/reset.css">
<link rel="stylesheet" href="./resources/css/main-login.css">
<link rel="stylesheet" href="./resources/css/main-wrapper">
<title>Entrar</title>
</head>
<body>
	<form:form class="main-login">

		<label for="username">User</label>
		<input type="text" id="username" value="">
	
		<label for="password">Password</label>
		<input type="password" id="password">
	
	
		<input type="submit" name="submit" value="Login">
	</form:form>
</body>
</html>