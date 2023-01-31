<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="mobile-menu-icon">
	<i class="fa fa-bars"></i>
</div>
<nav class="templatemo-left-nav">
	<ul>
		<li class="${activePage=='chart-category'}-active"><a
			href="<c:url value ="/admin/home/view-home" />"><i
				class="fa fa-bar-chart fa-fw"></i>Statistical</a></li>
		<li class="${activePage=='product'}-active"><a
			href="<c:url value ="/admin/product/view-product" />"><i
				class="fab fa-product-hunt fa-fw"></i>&emsp;Product</a></li>
		<li class="${activePage=='bill'}-active"><a
			href="/BookShop/admin/bill/view-bill"><i class="fas fa-file-invoice"></i>&emsp;
				Bill</a></li>
		<li class="${activePage=='account'}-active"><a
			href="/BookShop/admin/account/view-account"><i class="fa fa-users fa-fw"></i>Account</a></li>
		<li class="${activePage=='author'}-active"><a
			href="<c:url value="/admin/author/view-author" />"><i
				class="fas fa-pencil-alt"></i>&emsp; Author</a></li>
		<li class="${activePage=='category'}-active"><a
			href="<c:url value="/admin/category/view-category" />"><i
				class="fas fa-list-ol"></i>&emsp;Category</a></li>
		<li><a href="<c:url value="/j_spring_security_logout" />"><i
				class="fas fa-sign-out-alt fa-fw"></i>&emsp;Logout</a></li>
	</ul>
</nav>