<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entrar</title>
</head>
<body>
	<form:form>
		<div>
			<label>User</label>
			<input type="text" name="username" value="">
		</div>
		<div>
			<label>Password</label>
			<input type="password" name="password">
		</div>
		<div>
			<input type="submit" name="submit" value="Login">
		</div>
	</form:form>
</body>
</html>