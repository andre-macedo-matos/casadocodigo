<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<customTags:pageTemplate contextPath="./" title="Welcome">
	<jsp:body>
		<h1 class="title"><spring:message code="hello.world" /></h1>
	</jsp:body>
</customTags:pageTemplate>
