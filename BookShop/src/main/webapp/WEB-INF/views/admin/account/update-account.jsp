<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!-- Left column -->
<div class="templatemo-flex-row">
	<div class="templatemo-sidebar">
		<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/imageProfile.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/nav-left.jsp"%>
	</div>

	<div class="templatemo-content-container col-1 light-gray-bg">
		<div class="text-center">
			<h2 class="product-titte">Account detail</h2>
		</div>
		<c:if test="${updateAccountFail != null }">
				<div class="text-center pt mt">
					<h3 class="alert alert-danger">${updateAccountFail }</h3>
				</div>
			</c:if>
		<div class="templatemo-flex-row flex-content-row mt pt">
			<div class="templatemo-content-widget bg-warning col-2">
				<div class="table-responsive mt pt">
					<table class="table">
						<tbody>
							<tr>
								<c:if test="${user.status == true}">
									<td><div class="circle btn-success"></div></td>
								</c:if>
								<c:if test="${user.status == false}">
									<td><div class="circle btn-danger"></div></td>
								</c:if>
								<td><strong>Email:</strong></td>
								<td><i>${user.email }</i></td>
							</tr>
							<tr>
								<c:if test="${user.status == true}">
									<td><div class="circle btn-success"></div></td>
								</c:if>
								<c:if test="${user.status == false}">
									<td><div class="circle btn-danger"></div></td>
								</c:if>
								<td><strong>Phone:</strong></td>
								<td><i>${user.phone }</i></td>
							</tr>
							<tr>
								<c:if test="${user.status == true}">
									<td><div class="circle btn-success"></div></td>
								</c:if>
								<c:if test="${user.status == false}">
									<td><div class="circle btn-danger"></div></td>
								</c:if>
								<td><strong>Gender:</strong></td>
								<c:if test="${user.gender == 'nam' }">
									<td><i>male</i></td>
								</c:if>
								<c:if test="${user.gender == 'nu' }">
									<td><i>female</i></td>
								</c:if>
							</tr>
							<tr>
								<c:if test="${user.status == true}">
									<td><div class="circle btn-success"></div></td>
								</c:if>
								<c:if test="${user.status == false}">
									<td><div class="circle btn-danger"></div></td>
								</c:if>
								<td><strong>Birthday:</strong></td>
								<td><i><fmt:formatDate pattern="dd-MM-yyyy"
											value="${user.birthday }" /></i></td>
							</tr>
							<tr>
								<c:if test="${user.status == true}">
									<td><div class="circle btn-success"></div></td>
								</c:if>
								<c:if test="${user.status == false}">
									<td><div class="circle btn-danger"></div></td>
								</c:if>
								<td><strong>Address:</strong></td>
								<td style="height: 100px"><i>${user.address }</i></td>
							</tr>
							<tr>
								<c:if test="${user.status == true}">
									<td><div class="circle btn-success"></div></td>
									<td><strong>Status account:</strong></td>
									<td><i>Active</i></td>
								</c:if>
								<c:if test="${user.status == false}">
									<td><div class="circle btn-danger"></div></td>
									<td><strong>Status account:</strong></td>
									<td><i>Deactive</i></td>
								</c:if>


							</tr>
						</tbody>
					</table>
					<div class="fr mr mt pt">
						<a class="btn btn-warning" onClick="showModalEditStatusAccount()"><strong>Edit
						</strong></a>
					</div>
				</div>
			</div>
			<div
				class="templatemo-content-widget white-bg col-1 text-center templatemo-position-relative">
				<c:if test="${user.gender == 'nam' && user.userImage == null }">
					<img
						src="<c:url value="/resource/images/avatar-default-male.jpg" />"
						alt="Bicycle" class="img-circle img-thumbnail margin-bottom-30">
				</c:if>

				<c:if test="${user.gender == 'nu' && user.userImage == null }">
					<img
						src="<c:url value="/resource/images/avatar-default-female.jpg" />"
						alt="Bicycle" class="img-circle img-thumbnail margin-bottom-30">
				</c:if>
				<c:if test="${user.userImage != null }">
					<img
						src="<c:url value="/resource/images/users/${user.userImage}" />"
						alt="Bicycle" class="img-circle img-thumbnail margin-bottom-30">
				</c:if>
				<h2 class="text-uppercase blue-text margin-bottom-5">${user.fullname}</h2>
				<h3 class="text-uppercase margin-bottom-70">
					<c:if test="${user.userRole == 'ROLE_ADMIN'}">
						Admin
					</c:if>
					<c:if test="${user.userRole == 'ROLE_USER'}">
						User
					</c:if>
					<c:if test="${user.userRole == 'ROLE_EMPLOYEE'}">
						Employee
					</c:if>
				</h3>
			</div>
		</div>
	</div>
</div>


<!-- Modal edit status account -->
<div class="modal fade" id="modal-edit-status-account" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Edit account</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form:form action="/BookShop/admin/account/update-account"
				modelAttribute="user" method="post">
				<div class="modal-body text-center">

					<input type="hidden" value="${user.id }" name="id">
					<div class="row">
						<div class="col-md-6" style="border-right: 1px solid black;">
							<div>
								<h2>Status</h2>
								<div class="templatemo-inline-block margin-bottom-5 mt">
									<form:radiobutton path="status" value="true" />
									<label for="r1" class="font-weight-400"><span></span>Activity
									</label>
								</div>
								&ensp; &emsp; &emsp;
								<div class="templatemo-inline-block margin-bottom-5 mt">
									<form:radiobutton path="status" value="false" />
									<label for="r1" class="font-weight-400"><span></span>Deactivity</label>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div>
								<h2>Role</h2>
								<div class="templatemo-inline-block margin-bottom-5 mt">
									<form:radiobutton path="userRole" value="ROLE_ADMIN" />
									<label for="r1" class="font-weight-400"><span></span>Admin
									</label>
								</div>
								&ensp; &emsp;
								<div class="templatemo-inline-block margin-bottom-5 mt">
									<form:radiobutton path="userRole" value="ROLE_EMPLOYEE" />
									<label for="r1" class="font-weight-400"><span></span>Employee</label>
								</div>
								&ensp; &emsp;
								<div class="templatemo-inline-block margin-bottom-5 mt">
									<form:radiobutton path="userRole" value="ROLE_USER" />
									<label for="r1" class="font-weight-400"><span></span>User</label>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">
						<i class="fas fa-edit"></i>
					</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						<i class="fas fa-window-close"></i>
					</button>
				</div>
			</form:form>
		</div>
	</div>
</div>



<script>
	function showModalEditStatusAccount() {
		$("#modal-edit-status-account").modal("show");
	}
</script>
