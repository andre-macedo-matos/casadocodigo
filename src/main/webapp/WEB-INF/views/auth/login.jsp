<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<customTags:pageTemplate contextPath="${pageContext.request.contextPath}/" title="Login">
	<jsp:body>
		<form:form class="main-login">
	
			<label for="username">Login</label>
			<input type="text" id="username" name="username" value="">
		
			<label for="password">Senha</label>
			<input type="password" id="password" name="password">
		
		
			<input class="main-button --submit" type="submit" name="submit" value="Login">
		</form:form>
	</jsp:body>
</customTags:pageTemplate>