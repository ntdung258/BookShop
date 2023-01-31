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
				<div
					class="col-md-9 border-ac form-account-edit float-right ptb bg-xam ">
					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 pb pd-l-100">
							<h6 class="mb-0">
								<strong>Email :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<span> <i>${user.email }</i>
							</span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 pd-l-100 pb">
							<h6 class="mb-0">
								<strong>Full Name :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<span> <i>${user.fullname }</i>
							</span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 pd-l-100 pb">
							<h6 class="mb-0">
								<strong>Phone :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<span> <i>${user.phone }</i>
							</span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 pd-l-100 pb">
							<h6 class="mb-0">
								<strong>Gender :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">

							<span> <i>${user.gender }</i>
							</span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 pd-l-100 pb">
							<h6 class="mb-0">
								<strong>Birthday :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<span> <i><fmt:formatDate value="${user.birthday }"
										pattern="dd-MM-yyyy" /></i>
							</span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 pd-l-100 pb">
							<h6 class="mb-0">
								<strong>Address :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<span> <i>${user.address }</i>
							</span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5 text-center pb float-right">
							<a class="btn btn-primary" type="button"
								onClick="modalEditAccout()">Edit</a>
						</div>
					</div>
				</div>

				<div class="col-md-2 border-ac float-left">
					<aside id="tg-sidebar" class="tg-sidebar">
						<div class="tg-widget tg-catagories pb">
							<c:if test="${user.gender == 'nam' && user.userImage == null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center avatar-account"
									id="">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/avatar-default-male.jpg" />">
								</div>
							</c:if>

							<c:if test="${user.gender == 'nu' && user.userImage == null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center avatar-account"
									id="">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/avatar-default-female.jpg" />">
								</div>
							</c:if>
							<c:if test="${user.userImage != null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center avatar-account"
									id="">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/users/${user.userImage}" />">
								</div>
							</c:if>

							<div class="pb text-center">
								<button class="btn btn-primary" onClick="modalUploadImage()">
									<i>Upload image</i>
								</button>
							</div>
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



<!-- Modal Edit Account -->
<div class="modal fade" id="modalEditAccount" tabindex="-1"
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
			<form:form action="/BookShop/account/update-account"
				modelAttribute="user" method="post"
				onsubmit="return formEditAccount()" enctype="multipart/form-data">
				<form:input path="id" type="hidden"
					class="form-control form-control-lg" value="${user.id }" />
				<div class="modal-body">
					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5  pb pd-l-80">
							<h6 class="mb-0">
								<strong>Full Name :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<form:input path="fullname" type="text"
								class="form-control form-control-lg" value="${user.fullname }"
								id="fullname" />
							<span id="errFullName" class="err"></span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5  pb pd-l-80">
							<h6 class="mb-0">
								<strong>Phone :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<form:input path="phone" type="text"
								class="form-control form-control-lg" value="${user.phone }" />
							<span id="errPhone" class="err"></span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5  pb pd-l-80">
							<h6 class="mb-0">
								<strong>Gender :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<form:radiobutton path="gender" value="nam" />
							Nam &emsp;
							<form:radiobutton path="gender" value="nu" />
							Nữ
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5  pb pd-l-80">
							<h6 class="mb-0">
								<strong>Birthday :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"
								var="birthday" />
							<form:input path="birthday" type="date"
								class="form-control form-control-lg" value="${birthday }" />
							<span id="errBirthday" class="err"></span>
						</div>
					</div>

					<div class="row align-items-center py-3">
						<div class="col-md-4 ps-5  pb pd-l-80">
							<h6 class="mb-0">
								<strong>Address :</strong>
							</h6>
						</div>
						<div class="col-md-7 pe-5 pb">
							<form:textarea path="address" class="form-control form-control-lg" value="${user.address }" />
							<span id="errAddress" class="err"></span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="submit-edit-account" type="submit"
						class="btn btn-warning">Save</button>
					<button class="btn btn-success" data-dismiss="modal">Cancel</button>
				</div>
			</form:form>
		</div>
	</div>
</div>





