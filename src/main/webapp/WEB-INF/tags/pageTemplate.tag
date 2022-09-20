<%@ attribute name="title" required="true" %>
<%@ attribute name="contextPath" required="true" %>
<%@ attribute name="scripts" fragment="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="pt"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="pt"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="pt">
<!--<![endif]-->
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="${contextPath}resources/css/reset.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-header.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-logo.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-wrap.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-button.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-section.css">
	
	<link rel="stylesheet" href="${contextPath}resources/css/main-footer.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-form.css">
	
	<link rel="stylesheet" href="${contextPath}resources/css/main-table.css">
	
	<link rel="stylesheet" href="${contextPath}resources/css/main-img.css">
	<link rel="stylesheet" href="${contextPath}resources/css/main-list.css">
	
	<title>${title}</title>
</head>
<body>
	<%@include file="/WEB-INF/header.jsp" %>
	<section class="main-section">
		<jsp:doBody/>
	</section>
	
	<%@include file="/WEB-INF/footer.jsp" %>
	
	<jsp:invoke fragment="scripts"/>
</body>
</html>