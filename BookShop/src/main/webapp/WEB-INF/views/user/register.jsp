<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Register</title>
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="<c:url value="/resource/images/parallax/bgparallax-07.jpg" />">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Register</h1>
					<ol class="tg-breadcrumb">
						<li><a href="javascript:void(0);">home</a></li>
						<li class="tg-active">Register</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>


<div style="text-align: center; margin-bottom: 20px">
	<span class="err" id="errorRegister">${errorRegister }</span>
</div>

<main id="tg-main" class="tg-main tg-haslayout mgtop">
	<section class="vh-100">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-9">
					<div class="card">
						<div class="card-body">
							<form:form action="/BookShop/account/register" method="post"
								modelAttribute="user" onsubmit="return formRegisterValidate()">
								<div class="row cancel-order">
									<div class="col-md-5">
										<div class="row align-items-center py-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>Email</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:input path="email" type="text"
													class="form-control form-control-lg"
													placeholder="example@gmail.com" id="email" />
												<span class="err" id="errorEmailDuplicate">${errorEmail }</span>
												<span id="errEmail" class="err"></span>
											</div>
										</div>
										<hr class="mx-n3">
										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>Password</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:password path="password"
													class="form-control form-control-lg" id="password" />
												<span id="errPassword" class="err"></span>
											</div>
										</div>
										<hr class="mx-n3">
										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>ConfirmPassword</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:password path="" class="form-control form-control-lg"
													id="conPassword" />
												<span id="errConPassword" class="err"></span>
											</div>
										</div>
										<hr class="mx-n3">
										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>Gender</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:radiobutton path="gender" value="nam"
													checked="checked" />
												Nam
												&emsp; <form:radiobutton path="gender" value="nu" />
												Nữ
											</div>
										</div>
										<hr class="mx-n3">
										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>Birthday</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:input path="birthday" type="date"
													class="form-control form-control-lg" />
												<span id="errBirthday" class="err"></span>
											</div>
										</div>
									</div>

									<div class="col-md-2"></div>
									<div class="col-md-5">

										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>FullName</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:input path="fullname" type="text"
													class="form-control form-control-lg" id="fullname" />
												<span id="errFullName" class="err"></span>
											</div>
										</div>
										<hr class="mx-n3">
										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>Phone</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:input path="phone" type="text"
													class="form-control form-control-lg" id="phone" />
												<span id="errPhone" class="err"></span>
											</div>
										</div>
										<hr class="mx-n3">
										<div class="row align-items-center py-3">
											<div class="col-md-4 ps-5">
												<h6 class="mb-0">
													<strong>Address</strong>(*)
												</h6>
											</div>
											<div class="col-md-8 pe-5">
												<form:textarea path="address" class="form-control" rows="2"
													id="address" />
												<span id="errAddress" class="err"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="px-5 py-4" style="text-align: center; margin: 30px;">
									<button type="submit" class="btn btn-primary btn-lg"
										>Submit</button>
									<div style="margin: 20px;">
										<a href="<c:url value="/account/view-login" />">Do you
											already have an account? Log in</a>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<!-- Modal Success + Chuyển trang -->
<div class="modal fade" id="exampleModalRegisterSuccess" tabindex="-1"
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
			<div class="modal-body text-center"><strong>Register successfully</strong></div>
			<div class="modal-footer">
				<a href="/BookShop/account/view-login" type="button"
					class="btn btn-danger">OK</a>

			</div>
		</div>
	</div>
</div>
<c:if test="${succsessRegister == 'Register success' }">
	<script>
		window.onload = function() {
			$("#exampleModalRegisterSuccess").modal("show");
		}
	</script>
</c:if>