<!-- Modal upload Image -->
<div class="modal fade" id="modalUploadImage" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Upload image</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/account/edit-avatar" method="post"
				enctype="multipart/form-data" onsubmit="return formEditAvatar()">
				<div class="modal-body text-center">
					<a class="btn btn-primary" id="uploadAvatar">Upload image</a> <input
						style="display: none;" type="file" id="inputAvatar"
						name="imageSource" accept="image/png, image/jpeg">
					<c:if test="${user.gender == 'nam' && user.userImage == null }">
						<div
							class="templatemo-content-widget white-bg col-1 text-center avatar-account"
							id="holder">
							<img class="avatar-circle"
								src="<c:url value="/resource/images/avatar-default-male.jpg" />">
						</div>
					</c:if>

					<c:if test="${user.gender == 'nu' && user.userImage == null }">
						<div
							class="templatemo-content-widget white-bg col-1 text-center avatar-account"
							id="holder">
							<img class="avatar-circle"
								src="<c:url value="/resource/images/avatar-default-female.jpg" />">
						</div>
					</c:if>
					<c:if test="${user.userImage != null }">
						<div
							class="templatemo-content-widget white-bg col-1 text-center avatar-account"
							id="holder">
							<img class="avatar-circle"
								src="<c:url value="/resource/images/users/${user.userImage}" />">
						</div>
					</c:if>
					<span id="errSize" class="err"></span>

				</div>
				<div class="modal-footer">
					<button id="updateProduct" type="submit" class="btn btn-success">
						Save</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						Cancel</button>
				</div>
			</form>
		</div>
	</div>
</div>





<script>
	 function formEditAccount(){
		var currentDate = new Date();
		var birthday = document.getElementById("birthday").value;
		var birthday1 = new Date(birthday);
		var errBirthday = document.getElementById("errBirthday");
		if (birthday == null || birthday == "") {
			errBirthday.innerHTML = "Birthday not empty";
		}else if(birthday1 > currentDate){
			errBirthday.innerHTML = "Birthday can't pass the current date ";
		}else{
			errBirthday.innerHTML = "";
		}

		var fullname = document.getElementById("fullname").value;
		var errFullName = document.getElementById("errFullName");
		if (fullname == null || fullname == "") {
			errFullName.innerHTML = "FullName not empty";
		} else {
			errFullName.innerHTML = "";
		}

		var phone = document.getElementById("phone").value;
		var errPhone = document.getElementById("errPhone");
		var regPhone = /0\d{9}/;
		if (phone == null || phone == "") {
			errPhone.innerHTML = "Phone not empty";
		} else if (!phone.match(regPhone)) {
			errPhone.innerHTML = "Phone Invalid";
		} else {
			errPhone.innerHTML = "";
		}

		var address = document.getElementById("address").value;
		var errAddress = document.getElementById("errAddress");
		if (address == null || address == "") {
			errAddress.innerHTML = "Address not empty";
		} else {
			errAddress.innerHTML = "";
		}

		var errSize = document.getElementById("errSize");
		
		if (errBirthday.innerHTML == "" && errFullName.innerHTML == ""
				&& errPhone.innerHTML == "" && errAddress.innerHTML == ""
				&& errSize.innerHTML == "") {
			return true;	
		}
		return false;
	} 
	
	
	function modalEditAccout() {
		$('#modalEditAccount').modal("show");
		
	}
	
	function modalUploadImage() {
		$('#modalUploadImage').modal("show");
		
	}
	
	function formEditAvatar(){
		var errSize = document.getElementById("errSize");

		if (errSize.innerHTML == "") {
			return true;
		}
		return false;

	}

	$('#uploadAvatar').click(function() {
		$('#inputAvatar').click();
	});

	/* Display image before upload */
	$(document).ready(()=>{
	      $('#inputAvatar').change(function(){
	        const file = this.files[0];
	        console.log(file);
	        if (file){
	          let reader = new FileReader();
	          reader.onload = function(event){
	           	var srcData = event.target.result;
	           	var newImage = document.createElement('img');
	           	newImage.src = srcData;
	           	newImage.className = "avatar-circle";
	           	document.getElementById('holder').innerHTML = newImage.outerHTML;
	          }
	          reader.readAsDataURL(file);
	        }
	      });
	    });

	//Validate size input= file
	var uploadField = document.getElementById("inputAvatar");
	uploadField.onchange = function() {
		var extension = this.files[0].type;
	    if(this.files[0].size > 5242880){
	    	var errSize = document.getElementById("errSize");
	    	document.getElementById("errSize").innerHTML = "File is too big ";
	    }else if(extension != "image/png" && extension != "image/jpeg"){
	    	alert(extension);
	    	document.getElementById("errSize").innerHTML = "File is in the wrong format";
	    }
	    else{
	    	document.getElementById("errSize").innerHTML = "";
	    }; 
	}; 
</script>

<c:if test="${updateAccountSuccess != null }">
	<script>
		window.onload = function() {
			swal('Update account success', '', 'success')
		}
	</script>
</c:if>