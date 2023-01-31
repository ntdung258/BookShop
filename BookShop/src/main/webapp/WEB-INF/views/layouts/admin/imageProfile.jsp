<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="profile-photo-container">
	<%-- <img src="<c:url value="/resource/admin/images/profile-photo.jpg" />"
		alt="Profile Photo" class="img-responsive">
	<div class="profile-photo-overlay"></div> --%>

	<c:if
		test="${userLogin.gender == 'nam' && userLogin.userImage == null }">
		<img src="<c:url value="/resource/images/avatar-default-male.jpg" />"
			alt="Profile Photo" class="img-responsive" style="width:100%">
	</c:if>

	<c:if
		test="${userLogin.gender == 'nu' && userLogin.userImage == null }">
		<img
			src="<c:url value="/resource/images/avatar-default-female.jpg" />"
			alt="Profile Photo" class="img-responsive" style="width:100%">
	</c:if>
	<c:if test="${userLogin.userImage != null }">
		<img src="<c:url value="/resource/images/users/${userLogin.userImage}" />"
			alt="Profile Photo" class="img-responsive" style="width:100%">
	</c:if>
</div>