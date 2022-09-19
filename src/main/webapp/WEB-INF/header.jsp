<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<header class="main-header">
	<nav class="main-wrap">
		<img src="https://cdn.shopify.com/s/files/1/0155/7645/t/257/assets/favicon.png?v=133844920260803137631649095163" 
			 alt="logo casa do codigo"
			 class="main-logo">
		<ul class="main-wrap --list">
			<li class="item"><a class="main-button" href="${spring:mvcUrl('PC#list').build()}" rel="nofollow">Produtos</a></li>
			<li class="item">
				<a class="main-button" href="${spring:mvcUrl('SC#items').build()}" rel="nofollow">Seu carrinho (${shoppingCart.quantity})
				</a>
			</li>
			<li class="item"><a class="main-button" href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre n�s </a></li>
			<li class="item"><a class="main-button" href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes </a></li>
			<li class="item"><a class="main-button" href="<c:url value="/produtos?locale=pt"/>">Portugu�s</a></li>
			<li class="item"><a class="main-button" href="<c:url value="/produtos?locale=en_US"/>">Ingl�s</a></li>

		</ul>
	</nav>
</header>
<nav class="main-header --nav">
	<ul class="main-wrap --list">
		<li class="item --nav"><a class="main-button --nav" href="http://www.casadocodigo.com.br">Home</a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}">Produtos</a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.agile" /></a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.front_end" /></a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.games" /></a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.java" /></a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.mobile" /></a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.web"/></a>
		<li class="item --nav"><a class="main-button --nav" href="${spring:mvcUrl('PC#list').build()}"><fmt:message key="navigation.category.others"/></a>
	</ul>
</nav>