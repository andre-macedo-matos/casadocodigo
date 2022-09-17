<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<customTags:pageTemplate bodyClass="cart" title="Welcome">
	<jsp:body>
		<section class="main-section">
			<h1 class="title"><spring:message code="hello.world" /></h1>
		</section>
	</jsp:body>
</customTags:pageTemplate>
