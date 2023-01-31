<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Information-account</title>
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="<c:url value="/resource/images/parallax/bgparallax-07.jpg" />">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Information-account</h1>
					<ol class="tg-breadcrumb">
						<li><a href="<c:url value="/home" />">home</a></li>
						<li class="tg-active">Information-account</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>




<main id="tg-main" class="tg-main tg-haslayout">
	<div class="tg-sectionspace tg-haslayout">
		<div class="container">
			<div class="row">
				<div class="col-md-9 border-ac form-account-edit float-right ptb bg-xam">
					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 text-center pb">
							<h6 class="mb-0">
								<strong>Current password :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<input type="hidden" class="form-control form-control-lg" id="email" value="${userLogin.email }" /> 
							<input
								class="form-control form-control-lg curent-password" id="curent-password" type="password" />
							<span id="errPassword" class="err"></span>
						</div>
					</div>
					<form:form action="/BookShop/account/change-password"
						modelAttribute="user" method="post" id="formChangePassword">
						<div class="row align-items-center py-3">
							<div class="col-md-4 ps-5 text-center pb">
								<h6 class="mb-0">
									<strong>New password :</strong>
								</h6>
							</div>
							<div class="col-md-7 pe-5 pb">
								<form:password path="password"
									class="form-control form-control-lg" id="newPassword" />
								<span id="errNewPassword" class="err"></span>
							</div>
						</div>
						<div class="row align-items-center py-3">
							<div class="col-md-4 ps-5 text-center pb">
								<h6 class="mb-0">
									<strong>Confirm new password :</strong>
								</h6>
							</div>
							<div class="col-md-7 pe-5 pb">
								<form:password path="" class="form-control form-control-lg"
									id="conNewPassword" />
								<span id="errConNewPassword" class="err"></span>
							</div>
						</div>
						<div class="row align-items-center py-3">
							<div class="col-md-4 ps-5 text-center pb float-right">
								<button  class="btn btn-info"
									type="button" onClick="ConfirmChangePassword()">Change</button>
							</div>
						</div>
					</form:form>
				</div>

				<div class="col-md-2 border-ac float-left">
					<aside id="tg-sidebar" class="tg-sidebar">
						<div class="tg-widget tg-catagories pb">
							<c:if
								test="${userLogin.gender == 'nam' && userLogin.userImage == null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center avatar-account"
									id="holder">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/avatar-default-male.jpg" />">
								</div>
							</c:if>

							<c:if
								test="${userLogin.gender == 'nu' && userLogin.userImage == null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center avatar-account"
									id="holder">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/avatar-default-female.jpg" />">
								</div>
							</c:if>
							<c:if test="${userLogin.userImage != null }">

								<div
									class="templatemo-content-widget white-bg col-1 text-center avatar-account"
									id="holder">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/users/${userLogin.userImage}" />">
								</div>
							</c:if>

							<div class="tg-widgetcontent ptb">
								<ul>
									<li class="${activePage=='view-account' }-active"><a
										class="templatemo-sort-by"
										href="<c:url value="/account/view-account" />">Account
											information</a></li>
									<li class="${activePage=='view-order-history' }-active"><a
										class="templatemo-sort-by "
										href="<c:url value="/account/view-order-history" />">Order
											history</a></li>
									<li class="${activePage=='view-change-password' }-active"><a
										class="templatemo-sort-by "
										href="<c:url value="/account/view-change-password" />">Change
											password</a></li>
									<li><a class="templatemo-sort-by"
										href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
								</ul>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- Modal Confirm Edit Account -->
<div class="modal fade" id="modalConfirmChangePassword" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Notification</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="modal-body text-center">
				<strong>Are you sure to change your password, after
					changing you will log out</strong>
			</div>
			<div class="modal-footer">
				<button class="btn btn-warning" id="btnConfirmChangePassword">OK</button>
				<button class="btn btn-success" data-dismiss="modal">NO</button>
			</div>
		</div>
	</div>
</div>

<script>
	$('.curent-password').change(function() {
		var password = document.getElementById("curent-password").value;
		var email = document.getElementById("email").value;
		var errPassword = document.getElementById("errPassword");
		$.ajax({
			type : "GET",
			url : "/BookShop/account/check-password/" + email + "/" +password,
			success : function(data) {
				errPassword.innerHTML="";
			},
			error: function(data) { 
				errPassword.innerHTML="Incorrect password";
		    }       
		});
	});

	function ConfirmChangePassword() {
		var errPassword = document.getElementById("errPassword");
		var password = document.getElementById("curent-password").value;
		var newPassword = document.getElementById("newPassword").value;
		var errNewPassword = document.getElementById("errNewPassword");
		var regPasword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/; //Password it nhất 6 ký tự, có ít nhất 1 số hoặc 1 chữ
		if (newPassword == null || newPassword == "") {
			errNewPassword.innerHTML = "New Password not empty";
		} else if (!newPassword.match(regPasword)) {
			errNewPassword.innerHTML = "New Password must be at least 6 characters, with at least 1 number or 1 letter:VD:123abc";
		} else if (newPassword==password) {
			errNewPassword.innerHTML = "The new password cannot be the same as the current password";
		}  
		else {
			errNewPassword.innerHTML = "";
		}

		var conNewPassword = document.getElementById("conNewPassword").value;
		var errConNewPassword = document.getElementById("errConNewPassword");
		if (conNewPassword != newPassword) {
			errConNewPassword.innerHTML = "New Password is not the same";
		} else {
			errConNewPassword.innerHTML = "";
		}

		if (errPassword.innerHTML == "" && errNewPassword.innerHTML == ""
				&& errConNewPassword.innerHTML == "") {
			$('#modalConfirmChangePassword').modal("show");
			$(document).on('click', '#btnConfirmChangePassword', function() {
				$("#formChangePassword").submit();
			});
		}
		return false;
	}
</script>

