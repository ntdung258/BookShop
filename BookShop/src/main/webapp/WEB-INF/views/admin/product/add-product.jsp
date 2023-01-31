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
	<!-- Main content -->

	<div class="templatemo-content col-1 light-gray-bg">
		<div class="text-center">
			<h2 class="product-titte">Add product</h2>
		</div>
		<div class="templatemo-content-container">
			<div class="templatemo-content-widget white-bg">
				<span class="mtext-105 cl2 txt-center p-b-30" style="color: red">${error}</span>
				<form:form action="/BookShop/admin/product/add-product"
					class="templatemo-login-form" method="post"
					modelAttribute="product" enctype="multipart/form-data"
					onsubmit="return formAddProductValidate()">
					<div class="row form-group">
						<div class="col-lg-6 col-md-6 form-group">
							<label>Book Name &nbsp;</label> <span id="errBookName"
								class="err"></span>
							<form:input type="text" class="form-control" path="bookName"
								id="bookName" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Publisher &nbsp;</label>
							 <span id="errPublisher"
								class="err"></span>
							<form:input type="text" class="form-control" path="publisher"
								id="publisher" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Price &nbsp; </label>
							<span id="errPrice" class="err"></span>
							<form:input type="number" class="form-control" path="price"
								id="price" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Quantity &nbsp; </label>
							<span id="errQuantity" class="err"></span>
							<form:input type="number" class="form-control" path="quantity"
								id="quantity" />
						</div>

						<div class="col-lg-6 col-md-6 form-group">
							<label>Pages &nbsp; </label>
							<span id="errPages" class="err"></span>
							<form:input type="number" class="form-control" path="pages"
								id="pages" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Publication Date &nbsp; </label>
							<span
								id="errPublicationDate" class="err"></span>
							<form:input type="date" class="form-control"
								path="publicationDate" id="publicationDate" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Language &nbsp; </label>
							<span id="errLanguage" class="err"></span>
							<form:input type="text" class="form-control" path="language"
								id="language" />
						</div>


						<div class="col-lg-6 col-md-6 form-group">
							<label class="control-label templatemo-block">Author</label>
							<form:select class="form-control" path="author">
								<c:forEach items="${authors }" var="authors">
									<form:option value="${authors.id }">${authors.authorName }</form:option>
								</c:forEach>
							</form:select>
						</div>

						<div class="col-lg-6 col-md-6 form-group">
							<label>Image</label> <input type="file" name="imageSource"
								id="photo" required="true" accept="image/png, image/jpeg"> 
								<p class="text-warning">Maximum upload size is 5 MB.</p>  <span
								id="errSize" class="err"></span>
							<div class="holder" id="holder"></div>
						</div>

						<div class="col-lg-6 col-md-6 form-group">
							<label class="control-label templatemo-block">Category</label>
							<form:select class="form-control" path="category">
								<c:forEach items="${categories }" var="categories">
									<form:option value="${categories.id }">${categories.categoryName }</form:option>
								</c:forEach>
							</form:select>
						</div>

					</div>
					<div class="form-group text-right">
						<button type="submit" class="templatemo-blue-button">Add
							new</button>
						<button type="reset" class="templatemo-white-button">Reset</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>