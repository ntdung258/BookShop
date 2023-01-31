<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Left column -->
<div class="templatemo-flex-row">
	<div class="templatemo-sidebar">
		<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/imageProfile.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/nav-left.jsp"%>
	</div>
	<div class="templatemo-content col-1 light-gray-bg">
		<div class="text-center">
			<h2 class="product-titte">List accounts</h2>
		</div>
		<div class="templatemo-content-container">
			<div class="templatemo-content-widget no-padding">
				<div class="panel panel-default table-responsive">
					<div class="search-custom">
						<!-- Search box -->
						<form action="/BookShop/admin/account/search-account/">
							<div>
								<input type="text" placeholder="" name="key" value="${key }">
								<button>
									<span>Search</span>
								</button>
							</div>
						</form>
					</div>
					<table
						class="table table-bordered templatemo-user-table table-striped text-center">
						<thead>
							<tr>
								<td><a href="" class="white-text templatemo-sort-by">No</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Id</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Image</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Email</a></td>
								<td><a href="" class="white-text templatemo-sort-by">FullName</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Role</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Status</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Edit</a></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listUser }" var="user" varStatus="stt">
								<tr>
									<td class="small-text width-10"><i>${stt.index+1 }</i></td>
									<th class="text-center">${user.id }</th>
									<td><c:if
											test="${user.gender == 'nam' && user.userImage == null }">
											<img
												class="media-object img-circle templatemo-img-bordered img-table"
												src="<c:url value="/resource/images/avatar-default-male.jpg" />">
										</c:if> <c:if
											test="${user.gender == 'nu' && user.userImage == null }">
											<img
												class="media-object img-circle templatemo-img-bordered img-table"
												src="<c:url value="/resource/images/avatar-default-female.jpg" />">
										</c:if> <c:if test="${user.userImage != null }">
											<img
												class="media-object img-circle templatemo-img-bordered img-table"
												src="<c:url value="/resource/images/users/${user.userImage}" />">
										</c:if></td>
									<td>${user.email }</td>
									<td>${user.fullname }</td>
									<c:if test="${user.userRole == 'ROLE_ADMIN'}">
										<td>ADMIN</td>
									</c:if>
									<c:if test="${user.userRole == 'ROLE_USER'}">
										<td>USER</td>
									</c:if>
									<c:if test="${user.userRole == 'ROLE_EMPLOYEE'}">
										<td>EMPLOYEE</td>
									</c:if>
									<c:if test="${user.status == true}">
										<td><div class="circle btn-success box-center"></div></td>
									</c:if>
									<c:if test="${user.status == false}">
										<td><div class="circle btn-danger box-center"></div></td>
									</c:if>
									<td><a type="button"
										href="/BookShop/admin/account/view-update-account/${user.id }"
										class="btn btn-info"><i class="fas fa-edit"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<c:if test="${success != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Update account success', 'success')
		}
	</script>
</c:if>