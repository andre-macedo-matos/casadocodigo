<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<header id="layout-header">
	<div class="clearfix container">
		<a href="/" id="logo"> </a>
		<div id="header-content">
			<nav id="main-nav">
				<ul class="clearfix">
z
<%-- 					<li><a href="${spring:mvcUrl('SCC#items').build()}" --%>
					<li><a href=""
						rel="nofollow">Seu carrinho (${shoppingCart.quantity}) </a></li>

					<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre n�s </a></li>

					<li><a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas
							Frequentes </a></li>

					<li><a href="<c:url value="/produtos?locale=pt"/>">Portugu�s</a>
					</li>
					<li><a href="<c:url value="/produtos?locale=en_US"/>">Ingl�s</a>
					</li>

				</ul>
			</nav>
		</div>
	</div>
</header>
<nav class="categories-nav">
	<ul class="container">
		<li class="category"><a href="http://www.casadocodigo.com.br">Home</a>
		<li class="category"><a href="/collections/livros-de-agile">
		</a>
		<li class="category"><a href="/collections/livros-de-front-end">
				
		</a>
		<li class="category"><a href="/collections/livros-de-games">
				
		</a>
		<li class="category"><a href="/collections/livros-de-java"> 
		</a>
		<li class="category"><a href="/collections/livros-de-mobile">
				
		</a>
		<li class="category"><a
			href="/collections/livros-desenvolvimento-web"> 
		</a>
		<li class="category"><a href="/collections/outros"> 
	</ul>
</nav>