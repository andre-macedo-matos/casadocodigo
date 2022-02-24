<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<customTags:pageTemplate bodyClass="cart" title="Welcome">
	<jsp:body>
		<h1><spring:message code="hello.world" /></h1>
	</jsp:body>
</customTags:pageTemplate>
