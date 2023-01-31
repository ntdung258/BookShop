<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Login</title>
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="/BookShop/resource/images/parallax/bgparallax-07.jpg">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Login</h1>
					<ol class="tg-breadcrumb">
						<li><a href="javascript:void(0);">home</a></li>
						<li class="tg-active">Login</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="text-align: center; margin-bottom: 20px">
	<span style="color: red">${errorLogin }</span> <span style="color: red">${lockedAccount }</span>
</div>

<main id="tg-main" class="tg-main tg-haslayout mgtop">
	<section class="vh-100">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-9">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<form:form action="/BookShop/account/login" method="post"
										modelAttribute="user" id="form_login_user"
										onsubmit="return formLoginValidate()">
										<div class="row align-items-center py-3">
											<div class="col-md-3 ps-5">
												<h6 class="mb-0">
													<strong>Email :</strong>
												</h6>
											</div>
											<div class="col-md-9 pe-5">
												<form:input path="email" type="text"
													class="form-control form-control-lg"
													placeholder="example@gmail.com" id="email" name="email" />
												<span class="err" id="errEmail"></span>
											</div>
										</div>

										<hr class="mx-n3">

										<div class="row align-items-center pt-4 pb-3">
											<div class="col-md-3 ps-5">
												<h6 class="mb-0">
													<strong>Password :</strong>
												</h6>
											</div>
											<div class="col-md-9 pe-5">
												<form:password path="password"
													class="form-control form-control-lg" id="password"
													name="pasword" onblur="checkPassword()" />
												<span class="err" id="errPassword"></span>
											</div>
										</div>
										<div class="px-5 py-4"
											style="text-align: center; margin: 30px;">
											<button type="submit" class="btn btn-primary btn-lg">Submit</button>
											<div style="margin: 20px;">
												<a href="<c:url value="/account/view-register" />">Do
													not have an account? Register</a>
											</div>
										</div>

										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form:form>
								</div>
								<div class="col-md-3"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
</body>




