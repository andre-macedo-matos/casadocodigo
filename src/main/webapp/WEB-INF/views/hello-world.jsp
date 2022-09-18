<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<customTags:pageTemplate contextPath="./" title="Welcome">
	<jsp:body>
		<security:authentication property="principal" var="user"/>
		<security:authorize access="isAuthenticated()">
			<div>
				<h1 class="title"><spring:message code="users.welcome" arguments="${user.name}"/></h1>
			</div>
		</security:authorize>
	</jsp:body>
</customTags:pageTemplate>
