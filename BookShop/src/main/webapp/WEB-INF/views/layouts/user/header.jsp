<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!--************************************
				Header Start
		*************************************-->
<header id="tg-header" class="tg-header tg-haslayout">
	<div class="tg-middlecontainer">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<strong class="tg-logo"> <a href="<c:url value="/home" />">
							<img src="<c:url value="/resource/images/logoo.gif" />"
							alt="company name here">
					</a>
					</strong>
					<div class="tg-userlogin">
						<c:if test="${not empty userLogin }">
							<c:if
								test="${userLogin.gender == 'nam' && userLogin.userImage == null }">
								<figure>
									<a href="javascript:void(0);"><img
										src="<c:url value="/resource/images/avatar-default-male.jpg" />"
										alt="image description"></a>
								</figure>
							</c:if>
							<c:if
								test="${userLogin.gender == 'nu' && userLogin.userImage == null }">
								<figure>
									<a href="javascript:void(0);"><img
										src="<c:url value="/resource/images/avatar-default-female.jpg" />"
										alt="image description"></a>
								</figure>
							</c:if>
							<c:if test="${userLogin.userImage != null }">
								<figure>
									<a href="javascript:void(0);"><img
										src="<c:url value="/resource/images/users/${userLogin.userImage}" />"
										alt="image description"></a>
								</figure>
							</c:if>
							<div class="dropdown tg-themedropdown tg-currencydropdown">
								<a href="<c:url value="/account/view-account" />"
									id="tg-currenty" class="tg-btnthemedropdown limit-character"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <span>Hi ,
										${userLogin.fullname }</span>
								</a>
								<ul class="dropdown-menu tg-themedropdownmenu"
									aria-labelledby="tg-currenty">
									<li><a href="<c:url value="/account/view-account" />">Account
											Information</a></li>
									<li><a
										href="<c:url value="/account/view-order-history" />">Order
											History</a></li>

									<c:if test="${userLogin.userRole == 'ROLE_ADMIN' || userLogin.userRole == 'ROLE_EMPLOYEE' }">
										<li><a href="/BookShop/admin/home/view-home">Admin</a></li>
									</c:if>

									<li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
								</ul>
							</div>
						</c:if>
					</div>
					<div class="tg-wishlistandcart">
						<div class="dropdown tg-themedropdown tg-minicartdropdown">
							<a href="<c:url value="/cart/view-cart" />"
								class="tg-btnthemedropdown"> <span class="tg-themebadge"
								id="totalQuantity">${totalQuantity }</span> <i class="icon-cart"></i>
							</a>
						</div>
						<c:if test="${empty userLogin }">
							<div class="tg-themedropdown tg-wishlistdropdown">
								<a href="<c:url value="/account/view-login" />"
									id="tg-wishlisst" class="tg-btnthemedropdown"
									aria-haspopup="true" aria-expanded="false"><i
									class="icon-user"></i> </a>
							</div>
						</c:if>

					</div>
					<div class="tg-searchbox">
						<form class="tg-formtheme tg-formsearch"
							action="/BookShop/search/view-search">
							<fieldset>
								<input type="text" name="search" class="typeahead form-control"
									value="${name }" placeholder="Search by name,author...">
								<button type="submit">
									<i class="icon-magnifier"></i>
								</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tg-navigationarea">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<nav id="tg-nav" class="tg-nav">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#tg-navigation"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div id="tg-navigation"
							class="collapse navbar-collapse tg-navigation">
							<ul>
								<li
									class="menu-item-has-children menu-item-has-mega-menu ${activePage=='category'}-active">
									<a href="">All Categories</a>
									<ul class="sub-menu">
										<c:forEach items="${listCategory }" var="categorys">
											<li class="current-menu-item"><a
												href="<c:url value="/category/view-category/${categorys.id }"/>">${categorys.categoryName }</a></li>
										</c:forEach>
									</ul>
								</li>
								<li class="${activePage=='home'}-active"><a
									href="<c:url value="/home" />">Home</a></li>
								<li class="${activePage=='author'}-active"><a
									href="<c:url value="/author/view-author" />">Authors</a></li>
								<li class="${activePage=='product'}-active"><a
									href="<c:url value="/product/view-product" />">Product</a></li>
								<li class="${activePage=='contact'}-active"><a
									href="<c:url value="/contact" />">Contact</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>
<!--************************************
				Header End
		*************************************-->
