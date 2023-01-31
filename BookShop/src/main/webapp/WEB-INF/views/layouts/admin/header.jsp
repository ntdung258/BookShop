<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header class="templatemo-site-header">
	<h1>
		<a class="a-icon-header" href="<c:url value="/home" />"><i class="fa fa-home fa-fw"></i></a>&emsp;
		<a class="a-icon-header" href="<c:url value="/account/view-account" />"><i class="fas fa-user-cog"></i></a>&emsp;
		<a class="a-icon-header" href="<c:url value="/admin/bill/view-bill-wait-confirm" />"><i class="fa fa-spinner"></i><span>${countWait }</span></a>&emsp;
		<a class="a-icon-header" href="<c:url value="/admin/bill/view-bill-delivering" />"><i class="fa fa-truck"></i><span>${countDelivery }</span></a>&emsp;
	</h1>
</header>